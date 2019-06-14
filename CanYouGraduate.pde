PImage Monitor_Left, Monitor_Right, Admin_Left, Admin_Mid, Admin_Right, fallingTile, 
  post, bg, r_move1, r_move2, r_jump, l_move1, l_move2, l_jump, goalGround, paperToGet, 
  beginning, cloud, cloud1, mainbg, elevator, elevatorOutside, siwei, siwei1, zongyuan, zongyuan1, 
  xingzheng, xingzheng1;
PImage fail,success,finalSuccess,cheatingRule,cheatingRuleSkip,climbingRule,climbingRuleSkip,jumpingRule,jumpingRuleSkip;
PImage groundhogIdle1, groundhogLeft1, groundhogRight1, groundhogDown1;
PImage groundhogLeft2, groundhogRight2, groundhogDown2, groundhogIdle2;
PImage bg_CLIMB, roof;
PImage soil, soilEmpty ;
PImage stone;
PImage police1;
PImage police2;
PImage pointsPicture, pointsDown, pointsRight;
PImage mood0, mood1, mood2, mood3, mood4;
PFont font;



final int SOIL_COL_COUNT = 8;
final int SOIL_ROW_COUNT = 24;
final int SOIL_SIZE = 80;
final int GRASS_HEIGHT = 15;
final float CLOCK_BONUS_SECONDS = 15f;
final int GAME_INIT_TIMER = 7200;
int gameTimer = GAME_INIT_TIMER;
int stairHealth;
boolean openState = false;
boolean pickUpState = false;
boolean upStairs = false;
boolean downStairs = false;
boolean pointsIsHit ;
boolean points1IsHit = false;
boolean done1=false, done2=false, done3=false;

int b ;

int isCountDown ;
int isCountUp;
int d = 0;
int answerX = floor(random(0, 8))*100;
int answerY = floor(random(0, 16))*160;
Player2 player2;
Stair [] stairs;
Soil [][] soils ;
Enemy [] enemies;
Item [] items;
Door [][] doors;
Point [] points;
Point1 [] points1;
Answer  answer;


int GAMESTATE=0;
final int GAMESTART=0, RULE=1, MAIN=2, CHEATING=3, CLIMBING=4, JUMPING=5, GAMELOSE=6, GAMEWIN=7;
boolean rule1=false,rule2=false,rule3=false;
final float player_w=50;
final float player_h=80;
final float player_init_X=200;
final float player_init_Y=600;
final float maxDownSpeed=10;
final float jumpSpeed=6;
final float monitor_w=50;
final float monitor_h=30;
Player player;
Player_Main player_main;
Ground ground[]=new Ground[30];
Ground ground1= new Ground(0, 850, 14);
Tile tile[]=new Tile[10];
Monitor monitor[] = new Monitor[8];
Poster poster[] = new Poster[4];
Paper paper;
Elevator elevatorMain;





PImage player1img, teacherimg, classmate1, classmate2, target, tTable, tChair, table, chair, seat, bg_CHEAT, barFrame;


int gameState=2;
final int CHEATING_GAME=2;
final int LOSE=1;
final int WIN=3;
//game lavel
int gameLevel=0;
final int EASY=0;
final int MEDIUM=1;
final int HELL=2;
int allAnswer;
int timer=0;
//background
final int SEATS=21;
final int CLASSMATES=SEATS-1;
//target
int targetI;
//player
boolean write=false;

boolean leftPressed=false;
boolean rightPressed=false;
boolean upPressed=false;
boolean downPressed=false;
boolean canMoveL=true;
boolean canMoveR=true;
boolean canMoveU=true;
boolean canMoveD=true;
float player1Angle;



Bar bar;
Range range;
Teacher teacher;
Seat[] seats;
Classmate[] classmates;
Player1 player1;



int MainTimer=0;


boolean canJump=false;

boolean leftState =false, rightState=false, upState = false, downState =false;




