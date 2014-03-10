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
  font = createFont("Open Sans",16,true); 
  textFont(font); 
  textSize(random(22, 35)); 
  fill(0,0,0); 
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
  fill(255, alphaVal); 
  text(quotes[counter], rx, ry, 400, 300); 
  alphaVal += a; 
  
  if (alphaVal < 0 || alphaVal > 255) { 
   a *= -1; 
 } 
} 

String[] quotes = {"During the past year, the number of women attending the Institute has not increased appreciably, but those in attendance continue to make a real contribution to student life.", "Personally, I should like very much to see a women's college here, dedicated to scholarly pursuits for superior women, but I realize that we are not ready to attempt such a project without careful study.", "MIT's founder, William Barton Rogers, envisioned MIT as a place which would 'draw all the lovers of knowledge of both sexes to the halls of the Institute.'" , "to life and all", "that crap"};
  

