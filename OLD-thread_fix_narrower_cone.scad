/*
 Jar with separation of Nuclear Lollipops
 Use for e.g. fumed silica around source
 
 Author: Filippo Falezza ©2022, GPLv3
 thread library: https://github.com/adrianschlatter/threadlib
 */

//disable the following when testing
//$fn=1000; //production
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

//thread fix for old narrower cone
translate([0,0,cap_height])difference(){
    cylinder(h=3, r=thread_radius+thick_25);
    cylinder(h=3, r=icap_rad);
}

//thread
difference(){
    cylinder(h=cap_height, r=thread_radius);
    cylinder(h=cap_height, r=icap_rad);
}
difference(){
    thread("M120x4-ext", turns=5);
    translate([0,0,-cap_height])cylinder(h=cap_height, r=thread_radius+10);
}