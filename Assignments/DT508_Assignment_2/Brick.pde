class Brick
{
  float brX, brY, brWidth = 50, brHeight = 50;
  PVector brPos = new PVector(0, 0);
  
  Brick()
  {
    brPos.x = random(width);
    brPos.y = random(height);
  }
  
  void brUpdate()
  {
    brDraw();
  }
  
  void brDraw()
  {
    rect(brPos.x, brPos.y, brWidth, brHeight);
  }
}
