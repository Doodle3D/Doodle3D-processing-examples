//for the example you need the 'httprocessing' library by Chris Allick and Daniel Shiffman. 
//You can add the library through Sketch>import library>add library... and search for 'httprocessing'
import httprocessing.*;
String boxIP = "10.0.0.188";
PostRequest post = new PostRequest("http://"+boxIP+"/d3dapi/printer/print");

void setup() {
  post.addData("gcode", "G28 X0.0 Y0.0 Z0.0"); //Send the printer to the x0 and y0 position
  post.addData("start", "true");
  post.send();
  size(100, 100);
}

void draw() {
  //press a key to activate
  if (keyPressed) {
    point(mouseX,mouseY);
    //makes the printer move to the mouse location.
    //Note that the X and Y will expand if you expand the size() and it is possible that you make the printer move outside of its border!
    //This can do harm to your 3Dprinter!!
    post.addData("gcode", "G1 X"+mouseX+" Y"+mouseY+" F5000");
    post.addData("start", "true");
    post.send();
  }
}
