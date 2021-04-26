include <serrated45_plane.scad>;

// GPU brace - TOP
// NO plate mounts
// 
// printing
// - 0.1 precision, gradual infill - does not work
//   0.06 precision, 80% infile - 


base_width = 30;
base_length = 60;
base_thickness = 4;
// flat base

// M6 mounting - by mistake
mating_screw_dia = 6;
mating_washer_dia = 12;

$fn = 50;



difference () {
    {
    union () {
        // flat base
        cube([base_length, base_width, base_thickness], center = false);
        

        
        // center
        translate([base_length/2 - 8,base_width/2 - 1,base_thickness])
        cube([16 - 0.2,4,38.5], center = false);        
        
        // serration
        translate([base_length/2, base_width/2 - 1, base_thickness])
        rotate([180,-90,0])
        serrated45_plane(0.5, 54, 16 -0.2);
        }
    }
    {

        

    translate([base_length/2, base_width/2, 34])
    rotate([90,0,0])
    cylinder(r =  mating_screw_dia/2 + 0.05, h = 6, center = true);
        
    translate([base_length/2, base_width/2, 12])
    rotate([90,0,0])
    cylinder(r = mating_screw_dia/2 + 0.05, h = 6, center = true);
    
    translate([base_length/2, base_width/2, 12 + 22/2])
    cube([(mating_screw_dia + 0.1 + 0.1), 6, 22], center = true);
        
    // washer recess
    translate([base_length/2, base_width/2 + 3, 34])
    rotate([90,0,0])
    cylinder(r =  mating_washer_dia/2, h = 1, center = true);
        
    translate([base_length/2, base_width/2 + 3, 12])
    rotate([90,0,0])
    cylinder(r =  mating_washer_dia/2, h = 1, center = true);

    }
}