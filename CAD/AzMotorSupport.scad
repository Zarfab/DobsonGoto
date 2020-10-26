use <nema17.scad>

//support();
part1();
//part2();

z=-7;
module part1(){
    difference() {
        support();
        translate([-50, -50, -10]) cube([150, 100, 26.2+z]);
        //translate([-50, 0, -10]) cube([150, 100, 80]);
    }
}

module part2() {
    difference() {
        support();
        translate([-50, -50, 16.2+z]) cube([150, 100, 60]);
    }
}


module support() {
    m4screws = [[-26, 0], [17, 26], [17, -26]];
    difference() {
        union() {
            hull() {
                translate([0, 0, 46.4/2-3.6-3]) chamferedCube([50, 50, 46.4], 3.6);
                translate([15, -25+3.6, 16.2+z]) cube([35, 50-7.2, 23.8]);
            }
            translate([30, -25+3.6, 16.2+z]) cube([80, 50-7.2, 12]);
            hull() {
                for(s = m4screws) {
                    translate([s[0], s[1], -3.6-3]) cylinder(d=10, h=46.4-3.6, $fn=36);
                }
            }
            // M10 screw and nut to push against support for belt tension adjustment
            difference(){
                hull(){
                    translate([25, 0, 53]) rotate([0, 90, 0]) cylinder(d=30, h=15);
                    translate([15, -21, 16.2+12]) cube([35, 42, 10]);
                }
                translate([10, 0, 53]) rotate([0, 90, 0]) cylinder(d=30, h=15, $fn=60);
                translate([30, 0, 53]) rotate([0, 90, 0]) cylinder(d=20.2, h=20, $fn=6);
                translate([20, 0, 53]) rotate([0, 90, 0]) cylinder(d=10.8, h=30, $fn=60);
            }
        }
        rotate([180, 0, 0]) translate([0, 0, -36.4]) Nema17(42.8, 42.8, 39.8, 3, 2.5, 3.6);
        cylinder(d=6, h=20, center=true, $fn=30);
        
        // dobson support
        translate([25-3, 0, z]) union() { 
            translate([160, 0, -8]) cylinder(d=320, h=16.2+8, $fn=720);
            translate([160, 0, -8]) cylinder(d=324, h=8, $fn=720);
            translate([30+18, 0, 40]) cube([63, 16.6, 80], center=true);
            translate([18+58.6+16.6/2, 0, 40]) cube([18.6, 160, 80], center=true);
        }
        // secondary screws and bolts (M4)
        for(s = m4screws) {
                translate([s[0], s[1], -6.6]) {
                cylinder(d=4.2, h=46.4, $fn=24);
                translate([0, 0, -0.1]) cylinder(d=7.6, h=4.1, $fn=60);
                translate([0, 0, 42.8-3]) rotate([0, 0, 30])cylinder(d=8.2, h=10, $fn=6);
            }
        }
        // wire path
        rotate([0, 0, 90]) {
            translate([21.2, 0, 32.6-1]) chamferedCube([5, 12.4, 20], 0.8);
            translate([42.3/2, 0, 26]) chamferedCube([6, 12.4, 22], 1.2);
        }
        // space to evacuate heat
        venth = 19.2;
        translate([-5-7.7/2, 0, 7+venth/2]) cube([60, 80, venth], center=true);
    }
}



module chamferedCube(size, rc) {
    hull() {
        translate([size[0]/2-rc, size[1]/2-rc, 0]) rotate([0, 0, 0]) 
            cylinder(r=rc, h=size[2]-2*rc, $fn=4, center=true);
        translate([-size[0]/2+rc, size[1]/2-rc, 0]) rotate([0, 0, 0]) 
            cylinder(r=rc, h=size[2]-2*rc, $fn=4, center=true);
        translate([-size[0]/2+rc, -size[1]/2+rc, 0]) rotate([0, 0, 0]) 
            cylinder(r=rc, h=size[2]-2*rc, $fn=4, center=true);
        translate([size[0]/2-rc, -size[1]/2+rc, 0]) rotate([0, 0, 0]) 
            cylinder(r=rc, h=size[2]-2*rc, $fn=4, center=true);
        
        translate([size[0]/2-rc, 0, size[2]/2-rc]) rotate([90, 0, 0]) 
            cylinder(r=rc, h=size[1]-2*rc, $fn=4, center=true);
        translate([size[0]/2-rc, 0, -size[2]/2+rc]) rotate([90, 0, 0]) 
            cylinder(r=rc, h=size[1]-2*rc, $fn=4, center=true);
        translate([-size[0]/2+rc, 0, size[2]/2-rc]) rotate([90, 0, 0]) 
            cylinder(r=rc, h=size[1]-2*rc, $fn=4, center=true);
        translate([-size[0]/2+rc, 0, -size[2]/2+rc]) rotate([90, 0, 0]) 
            cylinder(r=rc, h=size[1]-2*rc, $fn=4, center=true);
    }
}