class Ground {
  float x, y, n;
  float w=50;
  float h=50;
  void display() {
    image(Admin_Left,x,y,50,50);
    for(int i=0;i<n;i++){
      image(Admin_Mid,x+50*(i+1),y,w,h);
    }
    image(Admin_Right,x+50*(n+1),y,w,h);
  }

  void carry(Player player) {
    if (onGround(player.x, player.y, player.w, player.h, x, y, n)) {
      player.downSpeed=0;
      player.y=y-player.h;
      canJump=true;
    }
  }

  Ground(float x, float y, int n) {
    this.x=x;
    this.y=y;
    this.n=n;
  }
}