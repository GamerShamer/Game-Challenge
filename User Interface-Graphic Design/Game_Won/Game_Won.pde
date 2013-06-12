PImage GameWonMiner;
int a=100;
int b=100;
int c=400;
int d=350;
PFont font;

void setup(){
  size(1600,788);
  GameWonMiner=loadImage("miner1b.png");
}

void draw(){
  background(0);
  rectMode(CENTER);
  
  //yellow box
  fill(252,194,4);
  rect(width/2,height/2,440,390);
  
  //blue box
  fill(0,128,255);
  rect(width/2,height/2,420,370);
  
  //gray box
  fill(150);
  rect(width/2,height/2,400,350);
  
  fill(255,0,0);
  //textSize(64);
  font=loadFont("BernardMT-Condensed-48.vlw");
  textFont(font);
  text("You won!",790,340);
  text("Great job!",785,400);
  
  
  image(GameWonMiner,width/2-180,height/2-150,150,300);
}
