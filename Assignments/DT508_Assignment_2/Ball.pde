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
    bPos.add(bSpeed);
//    bPos = new PVector(mouseX, mouseY);
    
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
        bSpeed = reflect(paddle.pX, 10);
        bSpeed.y *= -1;
      }
    }
    
    if(bPos.y > height + 100)
    {
      startBall();
    }
    
    for(int i = 0; i < bricks.length; i++)
    {
//      if(bPos.y > bricks[i].brPos.y - (bRadius + (bricks[i].brHeight * 0.5f)) && bPos.y < bricks[i].brPos.y + (bRadius - (bricks[i].brHeight * 0.5f)))
//      {
//        if((bPos.x - bRadius) <= (bricks[i].brPos.x + bricks[i].brWidth) && (bPos.x + bRadius) >= (bricks[i].brPos.x - bricks[i].brWidth))
//        {
//          bSpeed.y *= -1;
//          bSpeed.x *= -1;
//            PVector ballPosiitonNow
//            ball.bSpeed = bricks[i].brPos.sub(bPos);
//            bPos = bSpeed.sub(bricks[i].brPos);
//            bricks[i].brPos.sub(bSpeed);
//            bSpeed.sub(bricks[i].brPos);
//        }
//        }
      float myX, myY;
      myX = abs(bricks[i].brPos.x - bPos.x) - bRadius;
      myY = abs(bricks[i].brPos.y - bPos.y) - bRadius;
      
      if(myX < bricks[i].brWidth / 2)
      {
        if(myY < bricks[i].brHeight / 2)
        {
//          bSpeed.x *= -1;
//          bSpeed.y *= -1;
        }
      }
      
//      if(myY < bricks[i].brHeight / 2)
//      {
//        if(myX < bricks[i].brWidth / 2)
//        {
//          bSpeed.y *= -1;
//          break;
//        }
//      }
      
      println("x : " + myX + " y : " + myY);
    }
    
    bDraw();
  }
  
  PVector reflect(float checkPoint, float divisor)
  {
    float newX, newY;     
    float distance = bPos.x - checkPoint;
    newX = distance / divisor;
    newY = fullSpeed - abs(newX);    
    
    PVector newBSpeed = new PVector(newX, newY);
    return(newBSpeed);
  }
}
