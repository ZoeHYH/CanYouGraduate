 class Range{
  //diameter
  final int MAX_RANGE=1000;
  final int LARGE_RANGE=850;
  final int SMALL_RANGE=100;
  final float MOVE_RANGE=QUARTER_PI;
  final int INTERVALS=300;
  int look,state,range;
  final int DOWN=0;
  final int RIGHT=1;
  final int LEFT=2;
  final int PLAYER1=3;
  final int STOP=0;
  float start,stop,changeRadians,radiens;

  void display(int x,int y){
    start=radiens-MOVE_RANGE/2;
    stop=radiens+MOVE_RANGE/2;
    for(int i=0;i<range;i++){
      colorMode(HSB);
      fill(133,map(i,0,range,133,225),225,map(i,0,range,4,5));//133,225
      noStroke();
      pushMatrix();
      translate(x,y);
      rotate(changeRadians);
      arc(0,0,range-i,range-i,start,stop);
      popMatrix();
    }
  }
  
  void move(){
    switch(look){
      case DOWN:
        radiens=HALF_PI;
        break;
      case RIGHT:
        radiens=0;
        break;
      case LEFT:
        radiens=PI;
        break;
      case PLAYER1:
        radiens=player1Angle;
        break;
    }
    switch(state){
      case STOP:
        range=(gameLevel==HELL)?MAX_RANGE :SMALL_RANGE;
        break;
      case RIGHT:
        range=LARGE_RANGE;
        changeRadians-=MOVE_RANGE/(INTERVALS);
        break;
      case LEFT:
        range=LARGE_RANGE;
        changeRadians+=MOVE_RANGE/(INTERVALS);
        break;
    }
  }
  
  Range(){
    state=STOP;
    changeRadians=0;
  }
}