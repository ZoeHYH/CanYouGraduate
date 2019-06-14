class Player_Main {

  float x, y;
  float w = player_w;
  float h = player_h;
  float movingSpeed=3;
  int direction =1;
  int timer=0;
  boolean move=true;

  void update() {
    timer++;
    if (move) {
      x += movingSpeed;
      direction=1;
    }
    if (x<=0) {
      x=0;
    }
    if (x>=width-w) {
      x=width-w;
    }
    if (direction==1) {
      if (timer%10<5) {
        image(r_move1, x, y, w, h);
      } else {
        image(r_move2, x, y, w, h);
      }
    }

    if (direction==0) {
      if (timer%10<5) {
        image(l_move1, x, y, w, h);
      } else {
        image(l_move2, x, y, w, h);
      }
    }
  }


  Player_Main() {
    x=0;
    y=775;
  }
}