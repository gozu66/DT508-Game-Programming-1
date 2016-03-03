class Ship extends GameObject
{
  float shipHeigth = 30, shipWidth = 20;
  //PVector forward = new PVector(0, -1);
    
  Ship()
  {
    super();
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);   
    
    if(keys[UP] || keys['W'])
    {
      pos.add(forward);
    }
    if(keys[DOWN] || keys['S'])
    {
      pos.sub(forward);
    }
    if(keys[LEFT] || keys['A'])
    {
      theta += 0.1f;
    }
    if(keys[RIGHT] || keys['D'])
    {
      theta -= 0.1f;
    }    
    if(keys[' '])
    {
      shoot();
    }
    if(pos.x > width + 5)
    {
      pos.x = 0;
    }
    else if (pos.x < 0 - 5)
    {
      pos.x = width;
    }
    
    if(pos.y < 0 - 5)
    {
      pos.y = height;
    }
    else if(pos.y > height + 5)
    {
      pos.y = 0;
    }
  }
  
  void render()
  {
    fill(25, 150, 25);
    pushMatrix();
    beginShape();
    translate(pos.x, pos.y);
    rotate(theta);
    vertex(0, 0);
    vertex(0 - shipWidth * 0.5f, 0 + shipHeigth * 0.5f);
    vertex(0, 0 - shipHeigth * 0.5f);
    vertex(0 + shipWidth * 0.5f, 0 + shipHeigth * 0.5f);
    vertex(0, 0);
    endShape();
    popMatrix();
  }
  
  void shoot()
  {
    Bullet newB = new Bullet(pos.x, pos.y, theta);
    _bullets.add(newB);
  }
}