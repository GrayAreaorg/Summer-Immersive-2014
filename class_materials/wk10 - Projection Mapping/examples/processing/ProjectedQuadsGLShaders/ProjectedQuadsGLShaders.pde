import processing.video.*;

import javax.media.opengl.GL2;
GL2 gl;

/*
  ProjectedQuads - a simple class for projection mapping
  Copyright (c) 2010 Marcin Ignac http://marcinignac.com  

  ProjectedQuads / ProjectedQuadsTest.pde
  v1.0 / 2010.01.30  

  Modified 2014 Gabriel Dunne http://gabrieldunne.com
     - Added Shaders
     - Enabled OPENGL Support
     - Cleaned up main
     - Changed some key commands
  
  Keyboard:
  'SPACE' toggle debug mode
  's' save settings
  'l' load settings
  '.' select next quad in debug mode
  ',' select prev quad in debug mode
  '1', '2', '3', '4' select one of selected quad's corners 
  Arrow keys move selected corner's position (you can also use mouse)  
*/

// configuration file location
String configFile = "data/quadsconfig.txt";

// projected quads
ProjectedQuads quads;

// a set of graphics routines

// shaders
PShader texShader, 
        bwShader,
        embossShader,
        edgesShader,
        colorShader,
        colorShader2;

// graphics buffers 
PGraphics graphics1, 
          camGfx, 
          camShaderGfx, 
          imgShader,
          colorShaderGfx,
          colorShader2Gfx;

// images
PImage img0;

void setup() {
  
  size(displayWidth, displayHeight, OPENGL);
  gl = ((PJOGL)beginPGL()).gl.getGL2();
  
  setupCamCapture();
  
  // load shaders
  edgesShader = loadShader("edgesfrag.glsl");
  texShader = loadShader("texfrag.glsl");
  bwShader = loadShader("bwfrag.glsl");
  embossShader = loadShader("embossfrag.glsl");
  colorShader = loadShader("colorfrag1.glsl");
  colorShader2 = loadShader("colorfrag2.glsl");
  
  
  // create new set of quads
  quads = new ProjectedQuads(5);
   
  // quad 0
  colorShaderGfx = createGraphics(720, 480, OPENGL);
  quads.getQuad(0).setTexture(colorShaderGfx);
  
  // quad 1  
  graphics1 = createGraphics(256, 256, OPENGL);
  quads.getQuad(1).setTexture(graphics1); 
   
  // quad 2
  quads.getQuad(2).setTexture(loadImage("suchmapping.jpeg"));
  
  // quad 3
  camGfx = createGraphics(640, 480, OPENGL);
  quads.getQuad(3).setTexture(camGfx);
  
  // quad 4
  camShaderGfx = createGraphics(640, 480, OPENGL);
  quads.getQuad(4).setTexture(camShaderGfx);
  quads.getQuad(4).setMirrored(true);
  
}

void draw() {  

  // update the camera
  readCamera();
  
  // update shaders
  colorShader.set("time", (float)(millis() / 1000.0));
  colorShader.set("resolution", float(colorShaderGfx.width), float(colorShaderGfx.height));
 
  
  // draw graphic routines
  marcinStripes(graphics1);
  imageTexShader(camGfx, cam, bwShader);
  imageTexShader(camShaderGfx, cam, edgesShader);
  colorShader(colorShaderGfx, colorShader);
  

  background(0);
  quads.draw();
}





///////////////////////////////////////////////////////////////
// graphics routines
///////////////////////////////////////////////////////////////

// video capture
Capture cam;

///////////////////////////////////////////////////////////////
// setup external cameras
void setupCamCapture() {
  // set up camera for capture
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }
}

// read camera if it's available
void readCamera() {
   // draw video buffers from camera
  if (cam.available() == true) {
    cam.read();
  } 
}

// draw image graphics
void imageTex(PGraphics buffer, PImage image) {
  buffer.beginDraw();
  buffer.background(0);
  buffer.image(image, 0, 0);
  buffer.endDraw(); 
}

// draw color shader
void colorShader(PGraphics buffer, PShader shader) {
  buffer.beginDraw();
  buffer.background(0);
  buffer.shader(shader);
  buffer.rect(0,0,buffer.width, buffer.height);
  buffer.endDraw();
}

// draw texture graphics with a shader
void imageTexShader(PGraphics buffer, PImage image, PShader shader) {
  buffer.beginDraw();
  buffer.background(0);
  buffer.shader(shader);
  buffer.image(image, 0, 0);
  buffer.endDraw(); 
}

// stripes by marcin ignac
void marcinStripes(PGraphics buffer) {
  // draw some animation code on buffer
  buffer.beginDraw();
  buffer.background(0, 00255);
  buffer.stroke(255);
  buffer.strokeWeight(10);
  buffer.noFill();
  buffer.rect(0, 0, buffer.width, buffer.height);
  buffer.noStroke();
  buffer.strokeWeight(3);
  buffer.fill(255);
  float[] speeds = {1, 1.25, 1.5, 2.0, 2.5, 3};
  for(int i=0; i<speeds.length; i++) {
    float x = buffer.width * (0.5 + 0.5 * sin(frameCount/100.0*speeds[i]));
    buffer.rect(x, 0, 10*speeds[i], buffer.height);  
  }
  buffer.endDraw();  
}





///////////////////////////////////////////////////////////////
// interaction routines
///////////////////////////////////////////////////////////////

void keyPressed() {
  // give a keypressed event to quads
  quads.keyPressed();
  if (key == 's') {
    quads.save(configFile);
  }
  if (key == 'l') {
    quads.load(configFile);
  }
  if (key == ' ') {
    // toggle debug/design/setup mode
    quads.setDebugMode(!quads.getDebugMode());
  }  
}

void mousePressed() {
  // let quads handle its own mousePressed
  quads.mousePressed();
}

void mouseDragged() {
  // let quads handle its own mouseDragged
  quads.mouseDragged();
}


