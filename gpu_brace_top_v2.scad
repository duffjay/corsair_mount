include <serrated45_plane.scad>;

// GPU brace - bottom
// M6 screws
// 
// printing
// - 0.1 precision, gradual infill - does not work
//   0.06 precision, 80% infile - 

base_mount_cl = 32;
base_mount_screw_dia = 6;

base_width = 30;
base_length = 60;
base_thickness = 4;


male_x = 16;
male_y = 4;
male_z = 34 + base_thickness;    // add 4mm to go through the base

flange_x = 2;
flange_y = 8;
flange_z = male_z;

// mounting serration to base
mounting_screw_dia = 2;
mounting_screw_length = 10;
mounting_washer_dia = 5;
mounting_screw_head_dia = 4;

// mate serration surfaces
// - not applicable here

// flat base

// mounting base to the deck
// M6 mounting
// - not applicable here
// mating_screw_dia = 6;

$fn = 50;



difference () {
    {
    union () {
        // flat base
        cube([base_length, base_width, base_thickness], center = false);
        
        // mount block
        translate([base_length/2 - (male_x/2 + flange_x), base_width/2 + flange_y/2, base_thickness])
        cube([male_x + 2 * flange_x, 3, 5], center = false);
        

        }
    }
    {
        
    // hole in base plate
    translate([base_length/2 - (male_x/2), base_width/2, 0])
    cube([male_x, male_y, base_thickness], center = false);
        

        
    // mount serrated to base
    translate([base_length/2 - male_x/4, base_width/2 + flange_y, base_thickness + 2])
    rotate([90,0,0])
    #cylinder(r = mounting_screw_dia/2, h = 8, center = true);
        
    translate([base_length/2 + male_x/4, base_width/2 + flange_y, base_thickness + 2])
    rotate([90,0,0])
    #cylinder(r = mounting_screw_dia/2, h = 8, center = true);
    
    // recess in the base
    translate([2,2,2])
    cube([base_length - 4, base_width/2 - 4, 2], center = false);
        
    translate([2,2,2])
    cube([base_length/2 - 4 - male_x/2, base_width - 4, 2], center = false);
    
    translate([10 + base_length/2,2,2])
    cube([base_length/2 - 4 - male_x/2, base_width - 4, 2], center = false);
    }
}