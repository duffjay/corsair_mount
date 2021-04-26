include <serrated45_plane.scad>;

// GPU brace - bottom
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

base_mount_cl = 32;
base_mount_screw_dia = 6;

base_width = 30;
base_length = 60;
base_thickness = 4;
// flat base

// M6 mounting - by mistake
mating_screw_dia = 6;

$fn = 50;



difference () {
    {
    union () {
        // flat base
        cube([base_length, base_width, base_thickness], center = false);
        
        // flanges
        translate([base_length/2 - 10,base_width/2 - 8/2,base_thickness])
        cube([2,8,34], center = false);
        
        translate([base_length/2 + 10 - 2,base_width/2 - 8/2,base_thickness])
        cube([2,8,34], center = false);
        
        // center
        translate([base_length/2 - 9,base_width/2 - 1,base_thickness])
        cube([18,4,34], center = false);        
        
        // serration
        translate([base_length/2, base_width/2 - 1, base_thickness])
        rotate([180,-90,0])
        serrated45_plane(0.5, 48, 16);
        }
    }
    {
    translate([(base_length/2 - base_mount_cl/2), base_width/2, 0])
    cylinder(r = (base_mount_screw_dia/2) * 1.1, h = base_thickness, center = false);
    translate([(base_length/2 + base_mount_cl/2), base_width/2, 0])
    cylinder(r = (base_mount_screw_dia/2) * 1.1, h = base_thickness, center = false);
        

    translate([base_length/2, base_width/2, 32])
    rotate([90,0,0])
    cylinder(r = mating_screw_dia/2, h = 6, center = true);
        
    translate([base_length/2, base_width/2, 18])
    rotate([90,0,0])
    cylinder(r = mating_screw_dia/2, h = 6, center = true);
    

    }
}