class Light {
  boolean isOpen;
  int direction;
  float x, y;
  float originX, originY;
  float angle;
  int timer =floor(random(180));
  float light_d=4;
  float offSet_X_Left=16;
  float offSet_X_Right=34;
  float offSet_Y=21;
  PVector[] vertices = new PVector[3];
  

  void foundPlayer(Player player) {
    float angle1=angle-PI/9;
    float angle2=angle+PI/9;
    
    if(direction==1){
      vertices[0] = new PVector(x+offSet_X_Left,y+offSet_Y);
      vertices[1] = new PVector(x+offSet_X_Left+200*cos(angle1),y+offSet_Y+200*sin(angle1));
      vertices[2] = new PVector(x+offSet_X_Left+200*cos(angle2),y+offSet_Y+200*sin(angle2));
    }
    else{
    
      vertices[0] = new PVector(x+offSet_X_Right,y+offSet_Y);
      vertices[1] = new PVector(x+offSet_X_Right+200*cos(angle1),y+offSet_Y+200*sin(angle1));
      vertices[2] = new PVector(x+offSet_X_Right+200*cos(angle2),y+offSet_Y+200*sin(angle2));
    }
    boolean hit = polyRect(vertices,player.x,player.y,player.w,player.h);
    if(hit&&isOpen){
      player.hurt();
    }
    
  }


  void display() {

    if (isOpen) {
      if (direction==1) {
        for (int i =0; i<100; i++) {
          fill(255, 220, 53, 255*i/100);
          arc(x+offSet_X_Left, y+offSet_Y, light_d*(100-i), light_d*(100-i), angle-PI/9, angle+PI/9);
        }
      }
      else{
        for (int i =0; i<100; i++) {
          fill(255, 220, 53, 255*i/100);
          arc(x+offSet_X_Right, y+offSet_Y, light_d*(100-i), light_d*(100-i), angle-PI/9, angle+PI/9);
        }
      }
      
    }
  }

  void update() {
    timer++;
    if (timer>=180 && timer<240) {
      isOpen = true;
    }
    if (timer>=240) {
      isOpen = false;
      timer=0;
    }
  }

  void lighting(float originX, float originY) {
    this.x = this.originX= originX;
    this.y = this.originY = originY;
    angle = (PI/7)+(PI*5/7)*direction;
  }


  Light(int direction) {
    isOpen =false;
    this.direction=direction;
  }
}