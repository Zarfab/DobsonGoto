## Pulleys
STL made using openSCAD script from droftarts under Creative Commons - Attribution - Share Alike license
found at https://www.thingiverse.com/thing:16627

### Altitude pulley
Constants used in the script for altitude axis pulley: 
```openSCAD
// tuneable constants
$fn = 760;

teeth = 154;			// Number of teeth
profile = 12;		// 1=MXL 2=40DP 3=XL 4=H 5=T2.5 6=T5 7=T10 8=AT5 9=HTD_3mm 10=HTD_5mm 11=HTD_8mm 12=GT2_2mm 13=GT2_3mm 14=GT2_5mm

motor_shaft = 89.6;	

retainer = 0;		// Belt retainer above teeth, 0 = No, 1 = Yes
retainer_ht = 1.5;	// height of retainer flange over pulley, standard = 1.5
idler = 1;			// Belt retainer below teeth, 0 = No, 1 = Yes
idler_ht = 1.5;		// height of idler flange over pulley, standard = 1.5

pulley_t_ht = 8.0;	// length of toothed part of pulley, standard = 12
pulley_b_ht = 1.5;		// pulley base height, standard = 8. Set to same as idler_ht if you want an idler but no pulley.
pulley_b_dia = 107.0;	// pulley base diameter, standard = 20
no_of_nuts = 0;		// number of captive nuts required, standard = 1
nut_angle = 90;		// angle between nuts, standard = 90
nut_shaft_distance = 1.2;	// distance between inner face of nut and shaft, can be negative.
```

After struggling to put the pulley in place, i would recommend to expend a bit the motor_shaft variable. Something like 90.2mm would be better.

### Azimuth pulley
Constants used in the script for azimuth axis pulley: 
```openSCAD
// tuneable constants
$fn = 20;

teeth = 468;			// Number of teeth, standard Mendel T5 belt = 8, gives Outside Diameter of 11.88mm
profile = 12;		// 1=MXL 2=40DP 3=XL 4=H 5=T2.5 6=T5 7=T10 8=AT5 9=HTD_3mm 10=HTD_5mm 11=HTD_8mm 12=GT2_2mm 13=GT2_3mm 14=GT2_5mm

motor_shaft = 280;	// NEMA17 motor shaft exact diameter = 5
m3_dia = 3.2;		// 3mm hole diameter
m3_nut_hex = 1;		// 1 for hex, 0 for square nut
m3_nut_flats = 5.7;	// normal M3 hex nut exact width = 5.5
m3_nut_depth = 2.7;	// normal M3 hex nut exact depth = 2.4, nyloc = 4

retainer = 0;		// Belt retainer above teeth, 0 = No, 1 = Yes
retainer_ht = 1.2;	// height of retainer flange over pulley, standard = 1.5
idler = 0;			// Belt retainer below teeth, 0 = No, 1 = Yes
idler_ht = 1.5;		// height of idler flange over pulley, standard = 1.5

pulley_t_ht = 10.0;	// length of toothed part of pulley, standard = 12
pulley_b_ht = 1.5;		// pulley base height, standard = 8. Set to same as idler_ht if you want an idler but no pulley.
pulley_b_dia = 107.0;	// pulley base diameter, standard = 20
no_of_nuts = 1;		// number of captive nuts required, standard = 1
nut_angle = 90;		// angle between nuts, standard = 90
nut_shaft_distance = 1.2;	// distance between inner face of nut and shaft, can be negative.
```

## Stepper Motor Supports
Supports made using *nema17.scad* openSCAD script from mr2clean under Creative Commons - Attribution license. Found at https://www.thingiverse.com/thing:2091287