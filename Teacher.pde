class Teacher{
  final int SIZE=50;
  final int INIT_X=width/2-SIZE/2;
  final int INIT_Y=250;
  int direction;
  final int DOWN=6;
  final int RIGHT=1;
  final int STOP=2;
  final int LEFT=3;
  final int UP=4;
  int x,y,speed;


  void display(float radians){
    pushMatrix();
    translate(x+SIZE/2,y+SIZE/2);
    rotate(radians-HALF_PI);
    image(teacherimg,-SIZE/2,-SIZE/2);
    popMatrix();
  }  
  
  void move(){
    switch(direction){
      case DOWN:
        y+=speed;
        break;
      case RIGHT:
        x+=speed;
        break;
      case STOP:
        break;
      case UP:
        y-=speed;
        break;
      case LEFT:
        x-=speed;
        break;
    }
  }
  
  void collision(Player1 player1,Range range){
    float dist=dist(x+SIZE/2,y+SIZE/2,player1.x+player1.SIZE/2,player1.y+player1.SIZE/2);
    float startPlayer=range.start+range.changeRadians-player1Angle;
    float playerStop=player1Angle-range.stop-range.changeRadians;
    float distStart=sin(startPlayer)*dist;
    float distStop=sin(playerStop)*dist;
    if(walk()&&(dist<range.SMALL_RANGE/2+player1.SIZE/2||(dist<range.range/2+player1.SIZE/2
    &&(startPlayer<0&&playerStop<0
    ||distStart>0&&distStart<player1.SIZE/2
    ||distStop>0&&distStop<player1.SIZE/2)))){
      gameState=LOSE;
    }
  }
  
  Teacher(){
    direction=STOP;
    x=INIT_X;
    y=INIT_Y;
    speed=2;
  } 
}