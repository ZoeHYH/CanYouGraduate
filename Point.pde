class Point extends Item {
  PImage img;

  Point(float x, float y) {
    super(x, y);

    img = loadImage("img/papper.png");
  }
  void display() {
    if (isAlive == true) {
      image(img, x, y, 50, 50);
    }
  }
  void checkCollision(Player2 player2) {

    if (isAlive == true && isHit(x, y, SOIL_SIZE, SOIL_SIZE, player2.x, player2.y, player2.w, player2.h)) {

      if (pickUpState == true) {
        image(pointsDown, answer.x, 0);
      }
    }
  }
}