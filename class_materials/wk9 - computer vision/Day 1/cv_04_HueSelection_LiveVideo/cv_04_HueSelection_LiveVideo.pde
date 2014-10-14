
import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;
import org.opencv.imgproc.Imgproc;

Capture video;
OpenCV opencv;
Histogram histogram;

int iOpenCvScale ;   //inverse openCV scale

int minHue = 100;
int maxHue = 255;

ArrayList<Contour> contours;
ArrayList<Contour> polygons;


PImage blurImage ; 
PImage grayImage ; 
PImage hueSelection ; 
PImage threshold ; 

void setup() {
  int w = 640 ; 
  int h = 480 ; 
  
  size(640 + 640 / 3 ,480);

  iOpenCvScale = 4 ; 
  video = new Capture(this, w/ iOpenCvScale , h/ iOpenCvScale );
  opencv = new OpenCV(this, video );
  opencv.useColor(HSB);
  video.start() ; 
}

void draw() {
 
  background(0);
 
  pushMatrix() ; 
    scale( iOpenCvScale );
    opencv.loadImage(video);
    opencv.useColor(HSB);
    image(video, 0, 0 );
  popMatrix() ; 
  
  noFill();
  strokeWeight(3);
 
  opencv.setGray(opencv.getH().clone());
  grayImage = opencv.getSnapshot() ; 
  
  
  opencv.inRange(minHue, maxHue);
  histogram = opencv.findHistogram(opencv.getH(), 255);
  hueSelection = opencv.getSnapshot() ; 
  opencv.blur(7);
  blurImage = opencv.getSnapshot();
  
  opencv.adaptiveThreshold(591, 1);
  threshold = opencv.getSnapshot();
  
  contours = opencv.findContours();
  for (Contour contour : contours) 
  {
    stroke( 255 , 0 , 0 );
    //contour.draw();
    
    stroke(255, 0, 0);
    beginShape();
    for (PVector point : contour.getPolygonApproximation().getPoints()) 
    {
      vertex( point.x * iOpenCvScale , point.y * iOpenCvScale );
    }
    endShape();
  }
  
  pushMatrix() ; 
    translate( video.width * iOpenCvScale  , 0 ) ; 
    
    int thumbW = width / 4 ; 
    int thumbH = height / 4 ; 
    //image(opencv.getOutput(), width + 10 , 3*height/4, width/4,height/4);
    image( grayImage , 0 , 0  , thumbW, thumbH ) ;
    image( hueSelection , 0 , video.height , thumbW, thumbH );
    image( blurImage , 0 , video.height * 2 , thumbW, thumbH );
    image( threshold , 0 , video.height * 3 , thumbW, thumbH );
    
  popMatrix() ; 
  noStroke(); 
  fill(0);
  histogram.draw(10, height - 230, 400, 200);
  noFill(); stroke(0);
  line(10, height-30, 410, height-30);

  text("Hue", 10, height - (textAscent() + textDescent()));

  float lb = map(minHue, 0, 255, 0, 400);
  float ub = map(maxHue, 0, 255, 0, 400);

  stroke(255, 0, 0); fill(255, 0, 0);
  strokeWeight(2);
  line(lb + 10, height-30, ub +10, height-30);
  ellipse(lb+10, height-30, 3, 3 );
  text(minHue, lb-10, height-15);
  ellipse(ub+10, height-30, 3, 3 );
  text(maxHue, ub+10, height-15);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(1);
 
  
}


void mouseDragged() {
 
  minHue = (int)map( mouseX , 0 , 640 , 0 , 255 ) ; 
  float histogramLength = map( mouseY , 0 , height , 0 , 255 ) ;
  maxHue = (int)( minHue + histogramLength ) ; 
  
  maxHue = constrain( maxHue , minHue , 255 );
  minHue = constrain( minHue, 0, maxHue-1 );
}

void captureEvent(Capture c) {
  c.read();
}


