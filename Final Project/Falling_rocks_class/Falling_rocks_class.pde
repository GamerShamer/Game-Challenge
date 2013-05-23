ArrayList rock = new ArrayList();
PImage cave;

void setup(){
  cave = loadImage("cave.jpg");
  size(cave.width,cave.height);
}

void draw(){
  background(cave);
  if(frameCount%20==0){
    rock.add(new Rocks());
  }
  for (int i=0; i<rock.size(); i++){
    Rocks r = (Rocks) rock.get(i);
    r.display();
    r.move();
    r.update();
    if(r.life==0){
      rock.remove(0);
    }
  }
  
}
 
