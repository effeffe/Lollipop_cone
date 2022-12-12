//$fn=1000; //production

//mm units
base_radius = 35;
neck_radius = 25;
cone_height = 120;
thick_1 = 2.5;
thick_2 = 2;
height = 140;
cap_height = height - cone_height;//cap length


//the lollipop uses 2mm thickness
loll_w1 = 31;
loll_h = 100;
loll_w2 = 10;


use <threadlib/threadlib.scad>
thread("M80x2-int", turns=10);
//bolt("M4", turns=5, higbee_arc=30);