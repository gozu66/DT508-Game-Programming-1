class Bullet extends GameObject
{
  Bullet(float x, float y, float theta)
  {
    super(x, y);
    this.theta = theta; 
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    pos.add(forward);
    
   if(pos.x > width ||pos.x < 0 || pos.y > height || pos.y < 0)
    {
     //_bullets.remove(_bullets.get(i));
     //_bullets.remove(
     _bullets.remove(this);
    }
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, 0, 0, 2);
    popMatrix();
  }
}