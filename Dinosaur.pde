class Dinosaur extends Enemy {
  // Requirement #4: Complete Dinosaur Class
  int moveTimer = 0;
  final float TRIGGERED_SPEED_MULTIPLIER = 2.5;
  PImage img ;
  PImage img1;
  float xSpeed = 1;
  Dinosaur(float x, float y) {
    super(x, y);
    img = loadImage("img/soldierright1.png");
    img1 = loadImage("img/soldierright2.png");
  }
  void display() {
    x+= xSpeed;
    if (x < 0||x > width - w) {
      xSpeed *= -1;
    }
  }
  void update() {
    int direction = (xSpeed > 0)? RIGHT: LEFT;
    pushMatrix();
    translate(x, y);
    if (direction == RIGHT) {
      scale(1, 1);
      if (moveTimer%10<5) {
        image(img, 0, 0, w, h);
      } else {
        image(img1, 0, 0, w, h);
      }
    } else {
      scale(-1, 1);
      if (moveTimer%10<5) {
        image(img, -w, 0, w, h);
      } else {
        image(img1, -w, 0, w, h);
      }
    }
    popMatrix();
    if (direction == RIGHT && player2.x >x&&player2.y +80 >= y+10&&player2.y <= y+70) {

      x+= TRIGGERED_SPEED_MULTIPLIER;
    } else if (direction == LEFT && player2.x <x&&player2.y +80 >= y+10&&player2.y <= y+70) {
      x+=  -TRIGGERED_SPEED_MULTIPLIER;
    }
    moveTimer ++ ;
    moveTimer = moveTimer%500;
  }
  // HINT: Player Detection in update()
  /*
	float currentSpeed = speed
   	If player2 is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
   		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
   	}
   	*/
}