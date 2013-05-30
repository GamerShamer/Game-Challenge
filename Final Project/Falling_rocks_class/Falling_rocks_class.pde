ArrayList rock = new ArrayList();
Miner m;
PImage cave;
PImage start;

boolean button=false;
int x;

void setup() {
  start = loadImage("cave.jpg");
  cave = loadImage("cave_2.jpg");
  m= new Miner();
  size(1600,788);
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
  rect(width/2,height/2+50,400,400);
  fill(255);
  textSize(30);
  text("Game Name", width/2-80, height/2);
  fill(255, 0, 0);
  rect(width/2, height/2+100, 300, 75);
  fill(0);
  text("Start Game", width/2-80, height/2+100);
  //this is all setup for the start screen
  //the start screen has a black square with the name of the game and a start button
  //when the start buton is pressed, the start screen will disappear and the rocks will begin to fall 
  if (button) {  
    x= constrain(x,0,cave.width-width);
    image(cave,-x,0);
    x= frameCount;
    if (frameCount%20==0) {
      rock.add(new Rocks());
    }
    m.display();
    m.move();
    for (int i=0; i<rock.size(); i++) {
      Rocks r = (Rocks) rock.get(i);
      r.display();
      r.move();
      r.update();
      if (r.life==0) {
        rock.remove(0);
        //once the transperancy is equal to zero the rocks are removed
      }
    }
  }

}
