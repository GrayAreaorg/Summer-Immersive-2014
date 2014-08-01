  PImage[] eyearray = new PImage[30];
  PImage[] moutharray = new PImage[30];
  PImage[] nosearray = new PImage[30];
  PImage[] bubblearray = new PImage[20];

void setup() {
  size(540, 220);
  frameRate(1);
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
    eyearray[11] = loadImage("eye12.jpg");
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
    
    bubblearray[0] = loadImage("word_bubble_left.jpg");
    bubblearray[1] = loadImage("word_bubble_right.jpg");
    bubblearray[2] = loadImage("word_bubble_left1.jpg");
    bubblearray[3] = loadImage("word_bubble_left2.jpg");
    bubblearray[4] = loadImage("word_bubble_left3.jpg");
    bubblearray[5] = loadImage("word_bubble_right1.jpg");
    bubblearray[6] = loadImage("word_bubble_right2.jpg");
    bubblearray[7] = loadImage("word_bubble_right3.jpg");
    bubblearray[8] = loadImage("word_bubble_left3.jpg");
    bubblearray[9] = loadImage("word_bubble_right4.jpg");
    bubblearray[10] = loadImage("word_bubble_left4.jpg");
    bubblearray[9] = loadImage("word_bubble_right5.jpg");
    bubblearray[10] = loadImage("word_bubble_left5.jpg");
    bubblearray[11] = loadImage("word_bubble_right6.jpg");
    bubblearray[12] = loadImage("word_bubble_left6.jpg");


}
void draw() {
   int r = (int) random(0, 5);
    int r1 = (int) random(0, 13);

    background(255);
    scale(0.75);
    pushMatrix();
    pushMatrix();
    image( eyearray[r1], 0, 0);
    image( nosearray[r], 15, 90);
    image( moutharray[r1], 0, 150);
    popMatrix();
    translate(170,0);
    int r2 = (int) random(0, 12);
    image(bubblearray[r2], 0, 0);
    popMatrix();
    r = (int) random(0, 5);
    r1 = (int) random(0, 10);
    
    
    translate(550,0);
    pushMatrix();
    image( eyearray[r1], 0, 0);
    image( nosearray[r], 15, 90);
    image( moutharray[r1], 0, 150);
    popMatrix();
    }


