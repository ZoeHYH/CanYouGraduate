class Answer extends Item {
  PImage img;
  PImage img1;
  boolean answerDoor = false;
  Answer(float x, float y) {
    super(x, y);
    img = loadImage("img/door.png");
    img1 = loadImage("img/answerdoor.png");
  }
  void display() {
    if (answerDoor == false) {
      if (isAlive == true) {
        image(img, x, y, 50, 100);
      }
    } else if (answerDoor == true) {
      image(img1, x, y, 50, 100);
    }
  }
  void checkCollision(Player2 player2) {

    if (isAlive == true && isHit(x, y, 50, 160, player2.x, player2.y, player2.w, player2.h)) {
      if ( y < player2.y&& openState == true) { 

        answerDoor = true;
      }
    }
  }
}  