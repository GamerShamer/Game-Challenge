PImage Miner;
PImage MinerClimbing;
boolean regular;
boolean climbing;
int x;
int y;

void setup(){
size(600,600);
Miner=loadImage("miner1b.png");
MinerClimbing=loadImage("MinerClimbing.png");
}

void draw(){
background(0);
//image(Miner,50,0,100,200);
//image(MinerClimbing,200,0,150,220);

if(regular==true){
  image(Miner,x,y,100,200);
  climbing=false;
}

if(climbing==true){
  image(MinerClimbing,x,y,150,220);
  regular=false;
}
if(mousePressed){
  regular=false;
  climbing=true;
}
  else{
    regular=true;
    climbing=false;
  }
//The regular miner image appears unless the miner is climbing.

}

