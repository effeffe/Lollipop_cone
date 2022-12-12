/*
 Jar with separation of Nuclear Lollipops
 Use for e.g. fumed silica around source
 
 Author: Filippo Falezza ©2022, GPLv3
 thread library: https://github.com/adrianschlatter/threadlib
 */

//disable the following when testing
$fn = 500;

//mm units
thread_radius = 57.315;
base_radius = 60;
neck_radius = 25;
cone_height = 110;
cone_extrusion = 3;
thick_25 = 2.5;
thick_2 = 2;
height = 140;
cap_height = 30;
lid_height = 35;
icap_depth = 15;
icap_rad = thread_radius-thick_25;
icap_handle_h = 10;
icap_handle_r = 10;
lid_irad = 60.455;
icap_rad_extrusion = 2;

//the lollipop uses 2mm thickness
loll_w1 = 31;
loll_h = 110;
loll_w2 = 10;

use <threadlib/threadlib.scad>

//main
difference(){
    cylinder(h=icap_depth, r=icap_rad);
    cylinder(h=icap_depth, r=icap_rad-3);
    translate([0,0,thick_2+icap_rad_extrusion])
    rotate_extrude(convexity = 10)
    translate([icap_rad-3, 0, 0])
    circle(r = icap_rad_extrusion);
    translate([0,0,3])cylinder(h=icap_depth, r=icap_rad-1);
}
cylinder(h=thick_2, r=icap_rad);

//handle
translate([0,0,thick_2]){
cylinder(h=icap_handle_h,r=icap_handle_r);
difference(){
    cylinder(h=icap_rad_extrusion,r=icap_handle_r+icap_rad_extrusion);
    translate([0,0,icap_rad_extrusion])
    rotate_extrude(convexity = 10)
    translate([icap_handle_r+icap_rad_extrusion, 0, 0])
    circle(r = icap_rad_extrusion);
}
}
