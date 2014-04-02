//Printer
//A tab to controll your local 3D printer through the Doodle3D WiFi-Box

//IMPORTANT//----------

//It is important that you declare the printer class in your processing sketch
//An example of how to declare the printer class is: Printer printer = new Printer("10.0.0.188");
//Note that you need to add the IP adress of your WiFi-Box

//Make sure you start the printer correctly by typing printer.startUp(); in the setup()
//Wait patiently before the printer is 'homed' before sending any codes

//Make sure you type printer.update(); in your void draw();
//Please note that you can NOT print in your void setup(); in this example

//-----------

//To print, type printer.printLine(x,y,x,y,z); just like the line(); function but with an additional Z axis. The printer will use your sketch size(); as borders for the printer
//It is adviced to start your print with a print.cleanNozzle();, this will make an start printline
//This will cleaning your nozzle and makes sure you can print filament

//To cancel a print or simply to return the printhead home use the printer.returnHome(); function

import httprocessing.*;

//You need to define your WiFi-Box IP. 
//It is possible to find out your WiFi-Box IP by 
//browsing to connect.doodle3D.com and select your WiFi-Box.
//Your WiFi-Box IP will be showed in URL of your browser.
Printer printer = new Printer("10.0.0.188");

void setup() {
  size(100,100);
  printer.startUp();
}

void draw() {
  printer.update();
}


