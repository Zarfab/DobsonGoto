//top();
bottom();


shc_w = 72;
shc_h = 136;
top_z = 16;
bot_z = 8;

module top() {
    difference() {
        hull() {
            translate([0, 26, -top_z/2]) chamferedCube([shc_w, shc_h-80, top_z], 2);
            translate([0, 8 + shc_h/2 - 15, -top_z/2]) chamferedCube([shc_w-6, 30, top_z], 2);
            translate([0, 8 - shc_h/2 + 20, -top_z/2]) chamferedCube([shc_w-20, 40, top_z], 2);
        }
        hull() {
            translate([0, 26, -top_z]) cube([shc_w-3.6, shc_h-3.6-80, 2*top_z-8], center=true);
            translate([0, 8 + shc_h/2 - 15, -top_z]) cube([shc_w-3.6-6, 30-3.6, 2*top_z-8], center=true);
            translate([0, 8 - shc_h/2 + 20, -top_z]) cube([shc_w-20-3.6, 40-3.6, 2*top_z-8], center=true);
        }
        translate([-100, -100, -top_z-10]) cube([200, 200, 12]);
        
        translate([-screen_module_w/2, shc_h/2 - screen_module_h/2 - 12, -2.8]) screen_module();
        translate([0, 0, 0]) rotate([0, 0, 45]) square_button();
        for(a = [0 : 90 : 270]) {
            rotate([0, 0, a]) translate([24, 0, 0]) round_button();
        }
        translate([16, -48, 0]) round_button();
        translate([-16, -48, 0]) round_button();
        
        translate([0, -51, -2.2]) rotate([0, 180, 0]) RJplug();
        translate([10.4, 24, -14]) rotate([0, 180, 90]) esp32();
    }
    translate([27.4, 70, -14]) insert_tower_m4();
    translate([-27.4, 70, -14]) insert_tower_m4();
    translate([24.4, -32, -14]) insert_tower_m4();
    translate([-24.4, -32, -14]) insert_tower_m4();
    
}

module bottom() {
    difference() {
        union() {
            difference() {
                hull() {
                    translate([0, 26, -top_z]) chamferedCube([shc_w, shc_h-80, bot_z], 2);
                    translate([0, 8 + shc_h/2 - 15, -top_z]) chamferedCube([shc_w-6, 30, bot_z], 2);
                    translate([0, 8 - shc_h/2 + 20, -top_z]) chamferedCube([shc_w-20, 40, bot_z], 2);
                }
                hull() {
                    translate([0, 26, -top_z+4]) cube([shc_w-5.2, shc_h-5.2-80, 2*bot_z-8], center=true);
                    translate([0, 8 + shc_h/2 - 15, -top_z+4]) cube([shc_w-5.2-6, 30-5.2, 2*bot_z-8], center=true);
                    translate([0, 8 - shc_h/2 + 20, -top_z+4]) cube([shc_w-20-5.2, 40-5.2, 2*bot_z-8], center=true);
                }
                translate([-100, -100, -top_z-10+14]) cube([200, 200, 12]);
                top();
                
                translate([0, -51, -2.2]) rotate([0, 180, 0]) RJplug();
                translate([0, -40, -16]) cube([16, 30, 5], center=true);
                translate([10.4, 24, -14]) rotate([0, 180, 90]) esp32();
                
                translate([27.4, 70, -top_z+2]) cylinder(d=16, h=2, $fn=30);
                translate([-27.4, 70, -top_z+2]) cylinder(d=16, h=2, $fn=30);
                translate([24.4, -32, -top_z+2]) cylinder(d=16, h=2, $fn=30);
                translate([-24.4, -32, -top_z+2]) cylinder(d=16, h=2, $fn=30);
                translate([shc_w/2, 24, -top_z+5]) cube([10, 28, 6], center=true);
            }
            translate([27.4, 70, -top_z]) cylinder(d=12, h=2, $fn=30);
            translate([-27.4, 70, -top_z]) cylinder(d=12, h=2, $fn=30);
            translate([24.4, -32, -top_z]) cylinder(d=12, h=2, $fn=30);
            translate([-24.4, -32, -top_z]) cylinder(d=12, h=2, $fn=30); 
        }
        translate([27.4, 70, -top_z]) rotate([0, 180, 0]) screwM4();
        translate([-27.4, 70, -top_z]) rotate([0, 180, 0]) screwM4();
        translate([24.4, -32, -top_z]) rotate([0, 180, 0]) screwM4();
        translate([-24.4, -32, -top_z]) rotate([0, 180, 0]) screwM4();
    }
}