void setup() {
  size(800, 900, P2D);
  pixelDensity(displayDensity());
  noStroke();
  fail=loadImage("img/fail.jpg");
  success=loadImage("img/success.jpg");
  finalSuccess=loadImage("img/finalSuccess.jpg");
  cheatingRule=loadImage("img/cheatingRule.jpg");
  cheatingRuleSkip=loadImage("img/cheatingRuleSkip.jpg");
  climbingRule=loadImage("img/climbingRule.jpg");
  climbingRuleSkip=loadImage("img/climbingRuleSkip.jpg");
  jumpingRule=loadImage("img/jumpingRule.jpg");
  jumpingRuleSkip=loadImage("img/jumpingRuleSkip.jpg");
  
  Monitor_Left = loadImage("img/monitor_Left.png");
  Monitor_Right = loadImage("img/monitor_Right.png");
  Admin_Left = loadImage("img/admin_Left.png");
  Admin_Mid = loadImage("img/admin_Mid.png");
  Admin_Right = loadImage("img/admin_Right.png");
  post = loadImage("img/poster.png");
  fallingTile = loadImage("img/tile.png");
  elevator = loadImage("img/elevator.png");
  elevatorOutside = loadImage("img/elevatorOutside.png");
  bg = loadImage("img/bg.jpg");
  r_move1 = loadImage("img/R_move1.png");
  r_move2 = loadImage("img/R_move2.png");
  r_jump = loadImage("img/R_jump.png");
  l_move1 = loadImage("img/L_move1.png");
  l_move2 = loadImage("img/L_move2.png");
  l_jump = loadImage("img/L_jump.png");
  goalGround = loadImage("img/goal.png");
  paperToGet = loadImage("img/paper.png");
  beginning = loadImage("img/beginning.jpg");
  cloud = loadImage("img/cloud.png");
  cloud1 = loadImage("img/cloud1.png");
  mainbg = loadImage("img/mainBackGround.jpg");
  siwei = loadImage("img/siwei.png");
  siwei1 = loadImage("img/siwei1.png");
  zongyuan = loadImage("img/zongyuan.png");
  zongyuan1 = loadImage("img/zongyuan1.png");
  xingzheng = loadImage("img/xingzheng.png");
  xingzheng1 = loadImage("img/xingzheng1.png");

  bg_CLIMB = loadImage("img/background.jpg");
  roof = loadImage("img/roof.png");
  groundhogIdle1 = loadImage("img/standright.png");
  groundhogIdle2 = loadImage("img/standleft.png");
  groundhogLeft1 = loadImage("img/walkleft1.png");
  groundhogRight1 = loadImage("img/walkright1.png");
  groundhogDown1 = loadImage("img/walkup1.png");
  groundhogLeft2 = loadImage("img/walkleft2.png");
  groundhogRight2 = loadImage("img/walkright2.png");
  groundhogDown2 = loadImage("img/walkup2.png");
  pointsDown = loadImage("img/pointdown.png");
  pointsRight = loadImage("img/pointright.png");
  soil = loadImage("img/floor.png");
  police1 = loadImage("img/policeright1.png");
  police2 = loadImage("img/policeright2.png");
  pointsPicture = loadImage("img/point.png");
  mood0 = loadImage("img/mood0.png");
  mood1 = loadImage("img/mood1.png");
  mood2 = loadImage("img/mood2.png");
  mood3 = loadImage("img/mood3.png");
  mood4 = loadImage("img/mood4.png");
  font = createFont("font/font.ttf", 56);
  textFont(font);

  player1img=loadImage("img/player1.png");
  teacherimg=loadImage("img/teacher.png");
  classmate1=loadImage("img/classmate1.png");
  classmate2=loadImage("img/classmate2.png");
  target=loadImage("img/target.png");
  tTable=loadImage("img/tTable.png");
  tChair=loadImage("img/tChair.png");
  table=loadImage("img/table.png");
  chair=loadImage("img/chair.png");
  seat=loadImage("img/seat.png");
  bg_CHEAT=loadImage("img/bg_CHEAT.jpg");
  barFrame=loadImage("img/barFrame.png");

  player = new Player();
  player_main = new Player_Main();
  tileInit();
  trapInit();
  elevatorMain =new Elevator(365, 766);
  player2 = new Player2();
  points = new Point[4];
  points1 = new Point1[4];
  soils = new Soil[10][18];
  stairs = new Stair[68];
  doors = new Door [8][17];

  stairsInit();
  doorsInit();
  enemiesInit();
  pointInit();
  soilInit();

  init();
}

