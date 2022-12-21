class Rock {
   int life = 2;

  float x,y; //location of the rock
  float speed;
  float r; //raduis of the rock
      color baseColor = color(255,250,120);
    color nextColor = baseColor;
      boolean alive() {
        for (int i = 0; i < bullets.size(); i++) {
            B bullet = (B) bullets.get(i);
            
            if (bullet.x >= x-25 && bullet.x <= x + 25 && bullet.y >= y- 25 && bullet.y <= y +25) {
                bullets.remove(i);
                
                life--;
                nextColor = color(0, 0, 255);
                println(life);
                if (life == 0) {
                    score += 50;
                    return false;
                }
                
                break;
            }
        }

        return true;
    }
  Rock() {
    r = 8;
    x = random(width);
    y = -r*4;
    speed = random(1,5);
    
  }
  
  
  void move(){
  if(y>800){
  y=0;
  }
  else{
    y += speed;
  }
  
  }
  boolean reachedBottom(){
    return y > height + r*4;
  }
    
    
  void display(){
    fill(nextColor);
    noStroke();
    ellipse(x,y,50,50);
  }
  
    void remove(){
   y=-50;
   x=-50;
  }
  
  void hitSpaceShip(){
    speed = 0; //stop it from moving 
    
  }
}
