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

  void level() {
    if (x+miner.width>=width) {
      x=0;
      level++;
      finish=true;
    }
    if (x-miner.width<=0) {
      finish=false;
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

  //    println("Is " + r.ypos + " greater than " + y);
  //    if (r.ypos > y) {
  //      println("is lower than miner head");
  //      if (r.xpos > x) {
  //        println("is to the right of left side of miner's head");
  //        if (r.xpos < (x + miner.width)) {
  //          println("collision :3");
  //        }
  //      }
  //      life--;
}