void draw() {
  switch(GAMESTATE) {
  case GAMESTART:
    image(beginning, 0, 0);
    if (mouseX>300 && mouseX<490 && mouseY>245 &&mouseY<295) {
      image(cloud1, 218, 180);
      if (mousePressed) {
        GAMESTATE = MAIN;
      }
    } else {
      image(cloud, 218, 180);
    }
    break;
  
  case MAIN:
    image(mainbg, 0, 0);

    player_main.update();
    MainTimer++;
    if (MainTimer<127) {
      player_main.move=true;
    } else {
      player_main.move=false;
      image(elevator, 365, 766);
      elevatorMain.update();
    }

    if (mouseX>530 && mouseX<783 && mouseY>460 && mouseY<595 && elevatorMain.y>460 && elevatorMain.y<515) {
      image(siwei1, 530, 460, 253, 135);
      if(mousePressed){
        rule1=true;
        GAMESTATE = RULE;
      }
    } else image(siwei, 530, 460);

    if (mouseX>0 && mouseX<282 && mouseY>155 && mouseY<435 && elevatorMain.y>295 && elevatorMain.y<375 && done1) {
      image(zongyuan1, -90, 155, 372, 284);
      if (mousePressed){
        rule2=true;
        GAMESTATE = RULE;
      }
    } else image(zongyuan, -90, 155);

    if (mouseX>517 && mouseX<794 && mouseY>128 && mouseY<286 && elevatorMain.y>166 && elevatorMain.y<210 && done2) {
      image(xingzheng1, 517, 128, 277, 158);
      if (mousePressed){
        rule3=true;
        GAMESTATE= RULE;
      }
    } else image(xingzheng, 517, 128);

    image(elevatorOutside, 287, -5);
    break;
    
  case RULE:
    if(rule1){
        if(mouseX>111 && mouseX<353 && mouseY>758 &&mouseY<845){
          image(cheatingRuleSkip,0,0);
          if(mousePressed){
            GAMESTATE = CHEATING;
            init();
            rule1=false;
          }
        }else image(cheatingRule,0,0);
    }else if(rule2){
       if(mouseX>111 && mouseX<353 && mouseY>758 &&mouseY<845){
         image(climbingRuleSkip,0,0);
         if(mousePressed){
           GAMESTATE = CLIMBING;
           player2 = new Player2();
           stairsInit();
           doorsInit();
           enemiesInit();
           pointInit();
           soilInit();
           rule2=false;
         }
       }else image(climbingRule,0,0);
    }else if(rule3){
      if(mouseX>111 && mouseX<353 && mouseY>758 &&mouseY<845){
        image(jumpingRuleSkip,0,0);
        if(mousePressed){
          GAMESTATE = JUMPING;
          player = new Player();
          tileInit();
          trapInit();
          rule3=false;
        }
      }else image(jumpingRule,0,0);
    }
    break;
    
  case CHEATING:
    switch(gameState) {
    case CHEATING_GAME:
      //gameLevel
      switch(gameLevel) {
      case EASY:
        allAnswer=300;
        teacher.direction=teacher.STOP;
        timer++;
        range.look=range.DOWN;
        if (timer==range.INTERVALS) range.state=range.RIGHT;
        if (timer==int(range.INTERVALS*1.5)) range.state=range.LEFT;
        if (timer==int(range.INTERVALS*2.5)) range.state=range.RIGHT;
        if (timer==range.INTERVALS*3) {
          range.state=range.STOP;
          timer=0;
        }
        break;
      case MEDIUM:
        allAnswer=400;
        if (teacher.x==teacher.INIT_X&&teacher.y==teacher.INIT_Y) {
          teacher.direction=teacher.RIGHT;
          range.look=range.RIGHT;
          range.state=range.STOP;
        }
        if (teacher.x>=650&&teacher.y==teacher.INIT_Y) {
          teacher.direction=teacher.DOWN;
          range.look=range.DOWN;
          range.state=range.STOP;
        }
        if (teacher.x>=650&&teacher.y>=550) {
          teacher.direction=teacher.STOP;
          range.look=range.LEFT;
          if (range.state==range.STOP) range.state=range.LEFT;
        }
        if (range.changeRadians>=range.MOVE_RANGE) range.state=range.RIGHT;
        if (range.changeRadians<=-range.MOVE_RANGE) range.state=range.LEFT;
        break;
      case HELL:
        allAnswer=500;
        teacher.direction=teacher.STOP;
        timer++;
        if (timer<int(range.INTERVALS*0.5)){
          range.look=range.DOWN;
          range.state=range.RIGHT;
        }if (timer==int(range.INTERVALS*0.5)) range.state=range.LEFT;
        if (timer==int(range.INTERVALS*1.5)) range.state=range.RIGHT;
        if (timer==range.INTERVALS*2) {
          range.state=range.STOP;
          range.look=range.PLAYER1;
        }
        break;
      }
      //backgroud
      image(bg_CHEAT, 0, 0);
      image(tChair, teacher.INIT_X+10, teacher.INIT_Y-20);
      image(tTable, teacher.INIT_X-25, teacher.INIT_Y+teacher.SIZE);
      //bar
      bar.display(player1.writingProgress, allAnswer);
      //table
      for (int i=0; i<SEATS; i++) seats[i].table();
      //classmates
      for (int i=0; i<CLASSMATES; i++) classmates[i].display();
      //target
      image(target, classmates[targetI].x, classmates[targetI].y);
      //chair
      for (int i=0; i<SEATS-1; i++) seats[i].chair();
      //player1
      isHit_CHEAT(player1.x, player1.y, player1.SIZE, seats[0].x, seats[0].y, seats[SEATS-1].x+seats[SEATS-1].SIZE, classmates[CLASSMATES-1].y+classmates[0].SIZE, seats[SEATS-1].x-15, classmates[CLASSMATES-1].y);
      player1.display();
      player1.write(classmates[targetI].x, classmates[targetI].y, seats[targetI].y);
      player1.move();
      player1Angle=(atan2(player1.y+player1.SIZE/2-(teacher.y+teacher.SIZE/2), player1.x+player1.SIZE/2-(teacher.x+teacher.SIZE/2))<0) ?atan2(player1.y+player1.SIZE/2-(teacher.y+teacher.SIZE/2), player1.x+player1.SIZE/2-(teacher.x+teacher.SIZE/2))+PI*2 :atan2(player1.y+player1.SIZE/2-(teacher.y+teacher.SIZE/2), player1.x+player1.SIZE/2-(teacher.x+teacher.SIZE/2));
      seats[SEATS-1].chair();
      //range
      range.move();
      range.display(teacher.x+teacher.SIZE/2, teacher.y+teacher.SIZE/2);
      //teacher
      teacher.move();
      teacher.display(range.radiens+range.changeRadians);
      teacher.collision(player1, range);
      break;
    case LOSE:
      init();
      image(fail,0,0);
      if (mouseX>537 && mouseX<750 && mouseY>653 && mouseY<736 && mousePressed){
        if(gameLevel==2){
          done1=true;
          GAMESTATE=MAIN;
        }else gameState=CHEATING_GAME;
      }
      break;
    case WIN:
      init();
      image(success,0,0);
      if (mouseX>94 && mouseX<257 && mouseY>697 && mouseY<778 && mousePressed&&gameLevel<2) { 
        gameState=CHEATING_GAME;
        gameLevel++;
        player1.writingProgress=0;
      }
      break;
    }
    break;
    
    
  case CLIMBING:

    image(bg_CLIMB, 0, 0, 800, 900);
    pushMatrix();
    translate(0, max(-280, 160*2-player2.y));
    soilInit();
    image(roof, 0, -2050);
    for ( int i = 0; i < 10; i++) {
      for ( int j = 0; j < 18; j++) {

        soils[i][j].display();
      }
    }
    isCountUp = 0;  
    isCountDown = 0;

    for ( int i = 0; i < 8; i++) {
      for ( int j = 0; j < 17; j++) {
        for (int k = 0; k<b; k++) {
          if (doors[i][j].x>stairs[k].x-50&&doors[i][j].x<stairs[k].x+50&&doors[i][j].y -60 == stairs[k].y) {
            doors[i][j].isAlive = false;
          }
        }
        doors[i][j].display(); 
        doors[i][j].checkCollision(player2);
      }
    }
    for (int j = 0; j < b; j++) {

      stairs[j].update();
      stairs[j].checkCollision(player2);
    }
    for (int i =0; i<4; i++) {

      points[i].display();

      points1[i].display();
      points1[i].checkCollision(player2);
    }
    answer.display();  
    answer.checkCollision(player2);  
    //enemies
    for (Enemy e : enemies) {
      if (e == null) continue;
      e.update();
      e.display();
      e.checkCollision(player2);
    }
    //  player2
    player2.update();
    for (int i = 16; i>-1; i--) {
      String floorNumber = floorStairs(i);
      fill(0, 120);
      text(floorNumber, 700, -i*160+6*160);
    }
    popMatrix();
    player2.mood();
    for (int i =0; i<4; i++) {
      points[i].checkCollision(player2);
    }
    break;


  case JUMPING:

    image(bg, 0, 0);
    pushMatrix();
    translate(0, min(1600, max(0, height-player.y-player.h-200)));

    ground1.display();
    ground1.carry(player);
    for (int i=0; i<30; i++) {
      ground[i].display();
      ground[i].carry(player);
    }

    for (int i=0; i<monitor.length; i++) {
      monitor[i].display();
      monitor[i].watching();
    }

    for (int i=0; i<tile.length; i++) {
      if ((i==0 ||(i>0 &&tile[i-1].y>-400))&&player.y>-800 ) {
        if (tile[i].y==-1700) {
          tile[i].y=-1600;
        }
        tile[i].display();
        tile[i].update();
        tile[i].checkCollision(player);
      }
      if (i==9 && tile[i].y>900) {
        tileInit();
        i=0;
      }
      println(i, tile[i].y);
    }

    for (int i =0; i<poster.length; i++) {
      poster[i].display();
      poster[i].checkCollision(player);
    }
    paper.display();
    paper.checkCollision(player);
    player.update();
    popMatrix();
    if (done3) {
      GAMESTATE=GAMEWIN;
    }
    break;

  case GAMELOSE:
    image(fail,0,0);
    if (mouseX>537 && mouseX<750 && mouseY>653 && mouseY<736 && mousePressed) {
      GAMESTATE=MAIN;
      elevatorMain =new Elevator(365, 766);
    }
    break;
  case GAMEWIN:
    if(done3){
      image(finalSuccess,0,0);
      if(mouseX>547 && mouseX<757 && mouseY>800 && mouseY<881 && mousePressed){
        GAMESTATE=GAMESTART;
      }
    }else{
      image(success,0,0);
        if(mouseX>94 && mouseX<257 && mouseY>697 && mouseY<778 && mousePressed){
          GAMESTATE=MAIN;
          done2=true;
        }
    }
    break;
  }
  
}
boolean walk() {
  if (player1.x>=seats[SEATS-1].x-8&&player1.y>=seats[SEATS-1].y+seats[SEATS-1].SIZE-18&&player1.x+player1.SIZE<=seats[SEATS-1].x+seats[SEATS-1].SIZE+8&&player1.y+player1.SIZE<=seats[SEATS-1].y+seats[SEATS-1].SIZE+player1.SIZE-2) return false;
  return true;
}



