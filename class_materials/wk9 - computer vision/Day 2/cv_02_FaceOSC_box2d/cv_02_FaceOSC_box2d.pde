//
// a template for receiving face tracking osc messages from
// Kyle McDonald's FaceOSC https://github.com/kylemcdonald/ofxFaceTracker
//
// 2012 Dan Wilcox danomatika.com
// for the IACD Spring 2012 class at the CMU School of Art
//
// adapted from from Greg Borenstein's 2011 example
// http://www.gregborenstein.com/
// https://gist.github.com/1603230
//
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

import org.jbox2d.dynamics.*;
 import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

import oscP5.*;
OscP5 oscP5;

// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;

Boundary faceBoundary ; 

// num faces found
int found;

// pose
float poseScale;
PVector posePosition = new PVector();
PVector poseOrientation = new PVector();

// gesture
float mouthHeight;
float mouthWidth;
float eyeLeft;
float eyeRight;
float eyebrowLeft;
float eyebrowRight;
float jaw;
float nostrils;

Boundary mouthBoundary ; 
boolean bFaceExists ; 
    
void setup() {
  size(640, 480);
  frameRate(30);

  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "poseScale", "/pose/scale");
  oscP5.plug(this, "posePosition", "/pose/position");
  oscP5.plug(this, "poseOrientation", "/pose/orientation");
  oscP5.plug(this, "mouthWidthReceived", "/gesture/mouth/width");
  oscP5.plug(this, "mouthHeightReceived", "/gesture/mouth/height");
  oscP5.plug(this, "eyeLeftReceived", "/gesture/eye/left");
  oscP5.plug(this, "eyeRightReceived", "/gesture/eye/right");
  oscP5.plug(this, "eyebrowLeftReceived", "/gesture/eyebrow/left");
  oscP5.plug(this, "eyebrowRightReceived", "/gesture/eyebrow/right");
  oscP5.plug(this, "jawReceived", "/gesture/jaw");
  oscP5.plug(this, "nostrilsReceived", "/gesture/nostrils");

  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -20);

  // Create ArrayLists  
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>() ; 
 
  // Add a bunch of fixed boundaries
  boundaries.add(new Boundary( 5 , height / 2 , 10 , height  - 10 ) ) ; 
  boundaries.add(new Boundary( width -5 , height / 2 , 10 , height - 10  )) ; 

  //faceBoundary = new Boundary( width / 2 , height / 2 ,  10 ,10 );
  bFaceExists = true ; 
  
  mouthBoundary = new Boundary(10 , 10 , 10 , 10 );

  
}

void draw() {  
  background(255);
  stroke(0);
  
  //Reset our face particle each frame
  if ( bFaceExists ) 
  {
     box2d.destroyBody( mouthBoundary.b ) ; 
     bFaceExists = false ; 
  } 
  
  if(found > 0) 
  {
    bFaceExists = true ; 
    
    float _x = posePosition.x ; 
    float _y = posePosition.y ;
    
    pushMatrix() ; 
      translate( _x , _y );
      scale(poseScale);
      float scale = poseScale ; 
      noFill();
      ellipse(-20, eyeLeft * -9, 20, 7);
      ellipse(20, eyeRight * -9, 20, 7);
      ellipse(0, 20, mouthWidth* 3, mouthHeight * 3);
      ellipse(-5, nostrils * -1, 7, 3);
      ellipse(5, nostrils * -1, 7, 3);
      rectMode(CENTER);
      noFill();
      rect(-20, eyebrowLeft * -5, 25, 5);
      rect(20, eyebrowRight * -5, 25, 5);
    popMatrix() ; 
     
     
     rectMode(CORNER);
    //_x *= poseScale ;  
    //_y *= poseScale ; 
    
     println( "poseScale" + poseScale ) ; 
    float w = mouthWidth* 3 * scale ; 
    float h = mouthHeight * 3 * scale ; 
    mouthBoundary = new Boundary( (_x ) , (_y ) + 110  , w , h ) ; 
   
  }
  
  box2d.step();

  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }
  
  //eyebrowRightBox.display() ; 
  //mouthBoundary.display() ; 

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }

  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
  
    if (random(1) < 0.1) {
    Box p = new Box(random(width),10);
    boxes.add(p);
  }
}

// OSC CALLBACK FUNCTIONS

public void found(int i) {
  println("found: " + i);
  found = i;
}

public void poseScale(float s) {
  println("scale: " + s);
  poseScale = s;
}

public void posePosition(float x, float y) {
  println("pose position\tX: " + x + " Y: " + y );
  posePosition.set(x, y, 0);
}

public void poseOrientation(float x, float y, float z) {
  println("pose orientation\tX: " + x + " Y: " + y + " Z: " + z);
  poseOrientation.set(x, y, z);
}

public void mouthWidthReceived(float w) {
  println("mouth Width: " + w);
  mouthWidth = w;
}

public void mouthHeightReceived(float h) {
  println("mouth height: " + h);
  mouthHeight = h;
}

public void eyeLeftReceived(float f) {
  println("eye left: " + f);
  eyeLeft = f;
}

public void eyeRightReceived(float f) {
  println("eye right: " + f);
  eyeRight = f;
}

public void eyebrowLeftReceived(float f) {
  println("eyebrow left: " + f);
  eyebrowLeft = f;
}

public void eyebrowRightReceived(float f) {
  println("eyebrow right: " + f);
  eyebrowRight = f;
}

public void jawReceived(float f) {
  println("jaw: " + f);
  jaw = f;
}

public void nostrilsReceived(float f) {
  println("nostrils: " + f);
  nostrils = f;
}

// all other OSC messages end up here
void oscEvent(OscMessage m) {
  if(m.isPlugged() == false) {
    println("UNPLUGGED: " + m);
  }
}
