include <serrated45_plane.scad>;

// GPU brace - Female
//           - Bottom half
// printing - solid
// precision - 0.06

// *** TODO ***
// mount_1_cl == mate_1_cl
// mount_2_cl == mate_2_cl
// make the mount (different file) < 10
// - screw is only 10 mm long

base_thickness = 4;

male_x = 16;
male_y = 4;
male_z = 34 + base_thickness;    // add 4mm to go through the base

flange_x = 2;
flange_y = 8;
flange_z = male_z;

// mounting to base
mounting_screw_dia = 2;
mounting_screw_length = 10;
mounting_washer_dia = 5;
mounting_screw_head_dia = 4;

// M4 mounting 
mating_screw_dia = 4;
mating_screw_pilot = 3.3;

mount_1_cl = 14;
mount_2_cl = 26;

$fn = 50;



difference () {
    {
    union () {

        
        // flanges
        translate([male_x/2 + flange_x/2,-(flange_y-male_y)/2,0])
        cube([flange_x,flange_y, flange_z], center = true);
        
        translate([-(male_x/2 + flange_x/2),-(flange_y-male_y)/2,0])
        cube([flange_x,flange_y, flange_z], center = true);
        
        // center

        cube([male_x,male_y, male_z], center = true);        
        
        // serration
        // translate([0, -male_y/2, -male_z/2 + base_thickness + 6])
        // rotate([180,-90,0])
        // serrated45_plane(0.5, 39, male_x);
        }
    }
    {

        

    translate([0, male_y/2 - 3, -male_z/2 + base_thickness + mount_1_cl])
    rotate([90,0,0])
    cylinder(r = mating_screw_pilot/2, h = 6, center = true);
        
    translate([0, male_y/2 - 3, -male_z/2 + base_thickness + mount_2_cl])
    rotate([90,0,0])
    cylinder(r = mating_screw_pilot/2, h = 6, center = true);
    
    // mounting screws to base
    translate([-male_x/4, male_y/2 - 3, -male_z/2 + base_thickness + 3])
    rotate([90,0,0])
    cylinder(r = mounting_screw_dia/2, h = 6, center = true);
        
    translate([male_x/4, male_y/2 - 3, -male_z/2 + base_thickness + 3])
    rotate([90,0,0])
    cylinder(r = mounting_screw_dia/2, h = 6, center = true);    
    }
}