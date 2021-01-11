include <NopSCADlib/lib.scad>

difference() {
    rounded_rectangle(size = [42, 42, 1.6], r = 4, center = false, xy_center = true);
    cylinder(d=38, h=4, center=true, $fn=120);
}
translate([0, 0, 11/2+1.6]) fan(fan40x11);