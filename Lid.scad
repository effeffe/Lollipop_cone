/*
 Jar with separation of Nuclear Lollipops
 Use for e.g. fumed silica around source
 
 Author: Filippo Falezza ©2022, GPLv3
 thread library: https://github.com/adrianschlatter/threadlib
 */

//disable the following when testing
$fn=5000; //production

//mm units
thread_radius = 57.315;
base_radius = 60;
neck_radius = 25;
cone_height = 110;
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

//the lollipop uses 2mm thickness
loll_w1 = 31;
loll_h = 110;
loll_w2 = 10;

use <threadlib/threadlib.scad>
difference(){
    cylinder(h=lid_height, r=(lid_irad+base_radius-thread_radius));
    cylinder(h=lid_height, r=lid_irad);
}
cylinder(h=5, r=(lid_irad+base_radius-thread_radius));

translate([0,0,1.9642])thread("M120x4-int", turns=5);