void init() {
  timer=0;
  bar=new Bar();
  range=new Range();
  teacher=new Teacher();
  seats=new Seat[SEATS];
  classmates=new Classmate[CLASSMATES];
  for (int i=0; i<SEATS; i++) {
    seats[i]=new Seat(175+floor(i%7)*65, 400+floor(i/7)*100);
  }
  for (int i=0; i<CLASSMATES; i++) {
    classmates[i]=new Classmate(seats[i].x, seats[i].y+seats[i].SIZE-10);
  }
  player1=new Player1(seats[SEATS-1].x, seats[SEATS-1].y+seats[SEATS-1].SIZE-10);
  targetI=int(random(CLASSMATES));
  while (targetI>7&&targetI<13) { 
    targetI=int(random(CLASSMATES));
  }
}



boolean isUpStairs(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {

  return  ax + aw  > bx  && 
    ax < bx + bw 
    && ay+ah == by + bh ;
}
boolean isDownStairs(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  return  ax + aw > bx &&    // a right edge past b left
    ax < bx + bw &&
    ay == by + bh ;
  //&&    // a left edge past b right
  //ay + ah > by &&    // a top edge past b bottom
  //ay < by + bh;}
}        
String floorStairs(int number) {
  String result = "";

  if (number  > 0  ) {
    result += number + "F";
  } else {
    result += "B1";
  }
  return result ;
}
void doorsInit() {

  for (int j = 0; j<17; j++) {
    for (int k = 0; k<8; k++) {

      doors[k][j] = new Door(k*100, -j*160+160*5+60);
    }
  }
}

void enemiesInit() {

  enemies = new Enemy[4];
  for (int i = 0; i <enemies.length; i++) {
    float  newX = random(0, width-80);
    float  newY = 160*( i * 4 + floor(random(4)))+80;
    switch(i) {
    case 0: 
    case 1:  
      enemies[i] = new Police(newX, -newY+960);
      break;
    case 2: 
    case 3:  
      enemies[i] = new Dinosaur(newX, -newY+960);
      break;
    }
  }
}

void soilInit() {

  for ( int i = 0; i < 10; i++) {
    for ( int j = 0; j < 18; j++) {
      soils[i][j] = new Soil(i, -j, 1);
    }
  }
}

void pointInit() {

  items = new Item [2];
  for (int i = 0; i < items.length; i++) {
    float  newX = random(0, width-80);
    float  newY = 160*floor(random(1, 16))+80;
    switch(i) {
    case 0: 
      items[i] = new Point(newX, newY);
    case 1: 
      items[i] = new Point(newX, newY);
    }
  }

  for (int i = 0; i < 4; i++) {

    int newX = floor(random(0, 10))*50;
    int newY =160 * ( i * 4 + floor(random(4)));
    int pointX = floor(random(0, 10))*50;
    int pointY =160 * ( i * 4 + floor(random(4)));
    points[i] = new Point(newX, -newY+910);
    points1[i] = new Point1(pointX, -pointY+910);
  }
  for (int k = 0; k<b; k++) {
    answerX = floor(random(0, 8))*100;
    answerY = -((floor(random(0, 16)))*160) + 860;
    while (answerX>stairs[k].x-50&&answerX<stairs[k].x+100&&answerY -140 == stairs[k].y) {
      answerX = floor(random(0, 8))*100;
      answerY = -((floor(random(0, 16)))*160) + 860;
      println("1");
    }
    answer = new Answer(answerX, answerY);
  }
}
void stairsInit() {
  b = 0;

  int col;
  int row;
  for (int j = 0; j < 16; j ++) {
    int a = floor(random(1, 3));

    for (int i = 0; i < a; i ++) {

      col = floor(random(0, 10));
      row = j;

      if (3>b&&b>1) {
        while (col*80 == stairs[b-1].x||col*80 == stairs[b-2].x) {
          col = floor(random(0, 10));
        }
      }
      if (b>=3) {

        while (col*80 == stairs[b-1].x||col*80 == stairs[b-2].x||col*80 == stairs[b-3].x) {
          col = floor(random(0, 10));
        }
      }      
      stairs[b] = new Stair( col*80, - row*160+800);
      b++;//stairs[b] = new Stair( col*80 ,- row*160+800);
    }
  }
}










void tileInit() {

  for (int i=0; i<10; i++) {
    float tileX=random(800);
    float tileY=-1700;
    tile[i]=new Tile(tileX, tileY);
  }
}

void trapInit() {

  float newX=250;
  float newY=800;
  int j =0;
  int k =0;
  for (int i=0; i<30; i++) {
    if (i>=6 && i%3==0 && j<8) {
      monitor[j] = new Monitor(newX+50, newY+50);
      if (newX==0) {
        monitor[j].direction=0;
        monitor[j].light.direction=0;
      }
      if (newX==width-150) {
        monitor[j].direction=1;
        monitor[j].light.direction=1;
      }
      j++;
    }
    if (i>20 && i%2==1 && k<4) {
      poster[k] = new Poster(newX+random(50, 100), newY-100);
      k++;
    }
    if (i!=29) {
      ground[i]=new Ground(newX, newY, 1);
    } else {
      ground[i]= new GoalGround(newX, newY, 1);
      paper= new Paper(newX+random(50, 100), newY-50);
    }
    int decision = floor(random(2));
    if (decision==0) {
      newX -= 250;
    }
    if (decision==1) {
      newX += 250;
    }
    newY -= 80;
    if (newX<0) {
      newX=0;
    }
    if (newX>width-150) {
      newX=width-150;
    }
  }
}





boolean onGround(float ax, float ay, float aw, float ah, float bx, float by, float n) {
  return(bx<ax+aw && ax<bx+50*(n+2) && ay+ah<=by+maxDownSpeed &&ay+ah>=by &&player.downSpeed>0);
}

boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  return(bx<ax+aw && ax< bx+bw && ay+ah>by && by+bh>ay);
}

