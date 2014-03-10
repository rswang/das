PImage mimg, fimg;
HScrollbar hs1;

int numYears = 10;
Year[] years = new Year[numYears];
Year year1 = new Year(2010, 58, 250);
int numPersons = year1.total;
//int numFemales = year1.females;
Person[] people = new Person[numPersons];
float unit = width/numPersons;

void setup() {
  mimg = loadImage("male.png");
  fimg = loadImage("female.png");
  
  size(500, 400);
  hs1 = new HScrollbar(0, height, width, 16, 16);
// for(int i = 0; i <people.length; i++){
//    if (i < numFemales) people[i] = new Person(false,20*floor(i/10),30*(1+i%10)); 
//    else people[i] = new Person(true,20*floor(i/10),30*(1+i%10)); 
// }
}

void draw() {
 background(255);
 
 int numFemales = floor(hs1.getPos()/unit);
 for(int i = 0; i < people.length; i++){
    if (i < numFemales) people[i] = new Person(false,20*floor(i/10),30*(1+i%10)); 
    else people[i] = new Person(true,20*floor(i/10),30*(1+i%10)); 
    people[i].display();
 }
  hs1.update();
  hs1.display();
}

class Year {
  int year;
  int females;
  int males;
  int total;
  Person[] persons = new Person[total];
  
  
  Year(int y, int f, int t) {
    year = y;
    females = f;
    total = t;
    males = t-f;
  }
}

class Person {
  float xpos;
  float ypos;
  boolean male;

  Person(boolean bmale, float xcoor, float ycoor) {
    male = bmale;
    xpos = xcoor;
    ypos = ycoor;
  }
  
  void display() {
    if (male) image(mimg, xpos, ypos, 10, 20);
    else image(fimg, xpos, ypos, 10, 20);
  }
}


// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Car { 
 color c;
 float xpos;
 float ypos;
 float xspeed;

 // The Constructor is defined with arguments.
 Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
   c = tempC;
   xpos = tempXpos;
   ypos = tempYpos;
   xspeed = tempXspeed;
 }

 void display() {
   stroke(0);
   fill(c);
   rectMode(CENTER);
   rect(xpos,ypos,10,5);
 }
//
// void move(float posX, float posY, float damping) {
//    float dif = ypos - posY;
//    if (abs(dif) > 1) {
//      ypos -= dif/damping;
//    }
//    dif = xpos - posX;
//    if (abs(dif) > 1) {
//      xpos -= dif/damping;
//    }
//  }

 void move() {
   xpos = xpos + xspeed;
   if (xpos > width) {
     xpos = 0;
   }
 }
}


class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}


