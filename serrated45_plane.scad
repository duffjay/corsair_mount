// serration using cubes




module serrated45_plane (pitch, length, width) {
    union () {
        for(i = [0:(length - 1)]) {
            translate([i * cos(45), 0, 0])
            rotate([0,0,45])
            cube( [pitch, pitch, width], center = true);
        }
    }
    {
        plane_length = pitch * cos(45) * 2 * length;
        translate([plane_length/2, - pitch/2 * 0.95, 0])
        cube([plane_length, pitch/2, width], center = true);
    }
}


// serrated45_plane (0.5, 80, 18);
