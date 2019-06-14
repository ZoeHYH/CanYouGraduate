class Trap {
  float x, y, w, h;
  void checkCollision(Player player) {
    if (isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {
        player.hurt();
      }
  }
  void display(){}
  void update(){}
  
  Trap(float x,float y){
    this.x = x;
    this.y = y;
  }
}