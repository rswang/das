//PImage bg;
PFont font; 
int counter; 
final int DISPLAY_TIME = 10000; // 2000 ms = 2 seconds 
int lastTime; // When the current image was first displayed 

float rx = 120; 
float ry = 160; 
float alphaVal = 0; 
int rate = 30; 
float a = 2.21*255.0*rate/DISPLAY_TIME; 

void setup() { 
//  bg = loadImage("pg3.jpg");
  size(1024, 724); 
  background(255,0); 
  font = createFont("Helvetica",16,true); 
  textFont(font); 
  textSize(random(22, 35)); 
  fill(66, 190, 255); 
  lastTime = millis(); 
  frameRate(rate); 

} 

void draw() 
{ 
  background(255,0); 
//  if (millis() - lastTime > DISPLAY_TIME) // Time to display next image 
//  { 
//    counter = int(random(quotes.length)); 
//    textSize(random(20, 30)); 
//    rx = random(10, 750); 
//    ry = random(10, 400); 
//    lastTime = millis(); 
//  } 
  if (alphaVal < 30 )
  {
  counter = int(random(quotes.length)); 
  textSize(random(20, 30)); 
  rx = random(10, 750); 
  ry = random(10, 400); 
  lastTime = millis(); 
}
  fill(0, alphaVal); 
  text(quotes[counter], rx, ry, 400, 300); 
  alphaVal += a; 
  
  if (alphaVal < 0 || alphaVal > 255) { 
   a *= -1; 
 } 
} 

String[] quotes = {"hello", "I like cheese", "what is the answer?", "to life and all", "that crap"};
  

