// under case plate

hole_center = 32;

screw_dia = 6;
screw_pilot = 5;

countersink_dia = 10;
countersink_depth = 1;

plate_width = 18;
plate_length = 48;

plate_thickness = 4;

$fn = 50;

difference() {
    {
    cube ([plate_length, plate_width, plate_thickness], center = true);
    }
    {
    // holes
    translate([-hole_center/2, 0,0])
    cylinder(r = screw_pilot/2, h = plate_thickness, center = true);
        
    translate([hole_center/2, 0,0])
    cylinder(r = screw_pilot/2, h = plate_thickness, center = true);

    // countersink
    translate([-hole_center/2,0, plate_thickness/2 - countersink_depth/2])
    cylinder(r = countersink_dia/2, h = counterink_depth, center = true);
        
    // countersink
    translate([hole_center/2,0, plate_thickness/2 - countersink_depth/2])
    cylinder(r = countersink_dia/2, h = counterink_depth, center = true);
    }
}
