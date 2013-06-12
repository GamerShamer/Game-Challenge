int count=6;
int random;
ArrayList gem = new ArrayList();
int[] colors=new int[count];

void setup() {
  size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100, 255);
  for (int i=0; i<colors.length; i++) {
    colors[i] = i*60;
  }
}

void draw() {
  background(0);
  random=int(random(0, colors.length));
  if (frameCount%200==0) {
    gem.add(new Gem(colors[random]));
  }
  for (int i=0; i<gem.size(); i++) {
    Gem g = (Gem) gem.get(i);
    g.create();
    if (g.life==0) {
      gem.remove(0);
    }
  }
}

