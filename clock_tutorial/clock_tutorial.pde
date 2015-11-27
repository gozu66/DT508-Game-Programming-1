void setup()
{
  size(500, 500);
  background(155);
}

void draw()
{
  float theta = TWO_PI/12, radius = 200, midpoint = width * 0.5f;
  
  for(int i = 1; i <= 12; i++)
  {
    float x = midpoint + sin(theta)*radius;
    float y = midpoint - cos(theta)*radius;
    text(i, x, y);
    theta += TWO_PI/12;
  }
}
