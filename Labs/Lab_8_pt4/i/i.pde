void setup()
{
  size(200, 200);
  drawStar(100, 100, 50, 5);
}

void drawStar(float cx, float cy, float radius, float points)
{
  float theta = 0;
  for(int i = 0; i < points * 2; i++)
  {
    float x = cx + sin(theta)*radius;
    float y = cy - cos(theta)*radius;
    theta += (TWO_PI/points)*2;
    float x2 = cx + sin(theta)*radius;
    float y2 = cy - cos(theta)*radius;
    line(x, y, x2, y2);
  }
}
