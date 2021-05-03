// meter bezel

water_meter_height = 27;
water_meter_length = 46.4;
meter_height = 26.2;
meter_length = 46.2;

// distance from top
glass_blackout = 32;
meter_separation = 32;

bezel_margin = 6;
bezel_thickness = 3;
bezel_height = glass_blackout + 13 + meter_separation + 13 + bezel_margin;
bezel_width = 46 + 2 * bezel_margin;

m4_dia = 4;
m4_pilot = 3.2;
vert_m4_x_offset = (bezel_width - (2*10) - 4 - 10)/2;

mounting_block_thickness = 10;
mounting_block_depth = 10;

$fn = 50;

difference () {
    {
        union () {
        cube([bezel_width, bezel_height, bezel_thickness], center = true);
        
        // mounting block
        translate([0,
            bezel_height/2  - mounting_block_thickness/2,
            bezel_thickness/2 + mounting_block_depth/2])
        cube([bezel_width - 2 * 10 - 4, mounting_block_thickness, mounting_block_depth], center = true);
        }
    }
    {
        // top meter
        // water temp
        translate([0, bezel_height/2 - glass_blackout - water_meter_height/2, 0])
        cube([water_meter_length, water_meter_height, bezel_thickness], center = true);
        
        translate([0, bezel_height/2 - glass_blackout - water_meter_height/2, 0])
        cube([47.7, 6, bezel_thickness], center = true);
        
        // bottom meter
        // air temp
        translate([0, 
            bezel_height/2 - glass_blackout - meter_height/2 - meter_separation, 
            0])
        cube([meter_length, meter_height, bezel_thickness], center = true);
        
        // mounting relief
        translate([0, 
            bezel_height/2 - glass_blackout - meter_height/2 - meter_separation, 
            0])
        cube([47.5, 6, bezel_thickness], center = true);       
        
        // mounting holes
        // - bezel to plate - vertical holes
        // THREAD
        translate([vert_m4_x_offset,
            bezel_height/2 - bezel_thickness - 4/2,
            bezel_thickness/2 + mounting_block_depth/2])
        rotate([90,0,0])
        cylinder(r = m4_pilot/2, h = mounting_block_thickness, center = true);
        
        translate([-vert_m4_x_offset,
            bezel_height/2 - bezel_thickness - 4/2,
            bezel_thickness/2 + mounting_block_depth/2])
        rotate([90,0,0])
        cylinder(r = m4_pilot/2, h = mounting_block_thickness, center = true);
        
        // - bezel to plate - horizontal holes
        // PASS-THRUE
        translate([bezel_width/2 - 10/2,
            bezel_height/2  - 10/2,
            0])
        cylinder(r = m4_dia/2, h = 4, center = true);
        
        translate([-(bezel_width/2 - 10/2),
            bezel_height/2  - 10/2,
            0])
        cylinder(r = m4_dia/2, h = 4, center = true);
    }
}