class Miner{
  float xpos;
  float ypos;
  PImage miner;
  
  Miner(){
    xpos=100;
    ypos=height;
  }
  
  void display(){
    miner = loadImage("miner1b.png");
    
    image(miner,xpos,ypos);
    
  }
  
  void move(){
    xpos++;
  }
  
}
