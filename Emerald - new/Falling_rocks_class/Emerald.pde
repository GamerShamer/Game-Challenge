class Emerald {
  float x;
  float y;
  float diam;
  float radius;
  float speed;
  float gravity;
  float life;
  int paint;
  
  PImage pic;
  

  Emerald(int tpaint) {
    diam=50;
    radius=diam/2;
    x=random(radius, width-radius);
    y=-radius;
    speed=random(-5, -1);
    gravity=.1;
    life=255;
    paint=tpaint;
    
    pic = loadImage("emerald.png");
  }

  void create() {
    tint(color(100, 100, 100, life));
    imageMode(CENTER);
    image(pic, x, y, diam, diam);
    imageMode(CORNER);
    noTint();
    y+=speed;
    speed+=gravity;
    if ((y+radius>=height)&&(speed>=0)) {
      speed*=-.4;
    }
    life-=.75;
  }
}
