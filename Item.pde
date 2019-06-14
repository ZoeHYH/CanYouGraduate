class Item {
	boolean isAlive;
  boolean pointsIsHit = false;
	float x, y;
	float w = SOIL_SIZE;
	float h = SOIL_SIZE;

	void display(){}
	void checkCollision(Player player2){}

	Item(float x, float y){
		isAlive = true;
		this.x = x;
		this.y = y;
	}
}