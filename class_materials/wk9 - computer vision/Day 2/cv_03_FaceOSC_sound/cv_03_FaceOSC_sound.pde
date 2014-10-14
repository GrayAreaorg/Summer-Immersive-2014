//
// a template for receiving face tracking osc messages from
// Kyle McDonald's FaceOSC https://github.com/kylemcdonald/ofxFaceTracker
//
// 2012 Dan Wilcox danomatika.com
// for the IACD Spring 2012 class at the CMU School of Art
//
// adapted from from Greg Borenstein's 2011 example
// http://www.gregborenstein.com/
// https://gist.github.com/1603230
//
import oscP5.*;
OscP5 oscP5;


import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

// num faces found
int found;

// pose
float poseScale;
PVector posePosition = new PVector();
PVector poseOrientation = new PVector();

// gesture
float mouthHeight;
float mouthWidth;
float eyeLeft;
float eyeRight;
float eyebrowLeft;
float eyebrowRight;
float jaw;
float nostrils;


// the Oscil we use for modulating frequency.
Oscil fm;
void setup() {
  size(640, 480);
  frameRate(30);

  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "poseScale", "/pose/scale");
  oscP5.plug(this, "posePosition", "/pose/position");
  oscP5.plug(this, "poseOrientation", "/pose/orientation");
  oscP5.plug(this, "mouthWidthReceived", "/gesture/mouth/width");
  oscP5.plug(this, "mouthHeightReceived", "/gesture/mouth/height");
  oscP5.plug(this, "eyeLeftReceived", "/gesture/eye/left");
  oscP5.plug(this, "eyeRightReceived", "/gesture/eye/right");
  oscP5.plug(this, "eyebrowLeftReceived", "/gesture/eyebrow/left");
  oscP5.plug(this, "eyebrowRightReceived", "/gesture/eyebrow/right");
  oscP5.plug(this, "jawReceived", "/gesture/jaw");
  oscP5.plug(this, "nostrilsReceived", "/gesture/nostrils");
  
  // initialize the minim and out objects
  minim = new Minim( this );
  out   = minim.getLineOut();
  
  // make the Oscil we will hear.
  // arguments are frequency, amplitude, and waveform
  Oscil wave = new Oscil( 200, 0.8, Waves.TRIANGLE );
  // make the Oscil we will use to modulate the frequency of wave.
  // the frequency of this Oscil will determine how quickly the
  // frequency of wave changes and the amplitude determines how much.
  // since we are using the output of fm directly to set the frequency 
  // of wave, you can think of the amplitude as being expressed in Hz.
  fm   = new Oscil( 10, 2, Waves.SINE );
  // set the offset of fm so that it generates values centered around 200 Hz
  fm.offset.setLastValue( 200 );
  // patch it to the frequency of wave so it controls it
  fm.patch( wave.frequency );
  // and patch wave to the output
  wave.patch( out );
  
 
}

void draw() {  
  background(255);
  stroke(0);
  
 
  if(found > 0) {
  
    out.resumeNotes() ; 
    pushMatrix() ;
      translate(posePosition.x, posePosition.y);
      scale(poseScale);
      noFill();
      ellipse(-20, eyeLeft * -9, 20, 7);
      ellipse(20, eyeRight * -9, 20, 7);
      ellipse(0, 20, mouthWidth* 3, mouthHeight * 3);
      ellipse(-5, nostrils * -1, 7, 3);
      ellipse(5, nostrils * -1, 7, 3);
      rectMode(CENTER);
      fill(0);
      rect(-20, eyebrowLeft * -5, 25, 5);
      rect(20, eyebrowRight * -5, 25, 5);
      
       rectMode(CORNER);
    popMatrix() ; 
   float modulateAmount = map( mouthWidth, 0, 15 , 120, 1 );
   float modulateFrequency = map( mouthHeight , 0, 20 , 0.1, 65 );
  
   fm.setFrequency( modulateFrequency );
   fm.setAmplitude( modulateAmount );
  
  
  }
  else
  {
    fm.setFrequency( 0.0001f );
   fm.setAmplitude( 0.0001f );
  }
  
  stroke( 255 );
  
  float w = 200 ; 
  float h = 200 ; 
  
  fill( 0 , 0 , 0 ) ; 
  
  
  pushMatrix() ; 
  translate( 0 , height - h ) ; 
  rect( 0 , 0 , w , h ) ; 
  // draw the waveforms
  for( int i = 0; i < out.bufferSize() - 1; i++ )
  {
    // find the x position of each buffer value
    float x1  =  map( i, 0, out.bufferSize(), 0, w );
    float x2  =  map( i+1, 0, out.bufferSize(), 0, h );
    // draw a line from one buffer position to the next for both channels
    line( x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line( x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }  
  popMatrix() ; 
  
  text( "Modulation frequency: " + fm.frequency.getLastValue(), 5, 15 );
  text( "Modulation amplitude: " + fm.amplitude.getLastValue(), 5, 30 );
  text( "mouth width: " + mouthWidth ,  5, 45 );
  text( "mouth height: " + mouthHeight , 5, 60 );

}

// OSC CALLBACK FUNCTIONS

public void found(int i) {
  println("found: " + i);
  found = i;
}

public void poseScale(float s) {
  println("scale: " + s);
  poseScale = s;
}

public void posePosition(float x, float y) {
  println("pose position\tX: " + x + " Y: " + y );
  posePosition.set(x, y, 0);
}

public void poseOrientation(float x, float y, float z) {
  println("pose orientation\tX: " + x + " Y: " + y + " Z: " + z);
  poseOrientation.set(x, y, z);
}

public void mouthWidthReceived(float w) {
  println("mouth Width: " + w);
  mouthWidth = w;
}

public void mouthHeightReceived(float h) {
  println("mouth height: " + h);
  mouthHeight = h;
}

public void eyeLeftReceived(float f) {
  println("eye left: " + f);
  eyeLeft = f;
}

public void eyeRightReceived(float f) {
  println("eye right: " + f);
  eyeRight = f;
}

public void eyebrowLeftReceived(float f) {
  println("eyebrow left: " + f);
  eyebrowLeft = f;
}

public void eyebrowRightReceived(float f) {
  println("eyebrow right: " + f);
  eyebrowRight = f;
}

public void jawReceived(float f) {
  println("jaw: " + f);
  jaw = f;
}

public void nostrilsReceived(float f) {
  println("nostrils: " + f);
  nostrils = f;
}

// all other OSC messages end up here
void oscEvent(OscMessage m) {
  if(m.isPlugged() == false) {
    println("UNPLUGGED: " + m);
  }
}
