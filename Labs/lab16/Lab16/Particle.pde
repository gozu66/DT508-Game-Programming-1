class Particle
{
  float x, y;
  float r, g, b, a;
  float _width = 10, _height = 10;
  float rnd;
  
  Particle()
  {
    rnd = random(100, 400);
    
    x = mouseX + random(-2, 3);
    y = mouseY + random(-2, 3);
        
    r = 40;
    g = 40;
    b = 0;
    a = 255;
  }
  
  void render()
  {
    fill(r,g,b,a);
    ellipse(x,y, _width, _height);
    
    if(_width <= rnd &&  frameCount % 2 == 0)
    {
      _width++;
      _height++;
    
    
    if(b < 200)
    {
      b += 5;
    }
    else if(r < 255)
    {
      r += 5;
    }
    }
    if(_width <= 1)
    {
      nathan.remove(this);
    }

    if(r > 250)
    {
      _width--;
      _height--;
    } 
  }
}