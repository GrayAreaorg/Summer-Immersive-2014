
 
 import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

Capture video;

OpenCV opencv;
Rectangle[] faces;

int iOpenCvScale ;   //inverse openCV scale for performance

void setup() {
  size(640,480);
  iOpenCvScale = 4 ; 
  video = new Capture(this, 640/ iOpenCvScale , 480/ iOpenCvScale );
  opencv = new OpenCV(this, 640/ iOpenCvScale , 480/ iOpenCvScale );
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  
  video.start() ; 
}

void draw() {
  
  background(0);
  
  pushMatrix() ; 
    //Scale up the images so it fills the window
    scale( iOpenCvScale );
    opencv.loadImage(video);
  
    image(video, 0, 0 ) ; 
    //Draw a rectangle with no fill around the bounds of the area
    noFill();
    stroke(0, 255, 0);
    strokeWeight(1);
    
    //processing makes it pretty simple.
    faces = opencv.detect();
  
    //Draw each rectangle
    for (int i = 0; i < faces.length; i++)
    {
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }
  popMatrix() ; 
  
  if ( faces.length > 0 )
 { 
    //Instead of scaling we adjust the position values and draw crisper shapes
    float newX = ( faces[0].x + faces[0].width / 2 ) * iOpenCvScale ;
    float newY = ( faces[0].y + faces[0].height / 2 ) * iOpenCvScale ;
    noFill() ; 
    color( 0 , 255 , 0 ) ; 
    ellipse( newX , newY , faces[0].width , faces[0].height ) ;   
 }

}

void captureEvent(Capture c) {
  c.read();
}


