// meter2 mount

// meter oriented on it's back
meter_x = 41;
meter_y = 41;
meter_z = 26;

// original m3 x 8mm
// cut screws 8 + m3_block_z + 1 (washer)
screw_square = 32;
m3_slot = 4;

m3_block_y = 8 + m3_slot;
m3_block_x = 8;
m3_block_z = 4;
echo ("cut m3 screws to:", 8 + m3_block_z + 1);

meter_y_mnt_hgt_actual = 16;
meter_y_mnt_hgt_range = m3_slot;
meter_y_mnt_hgt = meter_y_mnt_hgt_actual - meter_y_mnt_hgt_range/2;
meter_z_base = 20 + m3_block_z;   // base won't be entire dimension



m3_dia = 3.0;
m3_washer_dia = 9;

m5_dia = 5.0;

meter2_block_z = 9 + 1;  // add 1 for a washer/shim
meter2_x = 26;
meter2_y = 4;
meter2_z = 5 + 5;

$fn = 50;

difference () {
    {
    union () {
        // main billet
        cube([meter_x, meter_y_mnt_hgt, meter_z_base], center = true);

        // (2) m3 mounting blocks
        translate([(screw_square/2),
            meter_y_mnt_hgt/2 + m3_block_y/2,
            -meter_z_base/2 + m3_block_z/2])
        cube([m3_block_x, m3_block_y, m3_block_z], center = true);
        
        translate([-(screw_square/2),
            meter_y_mnt_hgt/2 + m3_block_y/2,
            -meter_z_base/2 + m3_block_z/2])
        cube([m3_block_x, m3_block_y, m3_block_z], center = true);
        
        // meter 2 tang
        tang_trans_y = (meter_y_mnt_hgt/2 - meter2_block_z - meter2_y/2);
        tang_hgt = meter_y_mnt_hgt/2 -tang_trans_y - meter2_y/2;
        echo("tang hgt:", tang_hgt);
        
        translate([-(meter_x/2 + meter2_x/2), 
            -(tang_trans_y), 
            -(meter_z_base/2 - meter2_z/2)])
        cube([meter2_x, meter2_y, meter2_z], center = true); 
        }
    }
    // subtract 
    {
        // arches
        // - corners
        corner_trans_x = (meter_x/2 - 4);
        corner_trans_x2 = 2 + 1;  // radius + 1; 1 because it's half
        corner_trans_y = (meter_y_mnt_hgt/2 - 4);
        echo("corner hole x/y", corner_trans_x, corner_trans_y);
        
        translate([corner_trans_x, 
            corner_trans_y, 
            0])
        cylinder(r = 2, h = meter_z_base, center = true);
        
        translate([corner_trans_x2, 
            corner_trans_y, 
            0])
        cylinder(r = 2, h = meter_z_base, center = true);
        
        translate([-corner_trans_x, 
            corner_trans_y, 
            0])
        cylinder(r = 2, h = meter_z_base, center = true);
        
        translate([-corner_trans_x2, 
            corner_trans_y, 
            0])
        cylinder(r = 2, h = meter_z_base, center = true);
        
        // top 2 cubes
        top_cube_x = corner_trans_x - corner_trans_x2;
        translate([(corner_trans_x - top_cube_x/2),
            corner_trans_y, 
            0 ])
        cube([top_cube_x, 4, meter_z_base], center = true);
        
        translate([-(corner_trans_x - top_cube_x/2),
            corner_trans_y, 
            0 ])
        cube([top_cube_x, 4, meter_z_base], center = true);
        
        bottom_cube_x = top_cube_x + 4;
        bottom_cube_y = corner_trans_y + meter_y_mnt_hgt/2;
        
        bottom_cube_trans_x = (corner_trans_x + 2) - bottom_cube_x/2;
        bottom_cube_trans_y = -meter_y_mnt_hgt/2 + bottom_cube_y/2;
        
        translate([bottom_cube_trans_x, bottom_cube_trans_y, 0])
        cube([bottom_cube_x, bottom_cube_y, meter_z_base], center = true);
        
        translate([-bottom_cube_trans_x, bottom_cube_trans_y, 0])
        cube([bottom_cube_x, bottom_cube_y, meter_z_base], center = true);
        
        //m3 holes for meter back
        translate([screw_square/2,
            meter_y_mnt_hgt/2 + 4,
            -meter_z_base/2 + m3_block_z/2])
        cylinder(r = m3_dia/2, h = m3_block_z, center = true);
        
        translate([screw_square/2,
            meter_y_mnt_hgt/2 + 4 + m3_slot,
            -meter_z_base/2 + m3_block_z/2])
        cylinder(r = m3_dia/2, h = m3_block_z, center = true);
        
        translate([screw_square/2,
            meter_y_mnt_hgt/2 + 4 + m3_slot/2,
            -meter_z_base/2 + m3_block_z/2])
        cube([m3_dia, m3_slot, m3_block_z], center = true);
        
        // 2nd
        translate([-screw_square/2,
            meter_y_mnt_hgt/2 + 4,
            -meter_z_base/2 + m3_block_z/2])
        cylinder(r = m3_dia/2, h = m3_block_z, center = true);
        
        translate([-screw_square/2,
            meter_y_mnt_hgt/2 + 4 + m3_slot,
            -meter_z_base/2 + m3_block_z/2])
        cylinder(r = m3_dia/2, h = m3_block_z, center = true);
        
        translate([-screw_square/2,
            meter_y_mnt_hgt/2 + 4 + m3_slot/2,
            -meter_z_base/2 + m3_block_z/2])
        cube([m3_dia, m3_slot, m3_block_z], center = true);
        
        // meter 2 tang - m5 slot
        translate([-(meter_x/2 + 5),
            0,
            -(meter_z_base/2 - meter2_z/2)])
        rotate([90,0,0])
        cylinder(r = m5_dia/2, h = meter_y_mnt_hgt, center = true);
        
        translate([-(meter_x/2 + meter2_x - 5),
            0,
            -(meter_z_base/2 - meter2_z/2)])
        rotate([90,0,0])
        cylinder(r = m5_dia/2, h = meter_y_mnt_hgt, center = true);
        
        translate([-(meter_x/2 + meter2_x/2),
            0,
            -(meter_z_base/2 - meter2_z/2)])
        cube([meter2_x - 10, meter_y_mnt_hgt, 5], center = true);
        
        // remove the left leg
        // - get tang_hgt (out of scope) value from echo log
        tang_hgt = 10;
        translate([-(meter_x/2 - 5/2), 
            -(meter_y_mnt_hgt/2 - tang_hgt/2), 
            0])
        #cube([5, tang_hgt, meter_z_base], center = true);
    }
}