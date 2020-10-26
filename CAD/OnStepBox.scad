include <NopSCADlib/lib.scad>

//rotate([0, -90, 0]) battery_pack(s=6, p=1);
//switch($fn = 120);
//pcb();

bottom_box();

box_size = [83.2, 54, 136];
battery_w = 19.2;
module bottom_box() {
    translate([0, -box_size[1]/2, box_size[2]/2]) difference() {
        chamferedCube(box_size, 1.2);
        // battery pack
        translate([0, 0, -8]) cube([66, box_size[1]+2, 110], center=true);
        rotate([0, -90, 180]) translate([-12.0, -(box_size[1]-battery_w)/2, 0]) battery_pack(s=6, p=1);
        // pcb
        rotate([90, 90, 0]) translate([0, 0, (50-box_size[1])/2]) pcb();
        // GPS antenna
        translate([-box_size[0]/2 + 16 + 4, -box_size[1]/2+4+13, -box_size[2]/2 + 6]) chamferedCube([32, 26, 8], 2);
        // BME280
        translate([-box_size[0]/2+2.4, -10, 50]) cube([4, 14.8, 11.2], center=true);
        translate([-box_size[0]/2, -10+7.4-3.2, 50+5.6-3.2]) chamferedCube([6, 4, 4], 0.8);
        // switch
        hull() {
            translate([-box_size[0]/2 + 12.8, (box_size[1]-battery_w)/2, 58]) rotate([0, 0, 90]) rocker_hole(small_rocker, h = 30);
            translate([-box_size[0]/2 + 12.8, (box_size[1]-battery_w)/2, 40]) rotate([90, 0, 0]) cylinder(d=12, h=13, center=true);
        }
        translate([-box_size[0]/2 + 12.8, (box_size[1]-battery_w)/2, 66.2]) rotate([0, 0, 90]) #rocker(small_rocker);
        // barrel jack
        
        // battery monitor with button
        
        // trench for cover
        translate([0, -box_size[1]/2, 0]) cube([box_size[0]-3.2, 4, box_size[2]-3.2], center=true);
        translate([0, -battery_w/2, box_size[2]/2-4]) cube([box_size[0]+1, box_size[1]-battery_w , 10], center=true);
        // holes for screws
        for(i = [-1, 1]) {
            translate([i*(box_size[0]/2 - 16), 0, box_size[2]/2 - 12]) rotate([90, 0, 0]) {
                cylinder(d=6.4, h=box_size[1] - 6, center=true);
                translate([0, 0, -box_size[1]/2-1]) cylinder(d=3.6, h=6);
                translate([0, 0, -box_size[1]/2+1]) cylinder(d1=3.6, d2=6.4, h=2.01);
            }
        }
        translate([0, 6, -box_size[2]/2 + 10]){
            cylinder(d=6.4, h=20-8, center=true);
            translate([0, 0, -10-1]) cylinder(d=3.6, h=6);
            translate([0, 0, -10+2]) cylinder(d1=3.6, d2=6.4, h=2.01);
        }
        //translate([40, 0, 0]) cube([80, 60, 140], center=true);
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


module battery_pack(bl=65, bd=18, s=3, p=1, tol=1.2) {
    hull() {
        for(i = [0:s-1]) {
            for(j = [0:p-1]) {
                x = bd * (i - (s-1)/2);
                y = bd * (j - (p-1)/2);
                if((i == 0 || i == s-1) && (j == 0 || j == p-1))
                    translate([x, y, 0]) cylinder(d=bd+tol, h=bl+tol, center=true, $fn=60);
            }
        }
    }
    hull() {
        translate([-bd * (s-1)/2, 0, bl/2]) cylinder(d=bd, h=tol/2);
        translate([bd * s/2, 0, (bl+tol)/2]) cube([bd, bd, 8], center=true);
    }
}

module switch() {
    cylinder(d=20, h=15);
    translate([0, 0, 15]) cylinder(d1=22.5, d2=17, h=2.4);
    translate([0, 0, 15+2.4]) cylinder(d=17, h=4.2);
    translate([10, 0, 7.5]) cube([2, 2, 15], center=true);
    translate([0, 0, 0]) cube([5, 0.6, 18], center=true);
    translate([0, 7, 0]) cube([5, 0.6, 18], center=true);
}

module pcb() {
    translate([0, 0, 0.9])cube([130.8, 80.8, 2.0], center=true);
    translate([0, 0, 15]) cube([126, 76, 42], center=true);
    translate([-(130.8-54)/2, 0, 10.9]) chamferedCube([54, 80.8, 22], 2);
}