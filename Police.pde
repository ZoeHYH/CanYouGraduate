class Police extends Enemy {
  float speed = 1 ;
  int moveTimer = 0;
  void display() {
    if (moveTimer%10 < 5) {
      image(police1, x, y, 50, 80);
    } else {
      image(police2, x, y);
    }
    moveTimer++;
    moveTimer = moveTimer%500;
  }
  void update() {
    x += speed ;
    if (x >= width) x = -w;
  }
  Police(float x, float y) {
    super(x, y);
  }
}