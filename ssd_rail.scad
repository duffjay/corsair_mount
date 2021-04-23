// SSD mount to vertical side panel


mnt_slot_x = 105;
mnt_hole_dia = 3.3;
// width of mounting block 
block_y = 10;              
// length of mounting block
block_x_offset = 6;  
block_x = mnt_slot_x + 2 * (block_y/2) + block_x_offset;
// block height
block_z = 10;
// mounting pad z
block_pad_z = 3;

// holes for SSD mount
ssd_x1 = 0;
ssd_x2 = 101 - 59.6;
ssd_x3 = 101;
ssd_hole_dia = 3.1;

ssd_x_offset = 5;  // centerline offset from right edge

$fn = 50;

rotate ([180,0,0])
difference () {
    {
    union () {
        cube([block_x, block_y, block_z], center = true);

        // 1st pad for slots
        translate([-(block_x/2 - block_y/2), 0, -(block_y/2 + block_pad_z/2)])
        cube([block_y, block_y, block_pad_z], center = true);

        // 2nd pad for slots
        translate([(block_x/2 - block_y/2 - block_x_offset), 0, -(block_y/2 + block_pad_z/2)])
        cube([block_y, block_y, block_pad_z], center = true);
        }
    }
    {
    // rail holes
    translate([-(block_x/2 - block_y/2), 0, -(block_z/2)])
    cylinder(r = mnt_hole_dia/2, h = 2 * block_z, center = true);
    translate([(block_x/2 - block_y/2 - block_x_offset), 0, -(block_z/2)])
    cylinder(r = mnt_hole_dia/2, h = 2 * block_z, center = true);
        
    // SSD mount holes
    rotate([90,0,0])
    // right edge = block_x/2
    translate([(block_x/2 - ssd_x_offset - ssd_x1), 0, 0])
    cylinder(r = ssd_hole_dia/2, h = block_z, center = true);
    
    rotate([90,0,0])
    // right edge = block_x/2
    translate([(block_x/2 - ssd_x_offset - ssd_x2), 0, 0])
    cylinder(r = ssd_hole_dia/2, h = block_z, center = true);    
    
    rotate([90,0,0])
    // right edge = block_x/2
    translate([(block_x/2 - ssd_x_offset - ssd_x3), 0, 0])
    cylinder(r = ssd_hole_dia/2, h = block_z, center = true);   
    }
}