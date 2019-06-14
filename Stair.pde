class Stair {
  PImage img;
  float x;
  float y;

  Stair(float x, float y) {

    img = loadImage("img/stair.png");
    this.x = x;
    this.y = y;
  }
  void  update() {
    image(img, x, y, 50, 160);
  }

  void checkCollision(Player2 player2) {


    if ( isUpStairs(x+30, y, 50-60, 160, player2.x, player2.y, player2.w-10, player2.h)
      ) {


      isCountUp ++;
    }

    if ( isDownStairs(x+30, y, 50-60, 160, player2.x, player2.y, player2.w, player2.h)
      ) {

      isCountDown ++;
    }
  }
}