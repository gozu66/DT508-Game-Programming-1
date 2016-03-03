Ship ship;
ArrayList<Bullet> _bullets = new ArrayList<Bullet>(); 
boolean[] keys = new boolean[512];

void setup()
{
  size(500, 500);
  ship = new Ship();
}

void draw()
{
  background(255);
  ship.render();
  ship.update();
  
  //int i = 0;
  //for(Bullet b : _bullets)
  //{
  //  println(_bullets.size()); 
  //  i++;
  //}
  
  for(int i = 0; i < _bullets.size(); i++)
  {
    //_bullets.get(i).update();
    //    _bullets.get(i).render();
    Bullet b = _bullets.get(i);
    b.update();
    b.render();

    //if(b.pos.x > width || b.pos.x < 0 || b.pos.y > height || b.pos.y < 0)
    //{
    // //_bullets.remove(_bullets.get(i));
    // //_bullets.remove(
    //}
    
  }
  
  //println(_bullets.size());
}

void keyPressed()
{
  keys[keyCode] = true;
}
void keyReleased()
{
  keys[keyCode] = false;
}