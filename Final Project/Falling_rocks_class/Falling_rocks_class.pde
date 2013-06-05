Miner m;
PImage cave;
PImage start;
<<<<<<< HEAD
PImage GameStart;
=======
PImage box;
>>>>>>> game with faulty background
int life=10;
int level;
int count=6;
int random;
int time;
int past;
float x;
boolean finish=false;
boolean button=false;
int[] colors=new int[count];
ArrayList rock = new ArrayList();
ArrayList gem = new ArrayList();

void setup() {
  start = loadImage("cave.jpg");
<<<<<<< HEAD
  cave = loadImage("cave_2.jpg");
  GameStart = loadImage("GameStart.png");
=======
  cave = loadImage("cave with sign.jpg");
  box= loadImage("GameStart.png");
>>>>>>> game with faulty background
  m= new Miner();
  size(1600, cave.height);
  level=1;
  colorMode(HSB, 360, 100, 100, 255);
  for (int i=0; i<colors.length; i++) {
    colors[i] = i*60;
  }
}

void mousePressed() {
<<<<<<< HEAD
  if (mouseX>((width/2)-40) && mouseX<((width/2)+160) && mouseY>((height/2)-38) && mouseY<height/2+38) {
    button=!button;
=======
  if (mouseX>=((width/2)-40)&& (mouseX<=((width/2)+160))&&(mouseY>=((height/2)-(75/2)))&& (mouseY<=((height/2)+(75/2)))) {
    button=true;
>>>>>>> game with faulty background
  }
}

void draw() {
  background(start);
  rectMode(CENTER);
<<<<<<< HEAD
  image(GameStart,width/2-300,height/2-200,600,400);
  fill(0);
  //rect(width/2, height/2+50, 400, 400);
  fill(255);
  textSize(30);
  //text("Game Name", width/2-80, height/2);
  fill(8,100,98);
=======
  //  fill(0);
  //  rect(width/2, height/2+50, 400, 400);
  image(box, width/2-300, height/2-200, 600, 400);
  //  fill(255);
  textSize(30);
  //  text("Game Name", width/2-80, height/2);
  fill(8, 100, 98);
>>>>>>> game with faulty background
  rect(width/2+60, height/2, 200, 75);
  fill(0);
  text("Start Game", width/2 - 20, height/2);
  //this is all setup for the start screen
  //the start screen has a black square with the name of the game and a start button
  //when the start buton is pressed, the start screen will disappear and the rocks will begin to fall 
  time=millis();
  if (button) {
    if (!finish) {  
      x= constrain(x, 0, cave.width-width);
      image(cave, -x, 0);
      //x=time in this level * .1
      x=(time-past)/10;
    }
    if (finish) {
      x=0;
      past=time;
    }
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
      m.gemcatch(g);
      if (g.life==0) {
        gem.remove(0);
      }
    }
    //life counter
    fill(255);
    textSize(32);
    text("Lives:"+life, 200, 200);
    textSize(50);
    text("Level " + level, 800, 200);
  }
  if (life<=0) {
    background(0);
  }
  m.level();
}
