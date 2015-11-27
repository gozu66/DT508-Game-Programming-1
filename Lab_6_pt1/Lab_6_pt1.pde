float midPoint;
void setup()
{
  size(500, 500);
  midPoint = width * 0.5f;
}

void draw()
{  
//  background(0);
//  fill(100);
  
  
//  float x = random(10, 100);
//  for(int i = 0; i <= width; i += x)
//  {
//    line(width/2, height/2, i, height);
//    line(width/2, height/2, i, 0);
//    line(width/2, height/2, 0, i);
//    line(width/2, height/2, width, i);
//  }
  
  
//  float r = 255;
//  for(int i = width; i > 0; i -= 10)
//  {
//    fill(r, 0, 0);
//    stroke(r, 0, 0);
//    ellipse(midPoint, midPoint, i, i);
//    r -= 5;
//  }

  
  float thetaInc = TWO_PI / 12.0f;
  float radius = (width / 2) - 10;
  float x, y;
  
  for(float theta = 0; theta <= TWO_PI; theta += thetaInc)
  {
    x = midPoint + sin(theta) * radius;
    y = midPoint - cos(theta) * radius;
    
    ellipse(x, y, 20, 20);
  }
  
}
