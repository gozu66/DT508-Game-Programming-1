class Particle
{
  float x, y;
  float r, g, b, a;
  float _width = 10, _height = 10;
  float rnd, rnd1, rnd2, rnd3;
  
  Particle()
  {
    rnd = random(0, 40);
    
    rnd1 = random(0, 1);
    rnd2 = random(0, 1);
    rnd3 = random(0, 1);
    
    x = mouseX + random(-2, 3);
    y = mouseY + random(-2, 3);
        
    r = 40;
    g = 40;
    b = 0;
    a = 255;
  }
  
  //float theta = 0, radius = 12; 
  
  void update()
  {
    if(a <= 0)
    {
      nathan.remove(this);
    }
    
    if(_width <= rnd &&  frameCount % 2 == 0)
    {
      _width++;
      _height++;
    }
    
    if(b < 200)
    {
      b += 1;
    }
    else if(r < 255)
    {
      r += 1;
    }
    
    if(r > 250)
    {
      a--;
    } 
  }
  
  void render()
  {
    fill(r,g,b,a);
    ellipse(x,y, _width, _height);
  }
}