class Miner {
  float x;
  float y;
  PImage miner;
  boolean loss=false;
  boolean gain=false;

  Miner() {
    x=100;
    miner = loadImage("miner1b.png");
    y=600;
  }

  void display() {
    pushMatrix();
    //scale(.4);
    image(miner, x, y);
    popMatrix();
    //    fill(255);
    //    rect(x,y,50,50);
  }

  void move() {
    if (keyPressed) {
      if (key=='a') {
        x-=5;
      }
      if (key=='d') {
        x+=5;
      }
    }
  }

  boolean level() {
    if (x+miner.width>=width) {
      x=0;
      level++;
      finish=true;
      return true;
    }
    else {
      finish=false;
      return false;
    }
  }

  boolean loss(Rocks r) {
    if ((r.ypos>=y)&&(r.ypos<y+6)&&(r.xpos<x+miner.width)&&(r.xpos>x)) {
      return true;
    }
    else {
      return false;
    }
  }
  void intersect(Rocks r) {
    if (loss(r)) {
      r.ypos=2000;
      life--;
    }
  }

  boolean gain(Gem g) {
    if ((g.x>x)&&(g.x<x+miner.width)&&(g.y>y)&&(g.y<y+miner.height)) {
      return true;
    }
    else {
      return false;
    }
  }
  void gemcatch(Gem g) {
    if (gain(g)) {
      g.y=3000;
      life++;
    }
  }
  
  

  }
