// corner fan mounts


fan_dia = 120;

m4_dia = 4.2;
m4_pilot = 3.2;
m4_head_dia = 9.25;


// mount z must be between 4.5 & 6 due to the screws going into radiator
// before they bottom out
mount_z = 5;
mount_lip_z = 5;
mount_lip_x = 2;

inside_square = 25;
outside_square = 25 + mount_lip_x;
outside_square_z = mount_z + mount_lip_z;


$fn = 50;

difference () {

    {
    cube([outside_square, outside_square, outside_square_z], center = true);
    }

    {
    // cube for the lip
    translate([0,0, mount_z/2])
    cube([inside_square, inside_square, mount_lip_z], center = true);
        
    // radiator mount
    translate([inside_square/2 - 7.5, inside_square/2 - 7.5, -outside_square_z/2 + mount_z/2])
    #cylinder(r = m4_dia/2, h = mount_z, center = true);
        
    // threaded hole
    translate([inside_square/2 - (7.5 + 7.0), 
        inside_square/2 - (7.5 + 7.0), 
        -outside_square_z/2 + mount_z/2])
    cylinder(r = m4_pilot/2, h = mount_z, center = true);  
    
    // airflow 
    translate([-(fan_dia/2 - inside_square/2), -(fan_dia/2 - inside_square/2),0])
    cylinder(r = fan_dia/2, h = outside_square_z, center = true);    
        
    // unneed lip!
    translate([-(outside_square/2 - mount_lip_x/2),0, mount_z/2])
    cube([mount_lip_x, inside_square, mount_lip_z], center = true);
    
    translate([0, -(outside_square/2 - mount_lip_x/2), mount_z/2])
    # cube([inside_square, mount_lip_x,  mount_lip_z], center = true);
    }
}