Ship[] ships = new Ship[2];

void setup()
{
  size(500, 500);
  noFill();
  stroke(0,255,0);
  for(int i = 0; i < 2; i++)
  {
    ships[i] = new Ship(random(width), random(height));
  }
}

void draw()
{
  background(0);
  for(int i = 0; i < ships.length; i++)
  {
    ships[i].render();
    ships[i].update();
  }  
}
