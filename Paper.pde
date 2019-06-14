class Paper {
  float x,y;
  float w=50;
  float h=50;
  void checkCollision(Player player) {
    if (isHit(x, y, w, h, player.x, player.y, player.w, player.h)&& canJump==false) {
        image(success,0,0);
        done3=true;
        GAMESTATE=GAMEWIN;
    }
  }
  void display(){
    image(paperToGet,x,y,w,h);
  }
  
  Paper(float x,float y){
    this.x = x;
    this.y = y;
  }
}