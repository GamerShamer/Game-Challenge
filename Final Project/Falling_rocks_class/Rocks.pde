class Rocks{
  float d;
  float xpos;
  float ypos;
  float yspeed;
  float life;
  //float maxlife;
  color c;
  
  Rocks(){
    d=random(10,30);
    xpos=random(0,width);
    ypos=-d/2;
    yspeed=random(5,10);
    life=255;
    //maxlife=life;
    c=color(200,life);
  }
  
  void display(){
    fill(c);
    ellipse(xpos,ypos,d,d);
  }
  
  void move(){
    ypos+=yspeed;
  }
  
  void update(){
    if(ypos>=height-d/2){
      yspeed=0;
      life-=5;
      c=color(200,life);
    }
  }
  
}
