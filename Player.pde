class Player {

  float x, y;
  float w = player_w;
  float h = player_h;
  int moveDirection = 0;
  float downSpeed = 0;
  float downAcc=0.2;
  float movingSpeed=3;
  int direction =1;
  int timer=0;

  void update() {
    if (rightState || leftState) {
      timer++;
    }

    downSpeed+=downAcc;
    if (downSpeed>10) {
      downSpeed=10;
    }
    y+=downSpeed;
    if (downSpeed>0.2) {
      canJump=false;
    }
    if (leftState) {
      x -= movingSpeed;
      direction=0;
    }
    if (rightState) {
      x += movingSpeed;
      direction=1;
    }
    if (x<=0) {
      x=0;
    }
    if (x>=width-w) {
      x=width-w;
    }
    if (direction==1 && canJump ==true) {
      if (timer%10<5) {
        image(r_move1, x, y, w, h);
      } else {
        image(r_move2, x, y, w, h);
      }
    }

    if (direction==0 && canJump ==true) {
      if (timer%10<5) {
        image(l_move1, x, y, w, h);
      } else {
        image(l_move2, x, y, w, h);
      }
    }
    if (direction==1 && canJump == false) {
      image(r_jump, x, y, w, h);
    }
    if (direction==0 && canJump == false) {
      image(l_jump, x, y, w, h);
    }
  }

  void hurt() {
    GAMESTATE=GAMELOSE;
  }

  Player() {
    x=player_init_X;
    y=player_init_Y;
  }
}