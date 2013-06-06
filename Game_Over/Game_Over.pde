PImage GameEndMiner;
int a=100;
int b=100;
int c=400;
int d=350;
PFont font;

void setup(){
  size(600,600);
  GameEndMiner=loadImage("miner1c.png");
}

void draw(){
  background(0);
  
  fill(252,194,4);
  rect(a-20,b-20,c+40,d+40);
  
  
  fill(0,128,255);
  rect(a-10,b-10,c+20,d+20);
  
  
  fill(150);
  rect(a,b,c,d);
  
  fill(255,0,0);
  //textSize(64);
  font=loadFont("BernardMT-Condensed-48.vlw");
  textFont(font);
  text("Game",310,250);
  text("Over",320,300);
  
  
  image(GameEndMiner,110,120,150,300);
}
