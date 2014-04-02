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

//FUNCTIONS:
/* 
 NEEDED:
 startUp()                 //Will make your printer start ready. You add startUp() in your setup()
 update()                  //Is needed to buffer the print that is send. You add update() in your draw()
 
 OPTIONAL:
 returnHome()             //Stop the current print and will return to the homing position
 cleanNozzle()            //Draw an line along the left side of your printer to clean the nozzle and wont lift up and retract filament after, 
                          //which makes it a nice way to start a print
 startStopFan()           //Turn the fan on when it is off and will turn it of when it is on
 myTranslate()            //place a new x and y position to start from
 moveTo()                 //places a new start position to start the next line from
 lineTo()                 //place a new end position to end the next line from
 receiveConfigAll()       //define and print the dimensions of the printer
 printlnReceivedConfig()  //only print the dimensions of the printer
 */

//for the example you need the 'httprocessing' library by Chris Allick and Daniel Shiffman. 
//You can add the library through Sketch>import library>add library... and search for 'httprocessing'
import httprocessing.*;

//You need to define your WiFi-Box IP. 
//It is possible to find out your WiFi-Box IP by 
//browsing to connect.doodle3D.com and select your WiFi-Box.
//Your WiFi-Box IP will be showed in URL of your browser.
Printer printer = new Printer("10.0.0.188");

void setup() {
  size(500, 500);
  printer.startUp();
}

void draw() {
  printer.update();
}

void keyReleased(){
  printer.cleanNozzle();
  if(key == ' '){
    for(int z = 0; z<100; z++){
    printer.printLine(10,10,110,10,z);
    printer.printLine(110,10,110,110,z);
    printer.printLine(110,110,10,110,z);
    printer.printLine(10,110,10,10,z);
    }
  }
  if(key == 'q'){
    printer.returnHome();
  }
}
