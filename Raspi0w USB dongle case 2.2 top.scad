


baseWidth = 36;    // X
baseLength = 80;   // y
baseHeighth = 2;   // Z
baseThickness = 2;



wallThickness = 2;
wallHeigthNoBase = 6.5;
wallHeighthMinusBase = wallHeigthNoBase-baseThickness;

baseLengthInner = baseLength-(2*wallThickness);
baseWidthInner = baseWidth-(2*wallThickness);

//baseSDPadMountHeigth = 4;
baseSDColumnSupports = wallHeighthMinusBase;
screwHoleRadius = 1.5;

//SD card side
screwholeSDX1Offset = wallThickness+3.5+1; //might try .4 instead of 1
screwholeSDX2Offset = screwholeSDX1Offset+23;
screwholeSDY1Offset = wallThickness+3.5+1;

screwwholeSCameraY1Offset = screwholeSDY1Offset+58;

// Camera/STEM side
PCBThickness = 1.5;

//GPIO dimensions
GPIOXval = 7;
GPIOYVal = 54;



// translate([]) cube([]);
difference(){

union(){
////////////////////////////////////////////////////
// Base
cube([baseWidth,baseLength,baseHeighth]);

////////////////////////////////////////////////////
// WALLS
// SD Card outer wall
translate([0,0,baseThickness]) cube([baseWidth,wallThickness,wallHeighthMinusBase]);

////////////////////////////////////////////////////
// GPIO Side
translate([0,wallThickness,baseThickness]) cube([wallThickness,baseLengthInner,wallHeighthMinusBase]);

////////////////////////////////////////////////////
// Ports side (HDMI, USB, etc
translate([baseWidthInner+wallThickness,wallThickness,baseThickness]) cube([wallThickness,baseLengthInner,wallHeighthMinusBase]);
    
    // Support in between HDMI and USB
    // STEM Side
    translate([wallThickness,wallThickness+34.6,baseThickness]) cube([2,2,wallHeighthMinusBase]);
    // SD Card side
    translate([wallThickness,wallThickness+20.4,baseThickness]) cube([2,2,wallHeighthMinusBase]);
    
    // Support next to USB Power
    translate([wallThickness,wallThickness+48.6,baseThickness]) cube([2,1.4,wallHeighthMinusBase]);

////////////////////////////////////////////////////
// Camera/Stem side
translate([0,baseLengthInner+wallThickness,baseThickness]) cube([baseWidth,wallThickness,wallHeighthMinusBase]);

// RasPi PCB supports, camera/STEM side
translate([wallThickness,screwwholeSCameraY1Offset-2,baseThickness]) cube([baseWidthInner,baseLengthInner-screwwholeSCameraY1Offset+wallThickness+2,baseSDColumnSupports]);

// Above the model, supports the STEM board directly
translate([wallThickness+1,screwwholeSCameraY1Offset+4.5,baseThickness+baseSDColumnSupports]) cube([baseWidthInner-2,baseLengthInner-screwwholeSCameraY1Offset-3,PCBThickness]);
    // I made it slightly smaller (1mm on X and Y) so that it won't rub against the top when assemlbed.

////////////////////////////////////////////////////
// SD Card side 
// Raspi0w PCB rest
    // Used in the bottom, but not the top
//translate([wallThickness,wallThickness,baseThickness]) cube([baseWidthInner,7.5,baseSDPadMountHeigth]);
// Z axis of 4 is height of plate where raspi rests

// Used in top, but not bottom
translate([wallThickness,wallThickness,baseThickness]) cube([baseWidthInner,7.5,baseSDColumnSupports]);


} // end union //////////////////////////////////////
/////////////////////////////////////////////////////


//cylinder(h = height, r1 = BottomRadius, r2 = TopRadius, center = true/false);

////////////////////////////////////////////////////
// Cut outs for screws
// SD Card side screws
translate([screwholeSDX1Offset,screwholeSDY1Offset,0]) cylinder(baseThickness+baseSDColumnSupports,screwHoleRadius, screwHoleRadius,false);
translate([screwholeSDX2Offset,screwholeSDY1Offset,0]) cylinder(baseThickness+baseSDColumnSupports,screwHoleRadius, screwHoleRadius,false);

// Camera Side screws
translate([screwholeSDX1Offset,screwwholeSCameraY1Offset,0]) cylinder(baseThickness+baseSDColumnSupports,screwHoleRadius, screwHoleRadius,false);
translate([screwholeSDX2Offset,screwwholeSCameraY1Offset,0]) cylinder(baseThickness+baseSDColumnSupports,screwHoleRadius, screwHoleRadius,false);


////////////////////////////////////////////////////
// Cut out for GPIO
// GPIO cutout will be on bottom
translate([wallThickness+baseWidthInner-GPIOXval-1,wallThickness+6.5,0]) cube([GPIOXval,GPIOYVal,baseThickness+baseSDColumnSupports]);

////////////////////////////////////////////////////
// Cut outs for Ports side
// HDMI
translate([0,wallThickness+6.5,baseThickness]) cube([wallThickness+8,13.9,wallHeighthMinusBase]);
    // wallThickness+7 is how far in the hole starts
    // 13.9 is the width of the hole for the hdmi connector
    //wallThickness+8 is how deep the HDMI connector is
translate([0,wallThickness+6,0]) cube([.5*wallThickness,15,wallHeigthNoBase]);

// USB OTG
translate([0,wallThickness+36.6,baseThickness]) cube([wallThickness,12,wallHeighthMinusBase]);
    // wallThickness+36.6 is how far in the hole starts

translate([0,wallThickness+36.6,0]) cube([.5*wallThickness,12,wallHeigthNoBase]);

//USB Power
translate([.5*wallThickness,wallThickness+50,baseThickness]) cube([wallThickness*.5,10.5,wallHeighthMinusBase]);
    // 10.5 makes it match up with the PCB support

////////////////////////////////////////////////////
// Cut out for USB Stem in wall
translate([wallThickness+9.5,baseLengthInner+wallThickness,baseThickness+2.25]) cube([13.3,wallThickness,wallHeighthMinusBase-2.25]);
    // wallThickness+8.9 is how far in the hole starts
    // baseThickness+3.25 is how high up the hole starts.
    // 14.5 is the widtch of the USB connector
    // wallHeighthMinusBase-2.25 is how tall the cutout will be

////////////////////////////////////////////////////
// Cut out for SD Card access
// Removes the wall for SD card access
translate([13.3,0,0]) cube([14,wallThickness,wallHeigthNoBase]);
// Removes material inside the wallwhere the SD card is on the board
translate([9.9,wallThickness,baseThickness]) cube([17.4,7.5,wallHeighthMinusBase]);

////////////////////////////////////////////////////
// Cut out for Heatsink
translate([8,21,0]) cube([15.5,15,baseThickness]);

// Remove material for Camera/STEM side PCB support
// Just where the PCB columns are
translate([wallThickness+7,screwwholeSCameraY1Offset-2,baseThickness]) cube([18,6,wallHeighthMinusBase+PCBThickness]);
    // 6 is Y value for PCB supports

// Around the camera connector
translate([wallThickness+7,screwwholeSCameraY1Offset-2+6,baseThickness]) cube([18,2,wallHeighthMinusBase+PCBThickness]);

// Just between the columns and the wall
// Supports the USB connector directly
translate([wallThickness+9.5,screwwholeSCameraY1Offset-2+6+2,baseThickness+2.25]) cube([13.3,baseLengthInner-screwwholeSCameraY1Offset+wallThickness+2-6-2,wallHeighthMinusBase+PCBThickness]);







} // end difference


