// Corsair iCue Commander Module
// - base
// - cap


// TODO
// - countersink the m3 heads!!
// 

plate_z = 3;

rail_x = 8;
rail_y = 8;
rail_z = 12;

// mounting tabs
tab_y = 15;
tab_z = 3;
tab_ext = 20;

// dimension + tolerance
iCue_x = 133 + 1;
iCue_y = 68 + 1;
iCue_z = 15.5 + 0.5;

// x_offset = adjustment in X direction from 3 hole centerline
x_offet = -20;

// mount base to the case
m3_pilot = 2.2;
m3_dia = 3;

// mount iCue to base
m4_dia = 4;
m4_pilot = 3.2;

// screws 
s1_x = 0;
s1_y = 0;
s2_x = 0;
s2_y = -60;
s3_x = 45;
s3_y = -60;
s4_x = 129;
s4_y = -60;

difference () {
    {
        union () {
            translate([0,0,0])
            cube([(s4_x - s2_x) + rail_x,
                (s1_y - s2_y) + rail_y,
                rail_z], center = true);
            
            // mounting tabs
            translate([0,0, rail_z/2 - tab_z/2])
            cube([(iCue_x + tab_ext ),tab_y,tab_z], center = true);

        }
    }
    {
        cube([(s4_x - s2_x) - rail_x,
        (s1_y - s2_y) - rail_y,
        rail_z], center = true);
        
        translate([0, 16,0])
        cube([(s4_x - s2_x) - rail_x,
            (s1_y - s2_y) - rail_y,
            rail_z], center = true);
        
        translate([rail_x, 40,0])
        cube([(s4_x - s2_x) - rail_x,
            (s1_y - s2_y) - rail_y,
            rail_z], center = true);
        
        // screw holes
        // - thru
        translate([-(s4_x - s1_x)/2, (s1_y - s2_y)/2, 0])
        cylinder(r = m3_dia/2, h = rail_z, center = true);
        
        translate([-(s4_x - s1_x)/2, -(s1_y - s2_y)/2, 0])
        cylinder(r = m3_dia/2, h = rail_z, center = true);
        
        translate([-((s4_x - s1_x)/2 - s3_x) , -(s1_y - s2_y)/2, 0])
        #cylinder(r = m3_dia/2, h = rail_z, center = true);

        translate([-((s4_x - s1_x)/2 - s4_x), -(s1_y - s2_y)/2, 0])
        cylinder(r = m3_dia/2, h = rail_z, center = true);    
    

        // mounting tab holes
        translate([(iCue_x + tab_ext)/2 - 4,0, rail_z/2 - tab_z/2])
        cylinder(r = m4_pilot/2, h = tab_z, center = true);
        
        translate([-((iCue_x + tab_ext)/2 - 4),0, rail_z/2 - tab_z/2])
        cylinder(r = m4_pilot/2, h = tab_z, center = true);
    }
}