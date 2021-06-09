// meter plate

meter_x = 41;
meter_y = 26;

screw_square = 32;
m3_block_y = 12;
m3_block_x = 8;
m3_block_z = 8;

m3_dia = 3.0;
m3_washer_dia = 9;

plate_thickness = 3;

plate_z = plate_thickness;
plate_y = meter_y + m3_block_y;
plate_x = meter_x;

echo ("plate_x:", plate_x);
echo ("plate_y:", plate_y);

mount_centerline = 53;
mount_slot = 8;

m5_pilot = 4.2;
m5_dia = 5.3;

mplate_x = mount_centerline + 2 * m5_dia;
mplate_y = m5_dia + mount_slot + 2 * m5_dia;
mplate_z = plate_thickness;
echo ("mplate_y:", mplate_y);

// meter 2
slot_width = 8.25;
slot_depth = 6;
slot_wall = 3;

meter2_block_x = slot_width + slot_wall * 2;
meter2_block_y = 38;
meter2_block_z = 6 + slot_wall;
meter2_slot = 24;

meter2_trans_x = screw_square/2 - meter2_block_x/2 - m3_washer_dia/2;
meter2_trans_y = 35;
        
$fn = 50;

difference () {
    union () {
        
        cube ([plate_x, plate_y, plate_thickness], center = true);
        
        // mouting blocks
        translate([-(screw_square/2),
            plate_y/2 - m3_block_y/2,
            plate_thickness/2 + m3_block_z/2])
        cube([m3_block_x, m3_block_y, m3_block_z], center = true);
        
        translate([(screw_square/2),
            plate_y/2 - m3_block_y/2,
            plate_thickness/2 + m3_block_z/2])
        cube([m3_block_x, m3_block_y, m3_block_z], center = true);
        
        // mount plate
        meter_extend = 4;
        centerline_from_edge = 30;
        mount_plate_centerline = -(plate_y/2 - meter_extend - 30);
        echo("mount_plate_centerline:", mount_plate_centerline);
        
        translate([0, mount_plate_centerline, 0])
        difference () {
            cube([mplate_x, mplate_y, mplate_z], center = true);
            // substract 
            {
                // +x
                translate([mount_centerline/2, mount_slot/2, 0])
                cylinder(r = m5_dia/2, h = mplate_z, center = true);
                
                translate([mount_centerline/2, -mount_slot/2, 0])
                cylinder(r = m5_dia/2, h = mplate_z, center = true);

                translate([mount_centerline/2, 0, 0])
                cube([m5_dia, mount_slot, mplate_z], center = true);
                // -x
                translate([-mount_centerline/2, mount_slot/2, 0])
                cylinder(r = m5_dia/2, h = mplate_z, center = true);
                
                translate([-mount_centerline/2, -mount_slot/2, 0])
                cylinder(r = m5_dia/2, h = mplate_z, center = true);
                
                translate([-mount_centerline/2, 0, 0])
                cube([m5_dia, mount_slot, mplate_z], center = true);
            }
        }
        
        // meter 2 block

        translate([meter2_trans_x,
            meter2_trans_y,
            -(plate_thickness/2 - meter2_block_z/2)])
        cube([meter2_block_x, meter2_block_y, meter2_block_z], center = true);
    }

    // subtract 
    {
        translate([-(screw_square/2),
            plate_y/2 - m3_block_y/2,
            plate_thickness/2 + m3_block_z/2])
        rotate([90,0,0])
        cylinder(r = (m3_dia + 0.4)/2, h = m3_block_y, center = true);
        
        translate([(screw_square/2),
            plate_y/2 - m3_block_y/2,
            plate_thickness/2 + m3_block_z/2])
        rotate([90,0,0])
        cylinder(r = (m3_dia + 0.4)/2, h = m3_block_y, center = true);
        
        // meter2 slot
        translate([meter2_trans_x,
            meter2_trans_y,
            -(plate_thickness/2 - meter2_block_z/2)])
            {   
                // minor slot
                translate([0, meter2_slot/2, 0])
                cylinder(r = m5_dia/2, h = meter2_block_z, center = true);

                translate([0, -meter2_slot/2, 0])
                cylinder(r = m5_dia/2, h = meter2_block_z, center = true);  

                translate([0, 0, 0])
                cube([m5_dia, meter2_slot, meter2_block_z], center = true); 
                
                // major slot
                translate([0, meter2_slot/2, -(meter2_block_z/2 - slot_depth/2)])
                cylinder(r = slot_width/2, h = slot_depth, center = true);
                
                translate([0, -meter2_slot/2, -(meter2_block_z/2 - slot_depth/2)])
                cylinder(r = slot_width/2, h = slot_depth, center = true);
                
                translate([0,0, -(meter2_block_z/2 - slot_depth/2)])
                cube([slot_width, meter2_slot, slot_depth], center = true);
            }
        
    }
}