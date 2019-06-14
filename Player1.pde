class Player1{
  final int SIZE=50;
  final int SPEED=1;
  int x,y,writingProgress,writingSpeed;
  float radiens;

  void display(){
    pushMatrix();
    translate(x+SIZE/2,y+SIZE/2);
    rotate(radiens);
    image(player1img,-SIZE/2,-SIZE/2);
    popMatrix();
  }
  
  void write(int x,int y1,int y2){
    if(this.x>=x-SIZE&&this.x+SIZE<=x+SIZE*2&&this.y>=y2-SIZE&&this.y+SIZE<=y1+SIZE*2&&write&&gameState==CHEATING_GAME){
      writingProgress+=writingSpeed;
    }if(writingProgress>allAnswer) gameState=WIN;
  }
  
  void move(){
    if(leftPressed&&x>100&&canMoveL){
      radiens=-HALF_PI;
      x-=SPEED;
    }if(rightPressed && x<width-100-SIZE && canMoveR){
      radiens=HALF_PI;
      x+=SPEED;
    }if(upPressed&&y>240&&canMoveU){
      radiens=0;
      y-=SPEED;
    }if(downPressed&&y<height-160-SIZE&&canMoveD){
      radiens=PI;
      y+=SPEED;
    }
  }

  Player1(int x,int y){
    this.x=x;
    this.y=y;
    writingProgress=0;
    writingSpeed=1;
    radiens=0;
  }
}