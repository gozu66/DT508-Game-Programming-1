class Brick
{
  float brX, brY, brWidth = 30, brHeight = 30;
  PVector brPos = new PVector(0, 0);
  
  Brick()
  {
    brPos.x = random(width);
    brPos.y = random(50, height - 300);
    
    
  }
  
  void brUpdate()
  {
    brDraw();
  }
  
  void brDraw()
  {
    rect(brPos.x, brPos.y, brWidth, brHeight);
  }
  
  void arrange(int number, int type)
  {
    
  }
}
