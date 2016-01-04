class Ball 
{
  float fullSpeed = 10, bRadius = 10;
  PVector bPos, bSpeed; 
  
  Ball()
  {
    startBall();
  }
  
  void startBall()
  {
    bPos = new PVector(width/2, height/2);
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
        println(abs(bSpeed.x) + abs(bSpeed.y));

    
    bPos.add(bSpeed);
    
    if(bPos.y <= bRadius)
    {
      bSpeed.y *= -1;
    }  
    else if(bPos.x <= bRadius || bPos.x >= width - bRadius)
    {
      bSpeed.x *= -1;
    }     
    else if(bPos.y > paddle.pY - (bRadius + (paddle.pHeight * 0.5f)) && bPos.y < paddle.pY + (bRadius - (paddle.pHeight * 0.5f)))
    {
      if((bPos.x - bRadius) < (paddle.pX + paddle.pWidth / 2) && (bPos.x + bRadius) >= (paddle.pX - paddle.pWidth / 2))
      {       
        bSpeed = paddleReflect();
        bSpeed.y *= -1;
      }
    }
    
    if(bPos.y > height + 100)
    {
      startBall();
    }
    
    bDraw();
  }
  
  PVector paddleReflect()
  {
    float newX, newY;     
    float distance = bPos.x - paddle.pX;
    newX = distance / 15;
    newY = fullSpeed - abs(newX);    
    
    PVector newBSpeed = new PVector(newX, newY);
    return(newBSpeed);
  }
}
