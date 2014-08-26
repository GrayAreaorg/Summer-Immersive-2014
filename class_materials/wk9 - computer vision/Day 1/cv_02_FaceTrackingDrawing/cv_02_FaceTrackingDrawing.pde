
 
 import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

Capture video;

OpenCV opencv;
Rectangle[] faces;
PVector prevLocation ; 

int iOpenCvScale ;   //inverse openCV scale for performance

void setup() {
  size(640,480);
  iOpenCvScale = 4 ; 
  video = new Capture(this, 640/ iOpenCvScale , 480/ iOpenCvScale );
  opencv = new OpenCV(this, 640/ iOpenCvScale , 480/ iOpenCvScale );
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  
  video.start() ; 
  prevLocation = new PVector( 0.0 , 0.0f ) ; 
}

void draw() {
  
  //background(0); 
 
  opencv.loadImage(video);
  image( video , 0 , 0) ; 
  //Draw a rectangle with no fill around the bounds of the area
  
    
  //processing makes it pretty simple.
  faces = opencv.detect(); 
  
  if ( faces.length > 0 )
 { 
    noFill();
    stroke(0, 255, 0);
    strokeWeight(1);
    rect(faces[0].x, faces[0].y, faces[0].width, faces[0].height );
    stroke(0, 0, 0);
    strokeWeight(1);
    fill( random( 25 , 255 ) , 0 , 0  ) ; 
    //Instead of scaling we adjust the position values and draw crisper shapes
    float newX = ( faces[0].x + faces[0].width / 2 ) * iOpenCvScale ;
    float newY = ( faces[0].y + faces[0].height / 2 ) * iOpenCvScale ;
    PVector thisLocation = new PVector( newX , newY ) ; 
    float distance = thisLocation.dist( prevLocation ) ; 
    float circleRadius = map( distance , 0.0 , 25.0f , 5.0f , 50.0f ) ; 
    ellipse( newX , newY , circleRadius , circleRadius  ) ;   
    
    
    prevLocation = new PVector( newX , newY ) ; 
 }

}

void captureEvent(Capture c) {
  c.read();
}


