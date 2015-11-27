float radius = 100;
//float theta = 0;
float midpoint;

void setup()
{
  size(500, 500);
  midpoint = width * 0.5f;
  background(0);
}

void draw()
{
  background(0);
  
  int num = 1;
  float theta = TWO_PI/12.0f;
//  float thetaInc = TWO_PI /12.0f

  if(keyPressed)
  {
    if(key == '1')
    {
      for (int i = 0; i < 12; i++)
      {
        fill(0, 255, 0);
        stroke(0, 255, 0);
        float x = midpoint + sin(theta) * radius;
        float y = midpoint - cos(theta)* radius;
        text(num, x, y);
        theta += TWO_PI / 12;
        num++;
      }
    }
    if(key == '2')
    { 
      while(num < 13)
      {
        fill(255, 0, 0);
        stroke(255, 0, 0);
        float x = midpoint + sin(theta) * radius;
        float y = midpoint + -cos(theta)* radius;
        text(num, x, y);
        theta += radians(360/12);
        num++;
      }
    }
   
  }
}

