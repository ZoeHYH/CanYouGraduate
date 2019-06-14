class Poster extends Trap {
  int fallen = 0;
  int timer =0;
  PVector[] vertices = new PVector[4];
  boolean hit=false;


  boolean detect(Player player) {
    if (player.y>y && player.y<y+h && x+w+h>player.x && x-h<player.x+player.w) {
      return true;
    }
    return false;
  }

  void checkCollision(Player player) {
    if (fallen==1) {
      vertices[0]=new PVector(x+w, y+h);
      vertices[1]=new PVector(x+w +(h*sin(radians(timer))), y+h-h*cos(radians(timer)));
      vertices[2]=new PVector(x+w+(-w*cos(radians(timer))), y+h-w*sin(radians(timer)));
      vertices[3]=new PVector(x+w+(-w*cos(radians(timer))+h*sin(radians(timer))), y+h+(-w*sin(radians(timer)-h*cos(radians(timer)))));
    }

    if (fallen==2) {
      vertices[0]=new PVector(x, y+h);
      vertices[1]=new PVector(x +(h*sin(radians(-timer))), y+h-h*cos(radians(-timer)));
      vertices[2]=new PVector(x+(w*cos(radians(-timer))), y+h+w*sin(radians(-timer)));
      vertices[3]=new PVector(x+(w*cos(radians(-timer))+h*sin(radians(-timer))), y+h+(w*sin(radians(-timer)-h*cos(radians(-timer)))));
    }


    if (polyRect(vertices, player.x, player.y, player.w, player.h) && timer<90) {
      player.hurt();
    }
  }


  void display() {
    if (detect(player) && player.x>x && fallen==0) {
      fallen =1;
    } else if (detect(player) && player.x<x && fallen==0) {
      fallen = 2;
    }


    if (fallen == 1 ) {
      if (timer<90) {
        timer+=3;
      }
      pushMatrix();
      translate(x+w, y+h);
      rotate(radians(timer));
      image(post, -w, -h, w, h);
      popMatrix();
    } else if (fallen==2 ) {
      if (timer<90) {
        timer+=3;
      }

      pushMatrix();
      translate(x, y+h);

      rotate(radians(-timer));
      image(post, 0, -h, w, h);
      popMatrix();
    }
    if (fallen==0) {
      image(post, x, y, w, h);
    }
  }

  Poster(float x, float y ) {
    super(x, y);
    w=50;
    h=100;


    vertices[0]=new PVector(x, y);
    vertices[1]=new PVector(x+w, y);
    vertices[2]=new PVector(x+w, y+h);
    vertices[3]=new PVector(x, y+h);
  }
}