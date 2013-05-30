class Gem {
  float x;
  float y;
  float diam;
  float radius;
  float speed;
  float gravity;
  float life;
  int paint;

  Gem(int tpaint) {
    diam=25;
    radius=diam/2;
    x=random(radius, width-radius);
    y=-radius;
    speed=random(-5, -1);
    gravity=.1;
    life=255;
    paint=tpaint;
  }

  void create() {
    fill(color(paint, 100, 100, life));
    ellipse(x, y, diam, diam);
    y+=speed;
    speed+=gravity;
    if ((y+radius>=height)&&(speed>=0)) {
      speed*=-.4;
    }
    life-=.75;
  }
}
