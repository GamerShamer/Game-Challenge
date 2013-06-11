class Miner {
  float x;
  float y;
  PImage miner;
  boolean loss=false;
  boolean gain=false;

  Miner() {
    x=100;
    miner = loadImage("miner1b.png");
    y=585;
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
        //when 'a' is pressed, the miner moves to the left
      }
      if (key=='d') {
        x+=5;
        //when 'd' is pressed, the miner moves to the right
      }
    }
  }

  boolean level() {
    if (x+miner.width>=width) {
      x=0;
      level++;
      finish=true;
      return true;
      //if the miner reaches a certain position (the end of level sign) the level increases
    }
    else {
      finish=false;
      return false;
    }
  }

  boolean loss(Rocks r) {
    if ((r.ypos>=y)&&(r.ypos<y+miner.height-(r.d*2))&&(r.xpos<x+miner.width)&&(r.xpos>x)) {
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
      //when the rocks and the miner intersect, a life is lost and the rock is removed from the screen
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
  
  boolean gain2(Emerald g) {
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
  
  void emeraldcatch(Emerald g) {
    if (gain2(g)) {
      g.y=3000;
      life++;
    }
    //if the miner and an emerald intesect, you gain a life and the emerald is removed
  }
  
  

  }
