class GoalGround extends Ground {
  float w=50;
  float h=50;
  void display() {
    image(goalGround,x,y,50,50);
    for(int i=0;i<n;i++){
      image(goalGround,x+50*(i+1),y,w,h);
    }
    image(goalGround,x+50*(n+1),y,w,h);
  }

  void carry(Player player) {
    if (onGround(player.x, player.y, player.w, player.h, x, y, n)) {
      player.downSpeed=0;
      player.y=y-player.h;
      canJump=true;
    }
  }

  GoalGround(float x, float y, int n) {
     super(x,y,n);
  }
}