import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class rswang_baseFile extends PApplet {

//float angle = 0;
//float jitter;
float x, y;
float dim = 80.0f;


// global variables
int wid = 600;
int hei = 600;

// setup
public void setup()
{
  // viewport size
  size(wid, hei, P3D);
}

// draw
public void draw()
{
  background(102);
//  if (second() % 2 == 0) {  
//    jitter = random(-0.1, 0.1);
//  }
//  angle = angle + jitter;
//  float c = cos(angle);
//  translate(width/2, height/2);
//  rotate(angle);
  
  x = x + 0.8f;
  
  if (x > width + dim) {
    x = -dim;
  } 
  
  translate(x, height/2-dim/2);

  
  // ---------------------- YOUR CODE HERE
  fill(0, 0,0);
  noStroke();
  ellipse(0, 0, 100, 100);  
  stroke(0);
  fill(255,255,255);
  ellipse(30, -14, 50, 50);  
  
  
//  ellipseMode(CORNER);
  fill(0,0,0);
  ellipse(35,-15,4,15);
  
  fill(0,0,0);
  rect(-75,-20, 55, 30, 3, 6, 12, 18);
  
  fill(255,255,255);
  rect(13, 11, 40, 10, 7);
  rect(12, 21, 40, 10, 7);
//  // example drawing
//  fill(0);
//  rectMode(CENTER);
//  rect(0,0, 100, 200);
//
//  
//  pushMatrix();
//  translate(40, 40);
//  fill(255);
//  rectMode(CENTER);
//  rect(0,0, 10, 10);
//  popMatrix();
//  
//  pushMatrix();
//  translate(40, 20);
//  fill(255);
//  rectMode(CENTER);
//  rect(0,0, 10, 10);
//  popMatrix();
//  
//  pushMatrix();
//  translate(20, 40);
//  fill(255);
//  rectMode(CENTER);
//  rect(0,0, 10, 10);
//  popMatrix();
  
  // ---------------------- END OF YOUR CODE
  
  //popMatrix(); // go back to regular coordinate system
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "rswang_baseFile" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
