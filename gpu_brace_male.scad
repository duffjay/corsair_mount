include <serrated45_plane.scad>;

// GPU brace - Female
//           - Bottom half
// printing - solid
// precision - 0.06



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

// M4 mating - serration 
mating_screw_dia = 4;
mating_screw_pilot = 3.3;
mating_washer_dia = 9;

// slot
slot = 2;
mate_1_cl = 12 - slot;
mate_2_cl = 28 + slot;

$fn = 50;



difference () {
    {
    union () {

        
        // flanges

        
        // center

        cube([male_x,male_y, male_z], center = true);        
        
        // serration
        translate([0, -male_y/2, -male_z/2 + base_thickness + 6])
        rotate([180,-90,0])
        serrated45_plane(0.5, 39, male_x);
        }
    }
    {

    // serrated mating holes
    translate([0, male_y/2 - 3, -male_z/2 + base_thickness + mate_1_cl])
    rotate([90,0,0])
    cylinder(r = mating_screw_dia/2, h = 6, center = true);
        
    translate([0, male_y/2 - 3, -male_z/2 + base_thickness + mate_2_cl])
    rotate([90,0,0])
    cylinder(r = mating_screw_dia /2, h = 6, center = true);
    

        
    // slot
    translate([0, male_y/2 - 3, -male_z/2 + base_thickness + (mate_2_cl - mate_1_cl)/2 + mate_1_cl])
    cube([mating_screw_dia, male_y + 2, mate_2_cl - mate_1_cl], center = true);        
        
    // mounting screws to base
    translate([-male_x/4, male_y/2 - 3, -male_z/2 + base_thickness + 2])
    rotate([90,0,0])
    cylinder(r = mounting_screw_dia/2, h = 6, center = true);
        
    translate([male_x/4, male_y/2 - 3, -male_z/2 + base_thickness + 2])
    rotate([90,0,0])
    cylinder(r = mounting_screw_dia/2, h = 6, center = true);    
    }
}