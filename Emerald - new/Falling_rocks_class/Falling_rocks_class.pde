Miner m;
PImage cave;
PImage start;
PFont font;
PFont font2;
PFont GameRestart;
PFont ribbonfont;
PImage GameWonMiner;
PImage GameLostMiner;
PImage box;
//these are all the images we used thoughout the game (except for the miner and emerald)
int life=5;
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
ArrayList emerald = new ArrayList();

void setup() {
  start = loadImage("cave.jpg");
  cave = loadImage("cave with sign.jpg");
  box = loadImage("GameStart.png");
  GameWonMiner=loadImage("miner1b.png");
  GameLostMiner=loadImage("miner1c.png");
  m= new Miner();
  size(1600, cave.height);
  level=1;
  colorMode(HSB, 360, 100, 100, 255);
  for (int i=0; i<colors.length; i++) {
    colors[i] = i*60;
  }
}

void mousePressed() {
  if (mouseX>((width/2)-40) && mouseX<((width/2)+160) && mouseY>((height/2)-38) && mouseY<height/2+38) {
    button=!button;
    //the area in which this mousePressed is defined will become the start button
  }
 }

void draw() {
  if (!button) { 
    background(start);
    rectMode(CENTER);
    image(box, width/2-300, height/2-200, 600, 400);
    //start screen
    pushStyle();
    fill(276);
    noStroke();
    rect(width/2+55, height/2-148, 446, 70);
    fill(255, 0, 0);
    textSize(52);
    text("Miner Challenge", width/2-140, height/2-90);
    popStyle();
    textSize(30);
    fill(8, 100, 98);
    rect(width/2+60, height/2, 200, 75);
    //start button
    fill(0);
    text("Start Game", width/2 - 20, height/2);
    pushStyle();
    font = loadFont("BodoniMTCondensed-Bold-18.vlw");
    textFont(font);
    //textSize(15);
    text("Instructions: Get to the other side of the cave by...", width/2-90, height/2+80);
    text("Pressing 'a' to move to the left and 'd' to move to the right.", width/2-125, height/2+110);
    text("Avoid rocks and collect gems!", width/2-20, height/2+140);
    //instructions for game
    popStyle();
  }
  //this is all setup for the start screen
  //the start screen has a gray square with the name of the game and a start button
  //when the start button is pressed, the start screen will disappear and the rocks will begin to fall 
  if (m.level()) {
    x=0;
  }
  if (button) {
    if (!finish) {  
      x= constrain(x, 0, cave.width-width);
      image(cave, -x, 0);
      //x=time in this level * .1
      x+=3;
    }
    if (frameCount%20==0) {
      rock.add(new Rocks());
      //a new rock falls avery 20 frames
    }
    m.display();
    m.move();
    //the miner is displayed and can move
    for (int i=0; i<rock.size(); i++) {
      Rocks r = (Rocks) rock.get(i);
      m.intersect(r);
      //if the rock and miner intersect, a life is lost and the rock is removed
      r.display();
      r.move();
      r.update();
      if (r.life==0) {
        rock.remove(0);
        //once the transperancy is equal to zero the rocks are removed
      }
    }
    random=int(random(0, colors.length));
    if (frameCount%150==0) {
      //gem.add(new Gem(colors[random]));
      emerald.add(new Emerald(colors[random]));
      //a new emerald is added every 150 frames
    }
    for (int i=0; i<emerald.size(); i++) {
      //      Gem g = (Gem) gem.get(i);
      //      g.create();
      //      m.gemcatch(g);
      //      if (g.life==0) {
      //        gem.remove(0);
      //      }

      Emerald e = (Emerald) emerald.get(i);
      e.create();
      m.emeraldcatch(e);
      //if the miner and an emerald intersect the miner gains a life
      if (e.life==0) {
        emerald.remove(0);
      }
    }
    //life counter
    fill(255);
    textSize(32);
    pushStyle();
    rectMode(CENTER);  
    fill(150);  
    rect(width/2, 30, width, 60);    
    textSize(28);  
    fill(0);  
    text("Levels:"+level, 100, 40);  
    //this displays what level you are on, the level counter increases with each level
    text("Lives:"+life, 300, 40);        
    //this dispays how many lives you have
    ribbonfont = loadFont("BernardMT-Condensed-48.vlw");  
    textFont (ribbonfont);  
    fill(255, 0, 0);  
    textSize(40);  
    text("MINER CHALLENGE", 650, 48);
    popStyle();
    //this appears at the top of the screen and makes te area where the lives and levels appear more attractive
  }

  if (life<=0) {
    pushStyle();
    //background(0);
    colorMode(RGB);
    rectMode(CENTER);
    image(cave, 0, 0);
    //yellow box
    fill(249, 239, 10);
    rect(width/2, height/2, 650, 430);
    //blue box
    fill(0, 128, 255);
    rect(width/2, height/2, 630, 410);
    //gray box
    fill(150);
    rect(width/2, height/2, 610, 390);
    fill(255, 0, 0);
    textSize(64);
    font2=loadFont("CooperBlack-64.vlw");
    textFont(font2);
    text("Game", 750, 340);
    text("Over", 755, 440);
    image(GameLostMiner, width/2-270, height/2-150, 150, 300);
    pushStyle();
    GameRestart=loadFont("CooperBlack-32.vlw");
    textFont(GameRestart);
    fill(0);
    text("Click to restart", 720, 520);
    popStyle();
    popStyle();
    fill(255);
    if(mousePressed){
        button=!button;
        life=5;
        x=0;
        setup();
       //if you press anywhere on the screen the game restarts
    }
    //this is the game over screen, it appears if you lose all your lives
  }
  if (level==3) {
    pushStyle();
    //background(0);
    colorMode(RGB);
    rectMode(CENTER);
    image(cave, 0, 0);
    //yellow box
    fill(249, 239, 10);
    rect(width/2, height/2, 650, 430);
    //blue box
    fill(0, 128, 255);
    rect(width/2, height/2, 630, 410);
    //gray box
    fill(150);
    rect(width/2, height/2, 610, 390);
    fill(255, 0, 0);
    textSize(64);
    font2=loadFont("CooperBlack-64.vlw");
    textFont(font2);
    text("You won!", 740, 340);
    text("Great job!", 735, 430);
    image(GameWonMiner, width/2-270, height/2-150, 150, 300);
    pushStyle();
    GameRestart=loadFont("CooperBlack-32.vlw");
    textFont(GameRestart);
    fill(0);
    text("Click to restart", 770, 500);
    popStyle();
    popStyle();
    if(mousePressed){
        button=!button;
        life=5;
        x=0;
        setup();
       //if you press anywhere on the screen the game restarts
    }
    //this is the screen that appears if you beat the game, this happens when you complete the 5th level and move on to the 6th
  }
  //  m.level();
}

