// Adapted from https://www.thingiverse.com/thing:2091287
// By mr2clean under Creative Commons - Attribution license

module Nema17(xdim ,ydim ,zdim,rdim,shaft,screwH){
    cylinder(r=shaft,h=zdim+23, $fn=50);
    cylinder(r=12,h=zdim+2.4, $fn=60);
translate([-xdim/2,-ydim/2,0]) difference(){ 
    union(){
        hull(){
            translate([rdim,rdim,0])cylinder(h=zdim,r=rdim, $fn=4);
            translate([xdim-rdim,rdim,0])cylinder(h=zdim,r=rdim, $fn=4);

            translate([rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim, $fn=4);
            translate([xdim-rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim, $fn=4);
        }
    }
    union(){
        /*translate([36.55,5.75,34])cylinder(r=1.5,h=5.5, $fn=50);
        translate([36.55,36.55,34])cylinder(r=1.5,h=5.5, $fn=50);    
        translate([5.75,5.75,34])cylinder(r=1.5,h=5.5, $fn=50);
        translate([5.75,36.55,34])cylinder(r=1.5,h=5.5, $fn=50);  */  
    }
}

for(a=[45, 135, 225, 315]){
    rotate([0, 0, a])translate([43.55/2, 0, zdim-0.01]) {
        cylinder(d=3,h=2.5, $fn=50);
        translate([0, 0, screwH-2]) cylinder(d1=3, d2=7, h=2, $fn=60);
        translate([0, 0, screwH]) cylinder(d=7, h=5, $fn=60);
        }
    }
}



Nema17(42.3,42.3,39,3,2.5,3.6);
translate([0,60,0])rotate([90,0,90])Nema17(42.3,42.3,39,3,2.5,3.6);
