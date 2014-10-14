import gab.opencv.*;
import processing.video.*;
import java.awt.*;

PFont font;
Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  // Create the font
  printArray(PFont.list());
  font = loadFont("Arial-BoldMT-12.vlw");
  textFont(font, 32);  
  video.start();
}

void draw() {
  background(0);
  scale(2);
  opencv.loadImage(video);
//  image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
//    stroke(2);
//    println(faces[i].x + "," + faces[i].y);
//    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
  
  if (faces.length >= 1) {
    stroke(255);
    textFont(font,12);
    text("HELLO WORLD!", 10, 20);
  }
}

void captureEvent(Capture c) {
  c.read();
}

