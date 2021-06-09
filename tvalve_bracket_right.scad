// bracket for t-valve

body_dia = 23;
valve_axle_dia = 13;


m5_dia = 5;
m5_pilot = 4.2;

// mount rail to valve centerline
mrail_to_valve = 21;
mrail_width = 12;

min_wall = 4;
below_valve = 31 - body_dia;
block_top = 3;      // mat'l on top above the body

block_x = 14;
// 5 mm + (mount rail distance on cl) + min thick
block_y = 5 + (mrail_width/2) + mrail_to_valve + body_dia/2 + min_wall;
block_z = below_valve + body_dia/2;

// mounting rail cut-out
cut_thickness = 8;
cut_x = block_x;
cut_y = block_y - (body_dia + min_wall * 2);
cut_z = block_z - cut_thickness;

// body cylinder - translate coord
body_ty = block_y/2 - (5 + mrail_width/2 + mrail_to_valve); 
body_tz = -block_z/2 + (below_valve + body_dia/2);
        
$fn = 50;

difference () {
    union () {
        cube([block_x, block_y, block_z], center = true);

        translate([0, body_ty, body_tz])
        rotate([0,90,0])
        cylinder (r = body_dia/2 + min_wall, h = block_x, center = true);
    }
    // subtract
    {
        // body cylindar
        translate([0, body_ty, body_tz])
        rotate([0, 90, 0])
        cylinder(r = (body_dia/2 + 0.4), h = block_x, center = true);
        
        // mounting rail cut-out
        translate([0, block_y/2 - cut_y/2, -block_z/2 + cut_thickness + cut_z/2])
        cube([cut_x, cut_y, cut_z], center = true);
        
        // valve_axle
        axle_tx = -block_x/2  - 1 ;
        axle_ty = body_ty;
        axle_tz = (block_z/2 + (body_dia/2 + min_wall)) - min_wall/2;
        translate([axle_tx, axle_ty, axle_tz])
        cylinder(r = valve_axle_dia/2 + 0.2, h = min_wall + 4, center = true);
        
        // handle relief
        translate([axle_tx, axle_ty, block_z/2 + body_dia/2 + min_wall - 1/2])
        cylinder(r = 18/2, h = 1, center = true);
        
        // mounting hole
        mnt_ty =  block_y/2 - 5 - mrail_width/2;
        mnt_tz = -block_z/2 + cut_thickness/2; 
        translate([0,mnt_ty,mnt_tz])
        #cylinder(r = m5_dia/2, h = cut_thickness, center = true);
        
        // rail cut-out
        rail_cutout_thickness = 3;
        rail_tz = -block_z/2 + rail_cutout_thickness/2;
        translate([0,mnt_ty,rail_tz])
        #cube([block_x, mrail_width, rail_cutout_thickness], center = true);
        
    }
}
