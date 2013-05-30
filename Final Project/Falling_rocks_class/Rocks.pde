class Rocks{
  float d;
  float xpos;
  float ypos;
  float yspeed;
  float life;
  color c;
  
  Rocks(){
    d=random(10,30);
    xpos=random(0,width);
    //the rocks are given a random position between 0 and the width
    ypos=-d/2;
    yspeed=random(3,6);
    life=255;
    c=color(200,life);
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(xpos,ypos,d,d);
  }
  
  void move(){
    ypos+=yspeed;
  }
  
  void update(){
    if(ypos>=cave.height-d/2){
      yspeed=0;
      life-=5;
      c=color(200,life);
      //when the rocks reach the bottom of the screen they will stop falling and start to fade out
    }
  }
  
}
