class Soil {
  int col, row;
  int health;

  void display() {


    image(soil, col*80, row*160+960, 80, 30);
  }

  Soil(int col, int row, int health ) {
    this.col = col;
    this.row = row;
    this.health = health;
  }
}