PImage img;

void setup() {
  size(600,600);
  img = loadImage("miner1b.png");
  
}

void draw() {
  background(0);
  image(img, 50, 0);
}
