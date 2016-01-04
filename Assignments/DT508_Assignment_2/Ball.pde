class Ball 
{
  float fullSpeed = 10, bRadius = 10;
  PVector bPos, bSpeed; 
  
  Ball()
  {
    bPos = new PVector(width/2, height/2);
//    bPos = new PVector(paddle.pX - (paddle.pWidth / 2), paddle.pY);
    bSpeed = new PVector(0, 0);
    float speedSplit = random(-fullSpeed, fullSpeed);
    bSpeed.y = -speedSplit;
    bSpeed.x = (speedSplit > 0) ? fullSpeed - speedSplit : fullSpeed - abs(speedSplit);
  }
  
  void bDraw()
  {
    rect(bPos.x, bPos.y, bRadius*2, bRadius*2);
  }
  
  void bUpdate()
  {
    bPos.add(bSpeed);
    
    if(bPos.y <= (bRadius / 4) || bPos.y >= height - (bRadius * 2))
    {
      bSpeed.y = -bSpeed.y;
    }  
    else if(bPos.x <= (bRadius / 4) || bPos.x >= width - (bRadius * 2))
    {
      bSpeed.x = -bSpeed.x;
    } 
    
    bDraw();
  }
}
