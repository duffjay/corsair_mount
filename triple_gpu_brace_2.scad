// triple gpu brace
// RTX 2080 TI Pair

// outside distance between gpus
outside_x = 47.5;       // outside of 2080s
extension_x = 36.0;     // extend to 1080
waterblock_x = 8.6;     // thickness of waterblock
jaw_x = 5.0;            // x dimension (thickness) of jaw
// not critical
backbone_x = outside_x + jaw_x + jaw_x;

backbone_y = 8;
jaw_y = 8;

thickness_z = 8;

$fn = 50;

difference () {
    union () {
        // backbone
        cube([backbone_x, backbone_y, thickness_z], center = true);

        // bottom 2080  lower-jaw
        translate([(backbone_x/2 - jaw_x/2),
            (backbone_y/2 + jaw_y/2),
            0])
        cube([jaw_x, jaw_y, thickness_z], center = true);
        // bottom 2080 upper-jaw
        translate([((backbone_x/2 - jaw_x) - (waterblock_x + jaw_x/2)),
            (backbone_y/2 + jaw_y/2),
            0])
        cube([jaw_x, jaw_y, thickness_z], center = true);
        
        // top 2080 jaws
       
        translate([-(backbone_x/2 - jaw_x/2),
            (backbone_y/2 + jaw_y/2),
            0])
        cube([jaw_x, jaw_y, thickness_z], center = true);
        
        translate([-((backbone_x/2 - jaw_x) - (waterblock_x + jaw_x/2)),
            (backbone_y/2 + jaw_y/2),
            0])
        cube([jaw_x, jaw_y, thickness_z], center = true); 
        
        // add the extension to connect 1080
        translate([backbone_x/2 + extension_x/2, 0, 0])
        cube([extension_x, backbone_y, thickness_z], center = true);
    }
    // subtract
    {
        translate([backbone_x/2 + 4, 0, 0])
        cylinder(r = 2, h = thickness_z, center = true);
        
        translate([backbone_x/2 + extension_x - 4, 0, 0])
        cylinder(r = 2, h = thickness_z, center = true);
        
        slot_x = (extension_x - 4 * 2);
        translate([backbone_x/2 + 4 + slot_x/2, 0, 0])
        #cube([ slot_x, 4, thickness_z], center = true);
    }
}