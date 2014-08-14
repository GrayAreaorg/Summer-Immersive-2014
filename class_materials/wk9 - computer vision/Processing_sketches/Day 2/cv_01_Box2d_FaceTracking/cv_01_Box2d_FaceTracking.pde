/**

Based off of
 * Simple Particle System
 * by Daniel Shiffman.  
 * 
 * Particles are generated each cycle through draw(),
 * fall with gravity and fade out over time
 * A ParticleSystem object manages a variable size (ArrayList) 
 * list of particles. 
 */
 
 // The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// Box2DProcessing example
// Basic example of falling rectangles

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

import org.jbox2d.dynamics.*;
 import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;
// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;

///Video feed from webcam
Capture video;

//OpenCV rectangle
OpenCV opencv;

Boundary faceBoundary ; 

int iOpenCvScale ;   //inverse openCV scale
boolean bFaceExists ; 

void setup() {
  size(640,480);

  iOpenCvScale = 8 ; 
  video = new Capture(this, 640/ iOpenCvScale , 480/ iOpenCvScale );
  opencv = new OpenCV(this, 640/ iOpenCvScale , 480/ iOpenCvScale );
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  
  video.start() ; 
  
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -20);

  // Create ArrayLists  
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>() ; 
 
  // Add a bunch of fixed boundaries
  boundaries.add(new Boundary( width/2 ,height-5,width,10) );
  boundaries.add(new Boundary( width/2 ,5 ,width,10) );
  boundaries.add(new Boundary( 5 , height / 2 , 10 , height  - 10 ) ) ; 
  boundaries.add(new Boundary( width -5 , height / 2 , 10 , height - 10  )) ; 

  faceBoundary = new Boundary( width / 2 , height / 2 ,  10 ,10 );
  bFaceExists = true ; 
    
}

void draw() {
  
  background(0);
  
  pushMatrix() ; 
    scale( iOpenCvScale );
    opencv.loadImage(video);
    image(video, 0, 0 );
    noFill();
    stroke(0, 255, 0);
    strokeWeight(1);
   Rectangle[] faces = opencv.detect();
    println(faces.length);
  popMatrix() ;
  
  //Reset our face particle each frame
  if ( bFaceExists ) 
  {
     box2d.destroyBody( faceBoundary.b ) ; 
     bFaceExists = false ; 
  } 
  
  for (int i = 0; i < faces.length; i++) 
  {
      float w = faces[i].width * iOpenCvScale ; 
      float h = faces[i].height * iOpenCvScale ;
      float x  = faces[i].x * iOpenCvScale + faceBoundary.w / 2 ;  
      float y = faces[i].y * iOpenCvScale + faceBoundary.h / 2 ; 
      faceBoundary = new Boundary( x , y , w , h ) ;
     
     
      //Calculate the normalized position of the head. This will effect the gravity of the world
      float maxGravity = 30.0f ; 
      float gravityX = map( x , 0 , width , -maxGravity , maxGravity ) ; 
      float gravityY = map( y , 0 , height , maxGravity , -maxGravity ) ;
      
      box2d.setGravity ( gravityX , gravityY ) ; 
      
      //OR have them attract to your face
      // for (Box b: boxes)
      //{
      //   b.attract( x , y );
      // }
      
      bFaceExists = true ; 
  }
  
  
  box2d.step();

  // When the mouse is clicked, add a new Box object
   if (random(1) < 0.1) {
    Box p = new Box(random(width),10);
    boxes.add(p);
  }
  

 // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }


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

  if ( bFaceExists ) 
  {
    fill(255 , 255 , 255 , 60 );
    stroke(0);
    rectMode(CENTER);
    rect(faceBoundary.x,faceBoundary.y,faceBoundary.w,faceBoundary.h);
  }
  
}

void captureEvent(Capture c) {
  c.read();
}


