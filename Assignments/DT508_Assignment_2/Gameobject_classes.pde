class Brick                                          //BRICK CLASS
{
  float brX, brY, brWidth = 30, brHeight = 30;
  PVector brPos = new PVector(0, 0);
  
  Brick()
  {
    brPos.x = -100;
    brPos.y = -100;
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




class Paddle                                        //PADDLE CLASS
{
  Paddle()
  {
    pWidth = 100;
    pHeight = height / 50;
    pSpeed = 4.0f;
    pX = (width / 2) - (pWidth / 2);
    pY = height - pHeight * 4;
  }
  
  float pWidth, pHeight, pSpeed, pX, pY;
 
  void pUpdate()
  {   
    pX = mouseX;
    pDraw();
  }
 
  void pDraw()
  {
    rect(pX, pY, pWidth, pHeight);
  }
}




class Ball                                               //BALL CLASS
{
  float fullSpeed = 7, bRadius = 10;
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
        scoreMultiplier = 1;
      }
    }
    
    if(bPos.y > height + 100)
    {
      startBall();
      updateLives(-1);
      scoreMultiplier = 1;
    }
    
    for(int i = 0; i < bricks.length; i++)
    {
      float myX, myY;
      myX = abs(bricks[i].brPos.x - bPos.x) - bRadius;
      myY = abs(bricks[i].brPos.y - bPos.y) - bRadius;
      
      if(myX <= bricks[i].brWidth / 2)
      {
        if(myY < bricks[i].brHeight / 2)
        {
          updateScore(1);
          
          float xDist = bricks[i].brPos.x - bPos.x;
          float yDist = bricks[i].brPos.y - bPos.y;
          
          if(abs(xDist) > abs(yDist))
          {
            bSpeed.x *= -1;
          }else{
            bSpeed.y *= -1;
          }
          
          bricks[i].brPos = new PVector(-50, -50);
        }
      }
    }    
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
