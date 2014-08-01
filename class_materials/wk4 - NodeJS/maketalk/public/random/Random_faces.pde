Face face1;
void setup() {
  size(800, 800);
  frameRate(30);
}
void draw() {
  face1 = new Face();
  background(255); 
  scale(0.5);
  face1.display();
  translate(160, 0);
  face1.display();
  translate(170, 0);
  face1.display();
  translate(180, 0);
  face1.display();
  translate(190, 0);
  face1.display();
  translate(200, 0);
  face1.display();
  translate(210, 0);
  face1.display();
  translate(220, 0);
  face1.display();

}

class Face { 

  PImage[] eyearray = new PImage[30];
  PImage[] moutharray = new PImage[30];
  PImage[] nosearray = new PImage[30];

  // The Constructor is defined with arguments.
  Face () { 
    eyearray[0] = loadImage("eye1.jpg");
    eyearray[1] = loadImage("eye2.jpg");
    eyearray[2] = loadImage("eye3.jpg");
    eyearray[3] = loadImage("eye4.jpg");
    eyearray[4] = loadImage("eye6.jpg");
    eyearray[5] = loadImage("eye7.jpg");
    eyearray[6] = loadImage("eye8.jpg");
    eyearray[7] = loadImage("eye9.jpg");
    eyearray[8] = loadImage("eye10.jpg");
    eyearray[9] = loadImage("eye11.jpg");
    eyearray[10] = loadImage("eye12.jpg");
    eyearray[11] = loadImage("eye13.jpg");
    eyearray[12] = loadImage("eye14.jpg");


    nosearray[0] = loadImage("nose1.jpg");
    nosearray[1] = loadImage("nose2.jpg");
    nosearray[2] = loadImage("nose3.jpg");
    nosearray[3] = loadImage("nose4.jpg");
    nosearray[4] = loadImage("nose5.jpg");

    moutharray[0] = loadImage("mouth1.jpg");
    moutharray[1] = loadImage("mouth2.jpg");
    moutharray[2] = loadImage("mouth3.jpg");
    moutharray[3] = loadImage("mouth4.jpg");
    moutharray[4] = loadImage("mouth5.jpg");
    moutharray[5] = loadImage("mouth6.jpg");
    moutharray[6] = loadImage("mouth7.jpg");
    moutharray[7] = loadImage("mouth8.jpg");
    moutharray[8] = loadImage("mouth9.jpg");
    moutharray[9] = loadImage("mouth10.jpg");
    moutharray[10] = loadImage("mouth11.jpg");
    moutharray[11] = loadImage("mouth12.jpg");
    moutharray[12] = loadImage("mouth13.jpg");
    moutharray[13] = loadImage("mouth14.jpg");
  }

  void display() {
    stroke(0);
    int r = (int) random(0, 5);
    int r1 = (int) random(0, 13);
    
    pushMatrix();
    image( eyearray[r1], 0, 0);
    image( nosearray[r], 15, 90);
    image( moutharray[r1], 0, 150);
    popMatrix();
  }
}

