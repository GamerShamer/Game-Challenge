PImage Miner;
PImage MinerClimbing;
PImage MinerJumping;
boolean regular;
boolean climbing;
boolean jumping;
int x;
int y;
//x and y represent the location of the image

void setup() {
  size(600, 600);
  Miner=loadImage("miner1b.png");
  MinerClimbing=loadImage("MinerClimbing.png");
  MinerJumping=loadImage("miner1c.png");
}

void draw() {
  background(0);
  //image(Miner,50,0,100,200);
  //image(MinerClimbing,200,0,150,220);

  if (regular==true) {
    image(Miner, x, y, 100, 200);
    climbing=false;
    jumping=false;
  }
  //Regular controls the normal miner image

  if (climbing==true) {
    image(MinerClimbing, x, y, 150, 220);
    regular=false;
    jumping=false;
  }
  //Climbing controls the climbing miner image

  if (jumping==true) {
    image(MinerJumping, x, y, 130, 220);
    regular=false;
    climbing=false;
  }
  //Jumping controls the jumping miner image
}

void keyPressed() {
  if (key=='1') {
    regular=true;
    climbing=false;
    jumping=false;
  }
  if (key=='2') {
    regular=false;
    climbing=true;
    jumping=false;
  }
  if (key=='3') {
    regular=false;
    climbing=false;
    jumping=true;
  }
}
//One image appears at a time, depending on the key pressed. My group mates may change the element which determines the image to fit the game code.