module esp32() {
    translate([0, 0, 2]) cube([28.4, 48, 5], center=true);
    translate([0, (48+7)/2, 2]) cube([19.2, 8, 3], center=true);
    translate([0, -48/2, 2]) cube([10.8, 7.4, 4.1], center=true);
    translate([(28.4-3.2)/2, 0, -2]) cube([3.2, 48, 12], center=true);
    translate([-(28.4-3.2)/2, 0, -2]) cube([3.2, 48, 12], center=true);
}

module d1Mini32(tolerance=[0, 0, 0]) { // whole size 31.5 x 39
    x = tolerance[0];
    y = tolerance[1];
    translate([-15.75, -19.5, 0]) linear_extrude(1.5) polygon(points=[[-x/2,-y/2],[-x/2,36.5],[2.5,39+y/2],[29,39+y/2], [31.5+x/2, 36.5], [31.5+x/2, 6.5], [29, 6.5], [28.5, 6], [28.5, -y/2]]);
    // esp32
    translate([0, 6.7, -0.4]) cube([18, 25.6, 0.8]+tolerance, center=true);
    translate([0, 4, -0.9]) cube([15.7, 17.5, 4.7]+tolerance, center=true);
    translate([0, -17.5, -0.7]) cube([7.7, 5.7, 4.1]+tolerance, center=true);
    translate([0, -13, -0.59]) cube([20, 12, 1.2]+tolerance, center=true);
    translate([10, -19, -3.25]) cube([3.5, 4.5, 3.3]+tolerance);
    //translate([13.15, 0, 2.4]) cube([5.2, 26, 1.82]+tolerance, center=true);
    translate([-13.15, 0, 2.4]) cube([5.2, 26, 3.82]+tolerance, center=true);
}

module esp32bat() {
    difference() {
        translate([0, 0, 2]) cube([29.4, 92, 5], center=true);
        translate([(29.4/2-2), (92/2-2), 2]) cylinder(d=3, h=5.2, center=true, $fn=60);
        translate([-(29.4/2-2), (92/2-2), 2]) cylinder(d=3, h=5.2, center=true, $fn=60);
        translate([(29.4/2-2), -(92/2-2), 2]) cylinder(d=3, h=5.2, center=true, $fn=60);
        translate([-(29.4/2-2), -(92/2-2), 2]) cylinder(d=3, h=5.2, center=true, $fn=60);
    }
    translate([0, 0, -20]) rotate([0, 0, 0]) batteryHolder();
    translate([-29.4/2, -92/2+10, 2]) cube([5.7, 7.7, 4.1], center=true);
    translate([29.4/2, -92/2+10.5, 2]) cube([5.2, 9, 4.1], center=true);
}

module batteryHolder() {
    translate([0, 0, 11])
    difference() {
        cube([21.4, 77.9, 22], center=true);
        translate([0, 0, -4]) cube([22, 67, 18], center=true);
    }
    translate([0, -36, 23]) cube([3, 5, 3], center=true);
    translate([0, 36, 23]) cube([3, 5, 3], center=true);
    rotate([90, 0, 0]) translate([0, 10, 0]) cylinder(d=18, h=65.2, center=true);
}



module insert_tower_m4($fn=60) {
    difference() {
        cylinder(d=12, h=12);
        translate([0, 0, -0.1]) cylinder(d=8.3, h=0.5);
        translate([0, 0, 0]) cylinder(d1=7.2, d2=5.2, h=9.5);
        translate([0, 0, 0]) cylinder(d=4.4, h=12);
    }
}


