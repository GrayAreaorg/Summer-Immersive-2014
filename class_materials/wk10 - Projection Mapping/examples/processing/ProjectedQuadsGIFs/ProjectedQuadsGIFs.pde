/*
  ProjectedQuads - a simple class for projection mapping demo
  
  Added GIF support.
  Library Required.
  Add "GIF Animation" library from "Sketch > Import Library" 
  
  ProjectedQuads / ProjectedQuadsTest.pde
  v1.0 / 2010.01.30
  
  Keyboard:
  - 'd' toggle debug mode
  - 'S' save settings
  - 'L' load settings
  - '>' select next quad in debug mode
  - '<' select prev quad in debug mode
  - '1', '2', '3', '4' select one of selected quad's corners 
  - Arrow keys (left, right, up, down) move selected corner's position (you can also use mouse for that)  
*/

/* 
 * Copyright (c) 2010 Marcin Ignac http://marcinignac.com
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */
 
String configFile = "data/quadsconfig.txt";

ProjectedQuads projectedQuads;
PImage    quadImage;  
PGraphics quadGraphics;
import gifAnimation.*;
PImage[] animation;
Gif loopingGif;
Gif loopingGif1;
Gif loopingGif2;
Gif loopingGif3;
Gif loopingGif4;

void setup() {
   size(displayWidth, displayHeight, P3D);
  loopingGif = new Gif(this, "giphy.gif");
  loopingGif.loop();
   loopingGif1 = new Gif(this, "7.gif");
  loopingGif1.loop();
    loopingGif2 = new Gif(this, "2.gif");
  loopingGif2.loop();
      loopingGif3 = new Gif(this, "5.gif");
  loopingGif3.loop();
        loopingGif4 = new Gif(this, "11.gif");
  loopingGif4.loop();
  projectedQuads = new ProjectedQuads();  
  projectedQuads.load(configFile);  
  //we want to display 3 quads so if there was no config file
  //or less than 3 were defined we increase number to 3
  if (projectedQuads.getNumQuads() < 5) {
    projectedQuads.setNumQuads(5);  
  }  
   
  quadImage = loadImage("checker.png");
  projectedQuads.getQuad(0).setTexture(loopingGif);
  
  quadGraphics = createGraphics(256, 256, P2D);
  projectedQuads.getQuad(1).setTexture(loopingGif1); 
  //you can use the same texture for many quads
  projectedQuads.getQuad(2).setTexture(loopingGif2); 
  //mirror the texture while drawing
  projectedQuads.getQuad(2).setMirrored(true); 
  projectedQuads.getQuad(3).setTexture(loopingGif3); 
  projectedQuads.getQuad(4).setTexture(loopingGif4); 
}

void draw() {
  background(0);
  
  //animation code is here
  quadGraphics.beginDraw();
  quadGraphics.background(0, 00255);
  quadGraphics.stroke(255);
  quadGraphics.strokeWeight(10);
  quadGraphics.noFill();
  quadGraphics.rect(0, 0, quadGraphics.width, quadGraphics.height);
  quadGraphics.noStroke();
  quadGraphics.strokeWeight(3);
  quadGraphics.fill(255);
  float[] speeds = {1, 1.25, 1.5, 2.0, 2.5, 3};
  for(int i=0; i<speeds.length; i++) {
    float x = quadGraphics.width * (0.5 + 0.5*sin(frameCount/100.0*speeds[i]));
    quadGraphics.rect(x, 0, 10*speeds[i], quadGraphics.height);  
  }
  quadGraphics.endDraw();
  
  //draw projected quads on the screen
  projectedQuads.draw();
}

void keyPressed() {
  //let projectedQuads handle keys by itself
  projectedQuads.keyPressed();
}

void mousePressed() {
  //let projectedQuads handle mousePressed by itself
  projectedQuads.mousePressed();
}

void mouseDragged() {
  //let projectedQuads handle mouseDragged by itself
  projectedQuads.mouseDragged();
}

