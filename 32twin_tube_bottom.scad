// twin tube
// - bottom

tube_dia = 14;

o_ring_OD = 18;
o_ring_ID = 14;
o_ring_CL = 16;

tube_cl_bottom = 14;
tube_separation = 22;
// tube_square = OD + 2* o-ring + 2 * 2 
//             = 14 + 4 + 4
tube_square = 22;

base_length = tube_separation + 2 * 10 + tube_square;
base_width = 10;
base_height = tube_cl_bottom + tube_square/2;
echo ("base_length = ", base_length);
echo ("base_width  = ", base_width);
echo ("base height = ", base_height);
// mounting screws
mnt_screw_dia = 3.2;

$fn = 50;

difference () {
    {
    cube([base_length, base_width, base_height], center = true);
    }
    {
    // move the tube hole
    // - to the left 
    // - up CL_bottom    
    //
    rotate([90,0,0])
    translate([-tube_separation/2, -base_height/2 + tube_cl_bottom ,0])
        {
        // tube
        cylinder (r = (tube_dia + 1)/2, h = base_width, center = true);
        // o-ring grove
        rotate_extrude(convexity = 10, $fn = 100)
        translate([16/2,0,0])
        circle(r = 1, $fn = 100);
        }
    rotate([90,0,0])
    translate([tube_separation/2, -base_height/2 + tube_cl_bottom ,0])
        {
        // tube
        cylinder (r = (tube_dia + 1)/2, h = base_width, center = true);
        // o-ring grove
        rotate_extrude(convexity = 10, $fn = 100)
        translate([16/2,0,0])
        circle(r = 1, $fn = 100);
        }
  

    // vertical mounting holes
    // center
    translate([0,0,-base_height/2])
    cylinder(r = mnt_screw_dia/2, h = base_height, cener = true);
    }
}