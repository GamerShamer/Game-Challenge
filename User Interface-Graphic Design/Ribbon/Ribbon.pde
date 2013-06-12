PFont font;

void setup() {
  size(1600,788);
}

void draw() {
  rectMode(CENTER);
  fill(150);
  rect(width/2,30,width,60);
  
  textSize(28);
  fill(0);
  text("Levels:",100,40);
  text("Lives:",300,40);
  
  
  
  font = loadFont("BernardMT-Condensed-48.vlw");
  textFont (font);
  fill(255,0,0);
  textSize(40);
  text("MINER CHALLENGE",650,48);
}

