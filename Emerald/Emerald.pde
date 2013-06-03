int t1=200;
int t2=250;
int ty=200;
int b1=175;
int b2=275;
int by=225;
int c=225;
int cy=275;



void setup(){
  size(600,600);

}

void draw(){
  background(255);
 
  line(t1,ty,t2,ty);
  line(b1,by,b2,by);
  line(t1+10,ty,b1+10,by);
  line(t2-10,ty,b2-10,by);
  line(t1+40,ty,b1+40,by);
  line(t2-40,ty,b2-40,by);
  line(t1,ty,b1,by);
  line(t2,ty,b2,by);
  line(b1,by,c,cy);
  line(b2,by,c,cy);
  line(b1+10,by,c,cy);
  line(b2-10,by,c,cy);
  line(b1+40,by,c,cy);
  line(b2-40,by,c,cy);
   
}

