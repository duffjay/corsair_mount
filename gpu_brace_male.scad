include <serrated45_plane.scad>;

// GPU brace - Male
// M6 screws
// 
// printing
// - 0.1 precision, gradual infill - does not work
//   0.06 precision, 80% infile - 


// GPU is about 49mm above the deck
// base is 36 + 4 = 40 mm
// mating holes:
// - 18 mm
// - 36 mm



male_width = 16;
base_height = 34;
base_thickness = 4;
// flat base

// M4 mounting 
mating_screw_dia = ;

$fn = 50;



difference () {
    {
    union () {

        
        // flanges
        translate([base_length/2,0,0])
        cube([2,8,34], center = true);
        
        translate([base_length/2,0,0])
        cube([2,8,34], center = true);
        
        // center

        cube([18,4,34], center = true);        
        
        // serration
        translate([base_length/2, base_width/2 - 1, base_thickness])
        rotate([180,-90,0])
        serrated45_plane(0.5, 48, 16);
        }
    }
    {

        

    translate([base_length/2, base_width/2, 32])
    rotate([90,0,0])
    cylinder(r = mating_screw_dia/2, h = 6, center = true);
        
    translate([base_length/2, base_width/2, 18])
    rotate([90,0,0])
    cylinder(r = mating_screw_dia/2, h = 6, center = true);
    

    }
}