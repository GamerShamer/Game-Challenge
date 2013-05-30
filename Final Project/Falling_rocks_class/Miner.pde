class Miner{
  float x;
  float y;
  PImage miner;
  
  Miner(){
    x=100;
    miner = loadImage("miner1b.png");
    y=cave.height+675;
  }
  
  void display(){
    pushMatrix();
    scale(.4);
    image(miner,x,y);
    popMatrix();
//    fill(255);
//    rect(x,y,50,50);
  }
  
  void move(){
    if (keyPressed){
      if(key=='a'){
        x-=5;
      }
      if(key=='d'){
        x+=5;
      }
    }
  }
  
  void intersect(Rocks r){
    if(dist(x,y,r.xpos,r.ypos)<r.d/2){
      life--;
      println("hiu");
    }
  }
  
}
