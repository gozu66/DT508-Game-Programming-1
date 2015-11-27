void setup()
{
  size(200, 200);
  drawPolygon(100, 100, 50, 5);
}

void drawPolygon(float cx, float cy, float radius, float sides)
{
  float theta = 0;
  for(int i = 0; i < sides; i++)
  {
    float x = cx + sin(theta)*radius;
    float y = cy - cos(theta)*radius;
    theta += TWO_PI/sides;
    float x2 = cx + sin(theta)*radius;
    float y2 = cy - cos(theta)*radius;
    line(x, y, x2, y2);
  }
}
