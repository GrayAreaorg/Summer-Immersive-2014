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
 
 import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

Capture video;
ParticleSystem ps;
OpenCV opencv;
Rectangle[] faces;

int iOpenCvScale ;   //inverse openCV scale
void setup() {
  size(640,480);
  ps = new ParticleSystem(new PVector(width/2,50));
  iOpenCvScale = 4 ; 
  video = new Capture(this, 640/ iOpenCvScale , 480/ iOpenCvScale );
  opencv = new OpenCV(this, 640/ iOpenCvScale , 480/ iOpenCvScale );
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  
  video.start() ; 
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
  faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
  
  popMatrix() ; 
  
  if ( faces.length > 0 )
 { 
    ps.origin.x = faces[0].x + faces[0].width / 2 ;
    ps.origin.x *= iOpenCvScale ; 
    ps.origin.y = faces[0].y + faces[0].height / 2 ;
    ps.origin.y *= iOpenCvScale ;  
    ps.origin.z = 0 ;  
 }
  ps.addParticle();
  ps.run();
}

void captureEvent(Capture c) {
  c.read();
}


