      int score = 0;
PImage img;
ArrayList bullets=new ArrayList();
ArrayList rocks=new ArrayList();
boolean gameOver=false;
PFont font;
Player player;
void setup(){
  size(1000,700);
  println("init here");
   for(int i = 0;i < 50; i++){
    rocks.add(new Rock());

  }
  player=new Player();
  img = loadImage("core/space_ship.png");
      font = createFont("Arial", 36, true);

}



void drawScore() {
    textFont(font);
    fill(255);
    text("Score: " + String.valueOf(score), 450, 50);
}
void draw(){
  if(!gameOver){
  
  
  

  background(255,0,0);
  
  
  
  
  image(img, min(max(mouseX-50,0),900), 600, 100,100);
  
  
  
  
  
  
  
  for (int i = 0; i < rocks.size(); i++) {
            Rock r = (Rock) rocks.get(i);

        if (!r.alive()) {
            rocks.remove(r);
        } else {
            r.move();
    r.display();
        }
        
        if(r.x-25<=min(max(mouseX-50,0),900)+100 && r.x+25>=min(max(mouseX-50,0),900) && r.y+25>=600){
          
       gameOver=true;
        }
        
        
          }
   
    
  

player.draw();
    drawScore();

    for (int i = 0; i < bullets.size(); i++) {
        B bullet = (B) bullets.get(i);
        bullet.draw();
    }
    
     }
      else{
    
    over();
    
    
    }
    
  }

void drawRocks(){
   for(int i = 0;i < 50; i++){
                 Rock r = (Rock) rocks.get(i);

    r.move();
    r.display();
  }
}

class Player  {
    boolean canShoot = true;
    int shootdelay = 0;

    Player() {
        
 
    }

    void draw() {

        if (mouseButton == LEFT && canShoot &&mousePressed  ) {
            
           
            bullets.add(new B(min(max(mouseX-50,0),900)+50, 600));
            canShoot = false;
            shootdelay = 0;
        }

        shootdelay++;
        
        if (shootdelay >= 20) {
            canShoot = true;
        }
    }
         
}

class B{
  int x,y;
  B(int xPos,int yPos){
     x=xPos;
     y=yPos;
  }
  void draw(){
    fill(0);
    rect(x,y,4,8);
    y-=4;
  }
}




 
  void over(){
   background(0);
       textFont(font);
    fill(255);
    text("Game Over ", 450, 50);
    text("Score : "+ String.valueOf(score), 450, 450);
  }
  
