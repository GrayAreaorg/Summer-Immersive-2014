import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

OpenCV opencv;
Capture cam;

Rectangle[] faces;

void setup() {
  size(320, 240);
  cam = new Capture(this, 320, 240);
  cam.start();

  opencv = new OpenCV(this, cam.width, cam.height);

  // Which "cascade" are we going to use?
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  //  opencv.loadCascade(OpenCV.CASCADE_EYE);  
  //  opencv.loadCascade(OpenCV.CASCADE_NOSE);
}

void captureEvent(Capture cam) {
  cam.read();
}

void draw() {
  background(0);
  opencv.loadImage(cam);
  faces = opencv.detect();
//  image(cam, 0, 0);

  if (faces != null) {
    for (int i = 0; i < faces.length; i++) {
//      strokeWeight(2);
//      stroke(255, 0, 0);
//      noFill();
//      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }

    if (faces.length >= 1) {
      stroke(255);
      textSize(32);
      text("HELLO WORLD!", 30, 40);
    }
  }
}

