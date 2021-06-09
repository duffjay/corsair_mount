// triple gpu brace
// GTX 1080 TI

backbone_x = 50;
waterblock_x = 8.4;
jaw_x = 5.0;

backbone_y = 8.0;
jaw_y = 8.0;

thickness_z = 8.0;

$fn = 50;

difference () {
    union () {
        cube([backbone_x, backbone_y, thickness_z], center = true);
        
        translate([backbone_x/2 - jaw_x/2, (backbone_y/2 + jaw_y/2), 0])
        cube([jaw_x, jaw_y, thickness_z], center = true);
        
        translate([((backbone_x/2 - jaw_x) - (waterblock_x + jaw_x/2)),
            (backbone_y/2 + jaw_y/2),
            0])
        cube([jaw_x, jaw_y, thickness_z], center = true);
    }
    // subtract
    {
        translate([-(backbone_x/2 - 8), 0, 0])
        #cylinder(r = 2, h = thickness_z, center = true);
        
        translate([-(backbone_x/2 - 20), 0, 0])
        cylinder(r = 2, h = thickness_z, center = true);      
    }
}