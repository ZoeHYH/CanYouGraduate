class Monitor extends Trap {
  int direction=floor(random(2));
  Light light=new Light(direction);


  void display() {
    if (direction==1) {
      image(Monitor_Left, x, y, w, h);
    }
    else{
      image(Monitor_Right,x,y,w,h);
    }
  }
  void watching() {
    light.lighting(x,y);
    light.display();
    light.update();
    light.foundPlayer(player);
  }

  Monitor(float x, float y) {
    super(x, y);
    w=monitor_w;
    h=monitor_h;
  }
}