boolean polyRect(PVector[] vertices, float rx, float ry, float rw, float rh) {
  int next = 0;
  for (int current=0; current<vertices.length; current++) {
    next = current+1;
    if (next == vertices.length) {
      next = 0;
    }
    PVector vc = vertices[current];
    PVector vn = vertices[next];

    boolean collision = lineRect(vc.x, vc.y, vn.x, vn.y, rx, ry, rw, rh);
    if (collision) {
      return true;
    }
    boolean inside = polygonPoint(vertices, rx, ry);

    if (inside) {
      return true;
    }
  }
  return false;
}



void isHit_CHEAT(int ax, int ay, int as, int bx, int by, int bx2, int by2, int cx, int cy) {
  canMoveL=true;
  canMoveR=true;
  canMoveU=true;
  canMoveD=true;
  if (ax==bx2&&ay+as>by&&ay<cy||ax==cx&&ay+as>cy&&ay<by2) canMoveL=false;
  if (ax+as==bx&&ay+as>by&&ay<by2) canMoveR=false;
  if (ay==by2&&ax+as>bx&&ax<cx||ay==cy&&ax+as>cx&&ax<bx2) canMoveU=false;
  if (ay+as==by&&ax+as>bx&&ax<bx2) canMoveD=false;
}


boolean lineRect(float x1, float y1, float x2, float y2, float rx, float ry, float rw, float rh) {
  boolean left = lineLine(x1, y1, x2, y2, rx, ry, rx, ry+rh);
  boolean right = lineLine(x1, y1, x2, y2, rx+rw, ry, rx+rw, ry+rh);
  boolean top = lineLine(x1, y1, x2, y2, rx, ry, rx+rw, ry);
  boolean bottom = lineLine(x1, y1, x2, y2, rx, ry+rh, rx+rw, ry+rh);
  if (left || right || top || bottom) {
    return true;
  }
  return false;
}

