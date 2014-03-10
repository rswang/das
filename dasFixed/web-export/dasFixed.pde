PImage mimg, fimg, mit;
HScrollbar hs1;

//int numYears = 10;
//Year[] years = new Year[numYears];
Year[] years = {
  new Year(1889,27,590),
  new Year(1890,19,607),
  new Year(1891,21,656),
  new Year(1892,39,725),
  new Year(1893,38,744),
  new Year(1894,53,763),
  new Year(1895,49,771),
  new Year(1896,63,791),
  new Year(1897,64,794),
  new Year(1898,45,799),
  new Year(1899,48,801),
  new Year(1900,40,851),
  new Year(1901,44,880),
  new Year(1902,59,992),
  new Year(1903,23,865),
  new Year(1904,23,829),
  new Year(1905,23,651),
  new Year(1907,12,736),
  new Year(1908,17,733),
  new Year(1909,8,794),
  new Year(1910,10,743),
  new Year(1911,7,929),
  new Year(1912,14,934),
  new Year(1913,12,908),
  new Year(1914,14,1047),
  new Year(1915,18,1126),
  new Year(1916,16,1153),
  new Year(1917,19,1046),
  new Year(1918,19,1237),
  new Year(1919,44,1719),
  new Year(1920,31,2718),
  new Year(1921,26,2927),
  new Year(1922,32,2945),
  new Year(1923,33,2773),
  new Year(1924,36,2535),
  new Year(1925,32,2485),
  new Year(1926,23,2344),
  new Year(1927,32,2157),
  new Year(1927,32,2157),
  new Year(1927,32,2157),
  new Year(1927,32,2157),
  new Year(1931,39,2670),
  new Year(1932,33,2610),
  new Year(1933,33,2290),
  new Year(1934,25,2106),
  new Year(1935,28,2007),
  new Year(1936,29,2018),
  new Year(1937,39,2174),
  new Year(1938,41,2305),
  new Year(1939,38,2401),
  new Year(1940,33,2478),
  new Year(1941,36,2379),
  new Year(1942,35,2376),
  new Year(1942, 59, 3055), 
  new Year(2000, 1768, 4300), 
  new Year(2001, 1755, 4258), 
  new Year(2002, 1765, 4220), 
  new Year(2003, 1727, 4178), 
  new Year(2004, 1739, 4112), 
  new Year(2005, 1765, 4136), 
  new Year(2006, 1765, 4066), 
  new Year(2007, 1817, 4127), 
  new Year(2008, 1857, 4172), 
  new Year(2009, 1885, 4153), 
  new Year(2010, 1916, 4232), 
  new Year(2011, 1948, 4299), 
  new Year(2012, 1963, 4384), 
  new Year(2013, 2038, 4503), 
  new Year(2013, 2041, 4528)
};
int numYears = years.length;
//Year year1 = new Year(2010, 58, 400);

int numPersons = 100;
int numFemales;
Person[] people = new Person[numPersons];
float unit, personWidth, personHeight, padding;
int canvasHeight, canvasWidth, numRows, numColumns;

void setup() {
  mimg = loadImage("http://rswang.scripts.mit.edu/das/images/male.png");
  fimg = loadImage("http://rswang.scripts.mit.edu/das/images/female.png");
  mit = loadImage("http://rswang.scripts.mit.edu/das/images/mit.jpg");
  size(650, 500);
  hs1 = new HScrollbar(20, height-50, width-40, 5, 20);
  // for(int i = 0; i <peopfle.length; i++){
  //    if (i < numFemales) people[i] = new Person(false,20*floor(i/10),30*(1+i%10)); 
  //    else people[i] = new Person(true,20*floor(i/10),30*(1+i%10)); 
  // }
}

void draw() {
  background(255);
  int imageWidth = 500;
  int imageHeight = round(0.8*imageWidth);
  image(mit, (width-imageWidth)/2, 20, imageWidth, imageHeight);
  unit = float(width)/float(numYears);
  
  canvasWidth = imageWidth*0.8;
  canvasHeight = canvasWidth/2.5;
  //  numRows = ceil(sqrt(numPersons/2.5));
  numRows = 8;
  //  numColumns = 2.5*numRows;
  numColumns = 25;
  personHeight = canvasHeight/numRows;
  personWidth = personHeight/2.4;
  int paddingX = float(width-canvasWidth)/2;
  int paddingY = 165;
  int yi = floor(hs1.getPos()/unit);

  Year year = years[yi];
  int yearNum = year.year;
  numPersons = 200;
  float prct = 
    numFemales = round(float(year.females)/year.total*200);
  people = new Person[numPersons];
  for (int i = 0; i < people.length; i++) {
    if (i < numFemales) people[i] = new Person(false, paddingX+(personWidth*2)*(i%numColumns), paddingY+(personHeight+5)*floor(i/numColumns)); 
    else people[i] = new Person(true, paddingX+(personWidth*2)*(i%numColumns), paddingY+ (personHeight+5)*floor(i/numColumns)); 
    people[i].display();
  }
  // textSize(32);
  //text("mouse hover" + hs1.getPos(), 10, 30); 
  //fill(0, 102, 153);
  //text(numFemales + "/" + people.length, 10, 60); 
  //fill(0, 102, 153);

  textSize(14);
  text("NOW", width-50, height-20); 
  fill(0, 102, 153);
  text("THEN", 10, height-20); 
  fill(0, 102, 153);
  textSize(14);
  text(yearNum, hs1.spos-5, hs1.ypos+20); 
  fill(0, 102, 153);
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
    females = f/10;
    total = t/10;
    males = (t-f)/10;
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
    if (male) image(mimg, xpos, ypos, personWidth, personHeight);
    else image(fimg, xpos, ypos, personWidth, personHeight);
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
    rect(xpos, ypos, 10, 5);
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
    } 
    else {
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
    } 
    else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } 
    else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, 4*sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}


