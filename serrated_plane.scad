
// serrated plane
// z-x plane -- protruding into y

module serrated_plane( pitch, length, width) {
    // x,y
    $fn = 50;

    union () {
        {
        linear_extrude(height = width, center = true, convexity = 10, twist = 0)
        for(i = [0:(length - 1)]) {
            polygon([[i * pitch,0],[i * pitch + pitch/2, pitch * sin(60)], [(i +1) * pitch,0]], [[0,1,2]]);
        }
        {
        translate([length * pitch/2,-0.4,0])
        cube([length * pitch, 1, 16], center = true);
        }
    }
    }
}
// serrated_plane( 0.3, 120, 16);