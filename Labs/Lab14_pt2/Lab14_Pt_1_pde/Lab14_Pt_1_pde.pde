StarfleetBadge sfb;

void setup()
{
  size(500, 500);
  noFill();
  stroke(0, 255, 0);
  sfb = new StarfleetBadge();
}

void draw()
{
  background(0);
  sfb.render();
  sfb.update();
}

class StarfleetBadge
{
  float sWidth = 75, sHeight = 60;
  PVector pos = new PVector();
  float theta = 1, speed = 20;
  PVector forward = new PVector();
  
  StarfleetBadge()
  {
    pos.x = 20;
    pos.y = 20;
    
    forward = new PVector(0, 1);
    //theta = forward;
  }
  
  void update()
  {    
    //forward.x = sin(theta) * speed;
    //forward.y = -cos(theta) * speed; 
    
    if(keyPressed)
    {
      if(keyCode == LEFT)
      {
        //theta += 0.1;
      }
      else if(keyCode == RIGHT)
      {
        //theta -= 0.1;
      }
      else if(keyCode == UP)
      {
        pos.add(forward);
      }
      else if (keyCode == DOWN)
      {
        pos.sub(forward);
      }
    }    
  }
  
  void render()
  {
    pushMatrix();
    
    translate(pos.x, pos.y);
    //rotate(theta);
    
    beginShape();    
    vertex(0, 0);
    vertex(-sWidth * 0.5f, sHeight * 0.5f);
    vertex(0, -sHeight * 0.5f);
    vertex(sWidth * 0.5f, sHeight * 0.5f);
    vertex(0, 0);
    endShape();
    
    popMatrix();
  }
}

class PointyCircle
{
  
  PointyCircle()
  {
    
  }
}