boolean lineLine(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {

  // calculate the direction of the lines
  float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

  // if uA and uB are between 0-1, lines are colliding
  if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
    return true;
  }
  return false;
}

boolean polygonPoint(PVector[] vertices, float px, float py) {
  boolean collision = false;

  // go through each of the vertices, plus the next
  // vertex in the list
  int next = 0;
  for (int current=0; current<vertices.length; current++) {

    // get next vertex in list
    // if we've hit the end, wrap around to 0
    next = current+1;
    if (next == vertices.length) next = 0;

    // get the PVectors at our current position
    // this makes our if statement a little cleaner
    PVector vc = vertices[current];    // c for "current"
    PVector vn = vertices[next];       // n for "next"

    // compare position, flip 'collision' variable
    // back and forth
    if (((vc.y > py && vn.y < py) || (vc.y < py && vn.y > py)) &&
      (px < (vn.x-vc.x)*(py-vc.y) / (vn.y-vc.y)+vc.x)) {
      collision = !collision;
    }
  }
  return collision;
}



void keyPressed() {
  if (key==CODED) {
    switch(keyCode) {
    case LEFT:
      leftState = true;
      leftPressed = true;
      break;
    case RIGHT:
      rightState = true;
      rightPressed = true;

      break;

    case UP:
      upState = true;
      upPressed = true;

      break;
    case DOWN:
      downState = true;
      downPressed = true;
    }
  } else {
    if (key==' '&&   canJump) {
      player.downSpeed-=jumpSpeed;
      canJump=false;
    }
  }

  switch(key) {
  case 'z':
    openState = true;
    break;
  case 'x':
    pickUpState = true;
    break;
  }
}

void keyReleased() {
  if (key==CODED) {
    switch(keyCode) {
    case LEFT:
      leftState = false;
      leftPressed = false;

      break;
    case RIGHT:
      rightState = false;
      rightPressed = false;

      break;

    case UP:
      upState = false;
      upPressed = false;

      break;
    case DOWN:
      downState = false;
      downPressed = false;

      break;
    }
  }
  switch(key) {
  case 'z':
    openState = false;
    for ( int i = 0; i < 8; i++) {
      for ( int j = 0; j < 17; j++) {
        if (isHit(player2.x, player2.y, 50, 80, answer.x, answer.y, 50, 100) == false&&isHit(player2.x, player2.y, 50, 80, doors[i][j].x, doors[i][j].y, 50, 100)) {
          player2.openDoor +=1;
        }
      }
    }
    break;
  case 'x':
    pickUpState = false;
    break;
  }
}
void mousePressed() {
  if (gameState==CHEATING_GAME) write=true;
}

void mouseReleased() {
  write=false;
}
