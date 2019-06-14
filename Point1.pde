class Point1 extends Item {
  PImage img;
  PImage img1;
  Point1(float x, float y) {
    super(x, y);

    img = loadImage("img/papper.png");
    img1 = loadImage("img/point.png");
  }
  void display() {
    if (isAlive == true) {
      image(img, x, y, 50, 50);
    }
  }
  void checkCollision(Player2 player2) {

    if (isAlive == true && isHit(x, y, SOIL_SIZE, SOIL_SIZE, player2.x, player2.y, player2.w, player2.h)) {

      if (pickUpState == true) {
        image(pointsRight, 0, answer.y);
      }
    }
  }
}