module RJplug() {
    translate([-13.2/2, -18.2/2, 0]) cube([13.2, 18.2, 11.8]);
    translate([-7/2, (18.2)/2-5, 11.8]) cube([7, 5, 4.8]);
    for(i = [-1, 1]) {
        translate([i*(13.2/2-1), -18.2/2+7.6, 11.8]) difference() {
            cylinder(d=3, h=4.8, $fn=30);
            translate([-1.5, 0, 0]) cube([1, 3, 11.8], center=true);
            translate([1.5, 0, 0]) cube([1, 3, 11.8], center=true);
        }
    }
}


module square_button($fn=60) {
    difference() {
        translate([0, 0, -8]) cylinder(d=12, h=8);
        for(i = [-1, 1]) {
            translate([i * 6, 0, -4]) cube([0.8, 8, 8.2], center=true);
        }
    }
    translate([0, 0, -0.8]) cylinder(d=13.4, h=0.8);
    hull() {
        translate([0, 0, 1]) cube([17.4, 17.4, 2], center=true);
        translate([0, 0, 4.5]) cube([12, 12, 1], center=true);
    }
    translate([0, 0, 5.8]) cube([11.2, 11.2, 1.6], center=true);
}


module round_button($fn=60) {
    difference() {
        translate([0, 0, -8]) cylinder(d=12, h=8);
        for(i = [-1, 1]) {
            translate([i * 6, 0, -4]) cube([0.8, 8, 8.2], center=true);
        }
    }
    translate([0, 0, -0.8]) cylinder(d=13.4, h=0.8);
    translate([0, 0, 0]) cylinder(d1=17.4, d2=14.8, h=5.5);
    translate([0, 0, 5.5]) cylinder(d1=12, d2=6, h=2.8);
}


disp_w = 34;
disp_h = 19;
oled_w = 35.2;
oled_h = 23.8;
screen_module_w = 36.2;
screen_module_h = 34.2;
screws_dx = (screen_module_w - 30) / 2;
screen_module_screws = [
    [screws_dx, 1.7+0.3], 
    [screws_dx, 30.2+0.3], 
    [screen_module_w - screws_dx, 1.7+0.3], 
    [screen_module_w - screws_dx, 30.2+0.3]
];

module screen_module() {
    color([0, 0, 0.8]){
        translate([0, 0, -3])  cube([screen_module_w, screen_module_h, 3]);
        translate([screen_module_w/2, screen_module_h-1.4, -6])  cube([12, 4, 15.6], center=true);
    }
    color([0.2, 0.2, 0.2]) {
        translate([(screen_module_w - oled_w)/2, 4, 0]) cube([oled_w, oled_h, 1.8]);
        translate([(screen_module_w)/2, 2, 0.9]) cube([14, 4.2, 1.8], center=true);
    }
    translate([(screen_module_w - disp_w)/2, 8, 1.8]) cube([disp_w, disp_h, 1.8]);
    hull() {
        translate([(screen_module_w - disp_w)/2, 8, 2.4]) cube([disp_w, disp_h, 0.2]);
        translate([(screen_module_w - disp_w)/2 - 1, 8 - 1, 3.8]) cube([disp_w + 2, disp_h + 2, 0.2]);
    }
    /*for(screw = screen_module_screws) {
        translate([screw[0], screw[1], 1.4]) screwM3();
    }*/
}


module screwM3($fn=30) {
    translate([0, 0, -12]) cylinder(d=3.6, h=12);
    cylinder(d1=3.6, d2=6.4, h=2.0);
    translate([0, 0, 2]) cylinder(d=6.4, h=1.2);
}

module screwM4($fn=30) {
    translate([0, 0, -12]) cylinder(d=4.6, h=12);
    cylinder(d1=4.6, d2=8.4, h=2.8);
    translate([0, 0, 2.8]) cylinder(d=8.4, h=1.2);
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
