class Tile extends Trap {
  float downSpeed = 0;
  float downAcc = 0.2;

  void update() {
    if (y>=-1600 && y<1000) {

      downSpeed+=downAcc;
      y+=downSpeed;
      if (downSpeed>=10) {
        downSpeed=10;
      }
    }
  }



  void display() {
    if (y>=-1600 && y<900) {
      image(fallingTile, x, y, w, h);
    }
  }

  Tile(float x, float y ) {
    super(x, y);
    w=80;
    h=80;
  }
}