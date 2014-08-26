import oscP5.*;
OscP5 oscP5;
SmartRobot robot;

int found;
float smileThreshold = 16;
float mouthWidth, previousMouthWidth;
PFont font;
float num = 0;


void setup() {
  size(640, 640, P2D);
  frameRate(30);
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "mouthWidthReceived", "/gesture/mouth/width");
  try {
    robot = new SmartRobot();
  } 
  catch (AWTException e) {
  }
  font = createFont("Helvetica", 64);
  textFont(font);
  textAlign(LEFT, TOP);
}

void draw() {  
  background(0);

  if (found > 0) {
    //     num = map(mouthWidth, 10, 25, 0, width);
    num = mouthWidth;
  }
  drawArt();
}


public void found(int i) {
  found = i;
}

public void mouthWidthReceived(float w) {
  mouthWidth = w;
}

// all other OSC messages end up here
void oscEvent(OscMessage m) {
  if (m.isPlugged() == false) {
  }
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

