class Classmate{
  final int SIZE=50;
  int x,y,classmateIndex;
  
  void display(){
    
    if(classmateIndex==0) image(classmate1,x,y);
    else image(classmate2,x,y);
  }

  Classmate(int x,int y){
    this.x=x;
    this.y=y;
    classmateIndex=int(random(2));
  }
}