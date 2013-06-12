PImage bkground;

void setup(){
  bkground=loadImage("cave_2a.jpg");
  size(1000,788);
}

void draw(){
  image(bkground,0,0,990,780);
}
