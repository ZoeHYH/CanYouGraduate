class Enemy {
  float x, y;
  float w = 50;
  float h = 80;

  void checkCollision(Player2 player2) {

    if (isHit(x, y+10, w, h-20, player2.x, player2.y, player2.w, player2.h)) {

      player2.hurt();
    }
  }

  void display() {
  }
  void update() {
  }

  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
  }
}