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

//main cone
translate([0,0,30]){
difference(){
    cylinder(h=cone_height,r1=base_radius,r2=neck_radius);
    cylinder(h=cone_height,r1=thread_radius-thick_25,r2=neck_radius-thick_25);
}}


//lollipop holder
translate([0,0,cap_height+loll_h/2+5]){
difference(){
    cube([loll_w1+thick_2*2, loll_w2+thick_2*2, loll_h-10], true);
    cube([loll_w1, loll_w2, loll_h-10], true);
}}
//DEBUG: check the outer radius is approx 5cm at the source centre
//translate([0,0,cap_height+10+15])cube([100,1,1]);
translate([0,+loll_w2/2+thick_2,cap_height+15])difference(){
    rotate([90,0,0])cylinder(h=loll_w2+thick_2*2,r=loll_w1/2+thick_2);
    translate([0,-thick_2,thick_2])rotate([90,0,0])cylinder(h=loll_w2,r=loll_w1/2);
    translate([0,-loll_w2/2-thick_2,loll_w1/2])cube([loll_w1+thick_2*2,loll_w2+thick_2*2,loll_w1],true);
}


translate([-loll_w1/2-thick_2,loll_w2/2+thick_2,140-thick_25])difference(){
    cube([loll_w1+thick_2*2,cone_extrusion,cone_extrusion]);
    translate([0,cone_extrusion,0])rotate([0,90,0])cylinder(h=loll_w1+thick_2*4,r=cone_extrusion);
}
translate([-loll_w1/2-thick_2,-loll_w2/2-thick_2*5/2,140-thick_25])difference(){
    cube([loll_w1+thick_2*2,cone_extrusion,cone_extrusion]);
    translate([0,0,0])rotate([0,90,0])cylinder(h=loll_w1+thick_2*4,r=cone_extrusion);
}
translate([-loll_w1/2-thick_2*5/2,-loll_w2/2-thick_2*4/2,140-thick_25])difference(){
    translate([0,2,0])cube([cone_extrusion,loll_w2+thick_2*2,cone_extrusion]);
    translate([0,0,0])rotate([-90,0,0])cylinder(h=loll_w1+thick_2*4,r=cone_extrusion);
}
translate([+loll_w1/2+thick_2,-loll_w2/2-thick_2*4/2,140-thick_25])difference(){
    translate([0,2,0])cube([cone_extrusion,loll_w2+thick_2*2,cone_extrusion]);
    translate([3,0,0])rotate([-90,0,0])cylinder(h=loll_w1+thick_2*4,r=cone_extrusion);
}

//cone cap
//TODO: smoothen out lollipop inlet and cone edge
translate([0,0,height-cone_extrusion]){
difference(){
    cylinder(h=cone_extrusion,r=neck_radius-thick_25);
    rotate_extrude(convexity = 10)
    translate([neck_radius-thick_25-cone_extrusion, 0, 0])
    circle(r = cone_extrusion);
    cylinder(h=cone_extrusion,r=neck_radius-thick_25-cone_extrusion);
}
}

translate([0,0,height]){
difference(){
    cylinder(h=thick_25,r=neck_radius);
    translate([0,0,thick_25/2])cube([loll_w1, loll_w2, thick_25],true);
}}

//thread
difference(){
    cylinder(h=cap_height, r=thread_radius);
    cylinder(h=cap_height, r=icap_rad);
}
difference(){
    thread("M120x4-ext", turns=5);
    translate([0,0,-cap_height])cylinder(h=cap_height, r=thread_radius+10);
}