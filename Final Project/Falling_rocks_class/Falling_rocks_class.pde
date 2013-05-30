ArrayList rock = new ArrayList();
Miner m;
PImage cave;
PImage start;
int life=10;
boolean button=false;
int x;

int count=6;
int random;
ArrayList gem = new ArrayList();
int[] colors=new int[count];

void setup() {
  start = loadImage("cave.jpg");
  cave = loadImage("cave_2.jpg");
  m= new Miner();
  size(1600, cave.height);

  colorMode(HSB, 360, 100, 100, 255);
  for (int i=0; i<colors.length; i++) {
    colors[i] = i*60;
  }
}

void mousePressed() {
  if (mouseX>width/2-50 && mouseX<width/2+50 && mouseY>height/2+50 && mouseY<height/2+150) {
    button=!button;
  }
}

void draw() {
  background(start);
  rectMode(CENTER);
  fill(0);
  rect(width/2, height/2+50, 400, 400);
  fill(255);
  textSize(30);
  text("Game Name", width/2-80, height/2);
  fill(8,100,98);
  rect(width/2, height/2+100, 300, 75);
  fill(0);
  text("Start Game", width/2-80, height/2+100);
  //this is all setup for the start screen
  //the start screen has a black square with the name of the game and a start button
  //when the start buton is pressed, the start screen will disappear and the rocks will begin to fall 
  if (button) {  
    x= constrain(x, 0, cave.width-width);
    image(cave, -x, 0);
    x= frameCount;
    if (frameCount%20==0) {
      rock.add(new Rocks());
    }
    m.display();
    m.move();
    for (int i=0; i<rock.size(); i++) {
      Rocks r = (Rocks) rock.get(i);
      m.intersect(r);
      r.display();
      r.move();
      r.update();
      if (r.life==0) {
        rock.remove(0);
        //once the transperancy is equal to zero the rocks are removed
      }
    }
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
    //life counter
    fill(255);
    textSize(32);
    text("Lives:"+life,200,200);
    
  }
}

