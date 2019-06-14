class Bar {
  final int FRAME_WIDTH=15;
  final int FRAME_HEIGHT=16;
  final int LENGTH=570;
  final int WIDTH=22;
  final int FRAME_X=750;
  final int FRAME_Y=150;
  //left down
  final int INIT_X=FRAME_X+FRAME_WIDTH;
  final int INIT_Y=FRAME_Y+FRAME_HEIGHT+LENGTH;
  float barLength;
  
  void display(int writingProgress,int ALL_ANSWER){
    image(barFrame,FRAME_X,FRAME_Y);
    noStroke();
    fill(#CC0000);
    rectMode(CORNERS);
    barLength=map(writingProgress,0,ALL_ANSWER,0,LENGTH);
    rect(INIT_X,INIT_Y-barLength,INIT_X+WIDTH,INIT_Y);
  }
  
  Bar(){
    barLength=0;
  }
}