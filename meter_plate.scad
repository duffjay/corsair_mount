// meter plate
//  the mounting plate for the meter bezel
//  sits horizontally at top of case

// thread the mounting block
// pass-through the plate (vertically

rail_width = 20;

plate_x = 46 + 12;
plate_y = 8 + rail_width + 8;
plate_z = 3;

mounting_block_x = 10;
mounting_block_y = 8;
mounting_block_z = 10;

bezel_thickness = plate_z;

m4_pilot = 3.2;
m4_dia = 4;

vert_m4_x_offset = (plate_x - (2*10) - 4 - 10)/2;

$fn = 50;

difference () {
    {
    union () {
        cube([plate_x, plate_y, plate_z], center = true);
        
        // mounting block
        translate([-plate_x/2 + mounting_block_x/2,
            -plate_y/2 + bezel_thickness + mounting_block_y/2,
            plate_z/2 +  mounting_block_z/2])
        cube([mounting_block_x, mounting_block_y, mounting_block_z], center = true);
        
        // mounting block
        translate([plate_x/2 - mounting_block_x/2,
            -plate_y/2 + bezel_thickness + mounting_block_y/2,
            plate_z/2 +  mounting_block_z/2])
        cube([mounting_block_x, mounting_block_y, mounting_block_z], center = true);
        }
    }
    // subtract
    {
        // threaded mounting holes
        translate([-(plate_x/2 - mounting_block_x/2),
            -(plate_y/2 - bezel_thickness - mounting_block_y/2) ,
            plate_z/2 + mounting_block_z/2])
        rotate([90,0,0])
        cylinder(r = m4_pilot/2, h = mounting_block_y, center = true);
        
        translate([(plate_x/2 - mounting_block_x/2),
            -(plate_y/2 - bezel_thickness - mounting_block_y/2) ,
            plate_z/2 + mounting_block_z/2])
        rotate([90,0,0])
        cylinder(r = m4_pilot/2, h = mounting_block_y, center = true);
        // pass thru mounting holes
        
        // pass-thru holes 
        translate([vert_m4_x_offset,
            -(plate_y/2 -bezel_thickness - 10/2),
            0])
        cylinder(r = m4_dia/2, h = plate_z, center = true);
        
        translate([-vert_m4_x_offset,
            -(plate_y/2 -bezel_thickness - 10/2),
            0])
        cylinder(r = m4_dia/2, h = plate_z, center = true);
        
        // rail holes - pass - thru
        translate([vert_m4_x_offset + 10,
            -(plate_y/2 -bezel_thickness - 10/2 - rail_width),
            0])
        #cylinder(r = m4_dia/2, h = plate_z, center = true);
        
        translate([-(vert_m4_x_offset + 10),
            -(plate_y/2 -bezel_thickness - 10/2 - rail_width),
            0])
        cylinder(r = m4_dia/2, h = plate_z, center = true);
        
    }
}