class Player2 {
  float x = 0, y = 720;
  float w = 50, h = 80;
  int col, row;
  int xSpeed = 0;
  int ySpeed = 0;
  int moveTimer;
  int answerTimer;
  int openDoor = 0;
  PImage groundhogDisplay = groundhogIdle1; 
  ;
  boolean upStairs = false;
  boolean downStairs = false;
  boolean turnRight = false;
  boolean turnLeft = false;
  boolean turnUp = false;

  void mood() {

    if (openDoor ==0) {
      image(mood0, 750, 100);
    } else if (openDoor ==1) {
      image(mood1, 750, 100);
    } else if (openDoor ==2) {
      image(mood2, 750, 100);
    } else if (openDoor ==3) {
      image(mood3, 750, 100);
    } else if (openDoor ==4) {
      image(mood4, 750, 100);
      GAMESTATE=GAMELOSE;
    }
  }
  void hurt() {
    GAMESTATE=GAMELOSE;
  }
  void update() {
    if (answer.answerDoor == true ) {
      if (answerTimer < 10) {      
        image(groundhogDown1, answer.x, answer.y, 50, 80);
      } else if (answerTimer <20&&answerTimer>=10) {
        image(groundhogDown2, answer.x+5, answer.y+8, 40, 64);
      } else if (answerTimer >=20&&answerTimer<30) {
        image(groundhogDown1, answer.x+10, answer.y+16, 30, 48);
      } else if (answerTimer >= 30&&answerTimer <40) {
        image(groundhogDown2, answer.x+15, answer.y+24, 20, 32);
      } else if (answerTimer >= 40&&answerTimer < 50) {
        image(groundhogDown1, answer.x+20, answer.y+32, 10, 16);
      } else {
        image(groundhogDown2, answer.x+25, answer.y+40, 0, 0);
        GAMESTATE=GAMEWIN;
      }

      answerTimer++;
    } else {

      image(groundhogDisplay, x, y, 50, 80);

      if ((y+80)%160 == 0) {
        if (isCountUp !=0) {
          upStairs = true;
        } else
        {
          upStairs = false;
        }
        if (isCountDown !=0) {
          downStairs = true;
        } else
        { 
          downStairs = false;
        }
      }
      if (upStairs || downStairs) {
        ySpeed = 2;
      } else {
        ySpeed = 0;
      }

      if (leftState) {
        if ((y+80)%160==0) {
          x += xSpeed ;
          if ((y+80)%160==0) {
            if (moveTimer%10<5) {
              groundhogDisplay = groundhogLeft1;
            } else {
              groundhogDisplay = groundhogLeft2;
            }
            if (x<=0) {

              xSpeed = 0;
            } else {

              xSpeed = -2;
              ySpeed = 0;
            }
          } else {

            if (moveTimer%10<5) {
              groundhogDisplay = groundhogLeft1;
            } else {
              groundhogDisplay = groundhogLeft2;
            }
            xSpeed = 0;
            ySpeed = 0;
          }
          turnLeft = true;
          turnRight = false;
          turnUp = false;
        }
      } else   if (rightState) {
        if ((y+80)%160 == 0) {
          x += xSpeed ;
          if ((y+80)%160==0) {
            if (moveTimer%10<5) {
              groundhogDisplay = groundhogRight1;
            } else {
              groundhogDisplay = groundhogRight2;
            }
            if (x>=750) {

              xSpeed = 0;
            } else {

              xSpeed = 2;
              ySpeed = 0;
            }
          } else {
            if (moveTimer%10<5) {
              groundhogDisplay = groundhogRight1;
            } else {
              groundhogDisplay = groundhogRight2;
            }
            xSpeed = 0;
            ySpeed = 0;
          }
          turnLeft = false;
          turnRight = true;
          turnUp = false;
        }
      } else if (upState&& upStairs == true) {
        if (moveTimer%10<5) {
          groundhogDisplay = groundhogDown1;
        } else {
          groundhogDisplay = groundhogDown2;
        }
        y -= ySpeed;
        downStairs = true;
        turnLeft = false;
        turnRight = false;
        turnUp = true;
      } else if (downState && downStairs == true) {
        if (moveTimer%10<5) {
          groundhogDisplay = groundhogDown1;
        } else {
          groundhogDisplay = groundhogDown2;
        }
        y += ySpeed;
        upStairs = true;
        turnLeft = false;
        turnRight = false;
        turnUp = true;
      } else {  
        if (turnLeft == true) {
          groundhogDisplay = groundhogIdle2;
        } else if (turnUp == true &&(y+80)%160 != 0) {
          groundhogDisplay = groundhogDown1;
        } else {
          groundhogDisplay = groundhogIdle1;
        }
        xSpeed = 0;
        ySpeed = 0;
      }


      moveTimer ++;
      moveTimer = moveTimer%500;
    }
  }
}