class Ship
{
  float x, y, sWidth = 75, sHeight = 60;
  PVector pos = new PVector();
  float theta, speed = 20;
  PVector forward;
  

  Ship(float _x, float _y)
  {
    pos.x = _x;
    pos.y = _y;
    forward = new PVector(0, -1);
  }

  void update()
  {
    forward.x = sin(theta) * speed;
    forward.y = -cos(theta) * speed; 
    
    if (keyPressed)
    {
      if (keyCode == UP)
      {
        //Must call method here, cannot say : pos += forward;
        pos.add(forward);  
      } 
      else if (keyCode == DOWN)
      {
        pos.sub(forward);
      }
      else if(keyCode == LEFT)
      {
        theta -= 0.08f;
      }
      else if(keyCode == RIGHT)
      {
        theta += 0.08f;
      }
    }
  }

  void render()
  {
    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(theta);
    
    beginShape();
    vertex(0, 0);
    vertex(0 - sWidth / 2, 0 + sHeight / 2);
    vertex(0, 0 - sHeight / 2);
    vertex(0 + sWidth / 2, 0 + sHeight / 2);
    vertex(0, 0);
    endShape();
    
    popMatrix();
  }
}

