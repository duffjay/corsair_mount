// twin tube
// - bottom

tube_dia = 14;

o_ring_OD = 17;
o_ring_ID = 12;
o_ring_radius = (o_ring_OD - o_ring_ID)/2;
o_ring_CL = 2* (o_ring_OD - o_ring_ID) + o_ring_ID;

tube_OD = 14;
tube_ID = 10;
tube_cl_bottom = 14;
tube_separation = 25;
// tube_square = o_ring + 3mm walls
tube_square = o_ring_OD + 2 * 3;
echo ("tube_square = ", tube_square);

// outside mounting holes, CL 5mm from end,  3mm from the o-ring
// - 3mm from o-ring built into the tube_square
base_length = tube_separation + 2 * 5 + 2 * 5 + tube_square;
base_width = 10;
base_height = tube_cl_bottom + tube_square/2;
echo ("base_length = ", base_length);
echo ("base_width  = ", base_width);
echo ("base height = ", base_height);
// mounting screws
// M4
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
        cylinder (r = (tube_dia + o_ring_radius)/2, h = base_width, center = true);
        // o-ring grove
        rotate_extrude(convexity = 10, $fn = 100)
        translate([16/2,0,0])
        circle(r = 1, $fn = 100);
        }
    rotate([90,0,0])
    translate([tube_separation/2, -base_height/2 + tube_cl_bottom ,0])
        {
        // tube
        cylinder (r = (tube_dia + o_ring_radius)/2, h = base_width, center = true);
        // o-ring grove
        rotate_extrude(convexity = 10, $fn = 100)
        translate([16/2,0,0])
        circle(r = 1, $fn = 100);
        }
  

    // vertical mounting holes
    
    translate([-(base_length - 10)/2,0,0])
    cylinder(r = mnt_screw_dia/2, h = base_height, center = true);
        
    translate([(base_length - 10)/2,0,0])
    cylinder(r = mnt_screw_dia/2, h = base_height, center = true);
        
    // remove mounting shelf
    translate([-(base_length - 10)/2,0, tube_cl_bottom/2])
    cube([base_width, base_width, base_height], center = true);

    translate([(base_length - 10)/2,0, tube_cl_bottom/2])
    cube([base_width, base_width, base_height], center = true);
        
    // remove top cap

    difference () {    
        translate([0,0,tube_cl_bottom])
        cube([base_length - 2 * 10, base_width, base_height], center = true);
        {
        translate([-tube_separation/2, 0, -base_height/2 + tube_cl_bottom])   
        rotate([90,0,0])
        cylinder(r = tube_square/2, h = base_width, center = true);  
          
        translate([tube_separation/2, 0, -base_height/2 + tube_cl_bottom])   
        rotate([90,0,0])
        cylinder(r = tube_square/2, h = base_width, center = true);   
        }
        }
    }
}