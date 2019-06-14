class Elevator {
  float x;
  float y;
  float speed=5;
  void update() {
    if(upState && y>108){
      y-=speed;
      
    }
    if(downState && y<766){
      y+=speed;
    }
    image(elevator, x, y);
  }

  Elevator(float x, float y) {
    this.x = x;
    this.y = y;
  }
}