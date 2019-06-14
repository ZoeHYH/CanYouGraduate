class Seat{
  final int SIZE=50;
  int x,y;
  
  void table(){
    image(table,x,y);
  }
  
  void chair(){
    image(chair,x+13,y+int(SIZE*(1.5)));
  }
  
  Seat(int x,int y){
    this.x=x;
    this.y=y;
  }
}