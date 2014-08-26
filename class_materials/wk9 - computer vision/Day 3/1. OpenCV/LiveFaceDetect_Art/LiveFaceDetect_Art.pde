import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

OpenCV opencv;
Capture cam;

Rectangle[] faces;

float num = 0;
int faceX = 0;
int faceY = 0;

void setup() {
  size(640, 480, P2D);
  frameRate(30);
  cam = new Capture(this, 640, 480);
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
//      num = faces[i].x;
      num = map(faces[i].x, 0, width, 10, 20);

//      faceY = faces[i].y;
    }
  }
  drawArt();
}


void drawArt() {
  stroke(255);
  fill(0, 50);
  rect(0, 0, width, height);

  /* Smaller the number the slower the effect */
  num += 0.01;
  pushMatrix();

  /* Middle of pattern. replace with mouseX and mouseY to make it follow your mouse */
  translate(width/2, height/2);

  /* Rotate entire pattern. Optional: num or nothing */
  rotate(-num);
  for (int i = 0; i < 360; i+=15) {
    float x = cos(radians(i))*150;
    float y = sin(radians(i))*150;

    /* Change line() to rect() or ellipse() */
    pushMatrix();
    translate(x, y);
    rotate(num);
    line(0, 0, x, y);
    rotate(num/2);
    line(0, 0, x, y);
    rotate(num/4);
    line(0, 0, x, y);
    popMatrix();
  }
  popMatrix();
}

