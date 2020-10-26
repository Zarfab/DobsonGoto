use <nema17.scad>

support();
//part1();
//part2();

module part1() {
    difference() {
        support();
        translate([-50, -50, -10]) cube([150, 100, 20]);
    }
}

module part2(){
    difference() {
        support();
        translate([-50, -50, 10]) cube([150, 100, 50]);
    }
}


module support() {
    difference() {
        union() {
            hull() {
                translate([0, 0, 46.4/2-3.6]) chamferedCube([50, 50, 46.4], 3.6);
                translate([19.5+31.5/2+50/2, 0, -3.6]) cylinder(d=31.5, h=16+7.2, $fn=60);
            }
            hull() for(a=[0, 90, 180, 270]) {
                    rotate([0, 0, a]) translate([26, 0, -3.6]) cylinder(d=10, h=46.4-3.6, $fn=36);
            }
        }
        // nema17 stepper 
        rotate([180, 0, 0]) translate([0, 0, -39]) Nema17(42.8, 42.8, 39.8, 3, 2.5,3.6);
        // main screw (M8)
        translate([19.5+31.5/2+50/2, 0, -3.6]) cylinder(d=8.2, h=30, $fn=60);
        translate([19.5+31.5/2+50/2, 0, -3.8]) cylinder(d=15.2, h=6, $fn=6);
        translate([19.5+31.5/2+50/2, 0, 18]) cylinder(d=22, h=1.8, $fn=60); // washer
        translate([19.5+31.5/2+50/2, 0, 19.6]) cylinder(d=33, h=16, $fn=60);
        
        // secondary screws and bolts (M4)
        for(a=[90, 180, 270]) {
            rotate([0, 0, a]) translate([26, 0, -3.6]) {
                cylinder(d=4.2, h=46.4, $fn=24);
                translate([0, 0, -0.1]) cylinder(d=7, h=4.1, $fn=60);
                translate([0, 0, 42.8-3]) rotate([0, 0, 30])cylinder(d=8.2, h=10, $fn=6);
            }
        }
        // wire path
        translate([25, 0, 35.6]) rotate([0, -20, 0]) chamferedCube([40, 12.4, 4], 1.2);
        translate([42.3/2, 0, 20]) chamferedCube([6, 12.4, 38], 1.2);
        // dobson handle
        translate([25+20/2, 0, 16.4/2]) cube([20, 50, 15.8], center=true);
        // space to evacuate heat
        venth = 19.2;
        translate([-5-7.7/2, 0, 10+venth/2]) cube([60, 80, venth], center=true);
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