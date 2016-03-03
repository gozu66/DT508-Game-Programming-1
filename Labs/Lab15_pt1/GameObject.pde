class GameObject
{
  PVector pos, forward;
  float theta, w, halfW, speed = 5.0f;
  color c;
  
  GameObject(float x, float y)
  {
    pos = new PVector(x, y);
    theta = 0;
    forward = new PVector(0, -1);
  }
  
  GameObject()
  {
    this(width / 2, height / 2);
  }
  
  public void update()
  {
    
  }
  
  public void render()
  {
    
  }
}