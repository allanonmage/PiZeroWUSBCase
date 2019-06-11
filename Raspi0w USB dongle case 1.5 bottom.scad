


baseWidth = 36;    // X
baseLength = 80;   // y
baseHeighth = 2;   // Z
baseThickness = 2;



wallThickness = 2;
wallHeigthNoBase = 7.5;
wallHeighthMinusBase = wallHeigthNoBase-baseThickness;

baseLengthInner = baseLength-(2*wallThickness);
baseWidthInner = baseWidth-(2*wallThickness);

baseSDPadMountHeigth = 4;
screwHoleRadius = 1.5;

//SD card side
screwholeSDX1Offset = wallThickness+3.5+1; //might try .4 instead of 1
screwholeSDX2Offset = screwholeSDX1Offset+23;
screwholeSDY1Offset = wallThickness+3.5+1;

screwwholeSCameraY1Offset = screwholeSDY1Offset+58;

// STEM/Camera Side
baseSTEMPCBSupport = 2;

//GPIO dimensions
GPIOXval = 7;
GPIOYVal = 54;



// translate([]) cube([]);
difference(){

union(){
// Base
cube([baseWidth,baseLength,baseHeighth]);

// WALLS
// SD Card outer wall
translate([0,0,baseThickness]) cube([baseWidth,wallThickness,wallHeighthMinusBase]);

// GPIO Side
translate([0,wallThickness,baseThickness]) cube([wallThickness,baseLengthInner,wallHeighthMinusBase]);

// Ports side (HDMI, USB, etc
translate([baseWidthInner+wallThickness,wallThickness,baseThickness]) cube([wallThickness,baseLengthInner,wallHeighthMinusBase]);

//Camera side aka USB Stem side
translate([0,baseLengthInner+wallThickness,baseThickness]) cube([baseWidth,wallThickness,wallHeighthMinusBase]);

// SD Card side 
// Raspi0w PCB rest
translate([wallThickness,wallThickness,baseThickness]) cube([baseWidthInner,7.5,baseSDPadMountHeigth]);
// Z axis of 4 is height of plate where raspi rests

// STEM/Camera side
translate([wallThickness,screwwholeSCameraY1Offset-2,baseThickness]) cube([baseWidthInner,baseLengthInner-screwwholeSCameraY1Offset+wallThickness+2,baseSTEMPCBSupport]);


} // end union //////////////////////////////////////
/////////////////////////////////////////////////////


//cylinder(h = height, r1 = BottomRadius, r2 = TopRadius, center = true/false);

////////////////////////////////////////////////////
// Cut outs for screws
// SD Card side screws
translate([screwholeSDX1Offset,screwholeSDY1Offset,0]) cylinder(baseThickness+baseSDPadMountHeigth,screwHoleRadius, screwHoleRadius,false);
translate([screwholeSDX2Offset,screwholeSDY1Offset,0]) cylinder(baseThickness+baseSDPadMountHeigth,screwHoleRadius, screwHoleRadius,false);

// STEM/Camera Side screws
translate([screwholeSDX1Offset,screwwholeSCameraY1Offset,0]) cylinder(baseThickness+baseSDPadMountHeigth,screwHoleRadius, screwHoleRadius,false);
translate([screwholeSDX2Offset,screwwholeSCameraY1Offset,0]) cylinder(baseThickness+baseSDPadMountHeigth,screwHoleRadius, screwHoleRadius,false);


////////////////////////////////////////////////////
// Cut out for GPIO
// GPIO cutout will be on bottom
translate([wallThickness+1,wallThickness+6.5,0]) cube([GPIOXval,GPIOYVal,baseThickness+baseSDPadMountHeigth]);

////////////////////////////////////////////////////
// Cut outs for Ports side
// HDMI
translate([baseWidthInner+wallThickness,wallThickness+6.5,baseThickness+baseSDPadMountHeigth]) cube([wallThickness,13.9,1.5]);
    // wallThickness+6.5 is how far in the hole starts
    // 13.9 is the width of the hole for the hdmi connector
    // 1.5 is how tall the cutout will be.  This should go to the top of the wall.

// USB OTG
translate([baseWidthInner+wallThickness,wallThickness+36.6,baseThickness+baseSDPadMountHeigth]) cube([wallThickness,12,1.5]);
    // wallThickness+36.6 is how far in the hole starts

//USB Power
translate([baseWidthInner+wallThickness,wallThickness+50,baseThickness+baseSDPadMountHeigth]) cube([wallThickness*.5,10.5,1.5]);

////////////////////////////////////////////////////
// Cut out for USB Stem
translate([wallThickness+8.9,baseLengthInner+wallThickness,baseThickness+3]) cube([14.5,wallThickness,2.5]);
    // wallThickness+8.9 is how far in the hole starts
    // baseThickness+3 is how high up the hole starts
    // 14.5 is the widtch of the USB connector
    // 2.5 is how tall the cutout will be














} // end difference


