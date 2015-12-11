void setup()
{
  size(500, 500);
}

void draw()
{
  float midpoint = width/2;
      
      
  float i = 1;    
  for(int x = 1; x <= height; x += i)
  {
    line(0, midpoint + x, width, midpoint + x);
    i += i/2;
  }
}
