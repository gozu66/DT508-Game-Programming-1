class Ball 
{
  float xSpeed, ySpeed, bRadius = 10;
  PVector bPos; 
  
  Ball()
  {
    bPos = new PVector(paddle.pX, paddle.pY);
  }
  
  void bDraw()
  {
    ellipse(width/2, bPos.y, bRadius*2, bRadius*2);
  }
}
