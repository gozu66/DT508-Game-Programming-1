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
    noStroke();
    fill(85, 0, 85, 75);    
    rect(brPos.x, brPos.y, brWidth, brHeight);
  }
}




class Paddle                                        //PADDLE CLASS
{  
  float pWidth, pHeight, pSpeed;
  PVector pPos = new PVector(0, 0);

  Paddle()
  {
    pWidth = 100;
    pHeight = height / 50;
    pSpeed = 4.0f;
    pPos.x = (width / 2) - (pWidth / 2);
    pPos.y = height - pHeight * 4;
  }
  
  void pUpdate()
  {   
    pPos.x = mouseX;
    pDraw();
  }
 
  void pDraw()
  {
    noStroke();
    fill(85, 0, 85, 200);
    rect(pPos.x, pPos.y, pWidth, pHeight);
  }
}

class Ball                                               //BALL CLASS
{
  float fullSpeed = 10, bRadius = 10;
  PVector bPos, bSpeed; 
  boolean isReady;
  
  Ball()
  {
    startBall();
  }
  
  void startBall()
  {
    bPos = new PVector(paddle.pPos.x, paddle.pPos.y - 20);
    bSpeed = new PVector(0, 0);
    isReady = true;
  }
  
  void shootBall()
  {
    isReady = false;
    float speedSplit = random(-fullSpeed / 2, fullSpeed / 2);
    bSpeed.x = speedSplit;
    bSpeed.y = (speedSplit > 0) ? fullSpeed - speedSplit : fullSpeed - abs(speedSplit);
  }
  
  void bDraw()
  {
    fill(0, 200, 70, 175);
    ellipse(bPos.x, bPos.y, bRadius*2, bRadius*2);
  }
  
  void bUpdate()
  {
    if(isReady)
    {
      bPos = new PVector(paddle.pPos.x, paddle.pPos.y - 20);
    }
    
    bPos.add(bSpeed);
    
    if(bPos.y <= bRadius)
    {
      bSpeed.y *= -1;
      wallHit.play();
      wallHit.rewind();
    }
    else if(bPos.x <= bRadius || bPos.x >= width - bRadius)
    {
      if(!isReady)
      {
        bSpeed.x *= -1;
        wallHit.play();
        wallHit.rewind();
      }
    }     
    else if(bPos.y > paddle.pPos.y - (bRadius + (paddle.pHeight * 0.5f)) && bPos.y < paddle.pPos.y + (bRadius - (paddle.pHeight * 0.5f)))
    {
      if((bPos.x - bRadius) < (paddle.pPos.x + paddle.pWidth / 2) && (bPos.x + bRadius) >= (paddle.pPos.x - paddle.pWidth / 2))
      {       
        bSpeed = reflect(paddle.pPos.x, 10);
        bSpeed.y *= -1;
        scoreMultiplier = 1;
        paddleHit.play();
        paddleHit.rewind();
      }
    }
    
    if(bPos.y > height + 100)
    {
      startBall();
      updateLives(-1);
      scoreMultiplier = 1;
      lifeLost.play();
      lifeLost.rewind();
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
          updateScore(10, bricks[i].brPos);
          brickHit.play();
          brickHit.rewind();
          
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



class PowerUp                        //POWER UP CLASS
{
  PVector PUPos = new PVector(0,0);
  float PUSpeed; 
  color PUcol;
  float PUWidth = 20;
  
  PowerUp()
  {
    PUPos.x = random(25, width - 25);
    PUPos.y = -10;
    PUSpeed = rndSpeed();
  }
  
  void PUUpdate()
  {
    PUPos.y += PUSpeed;
    PUDraw();
    
    if (PUPos.dist(ball.bPos) < 50 || PUPos.dist(paddle.pPos) < 50)
    {
      updateScorePU(50);
      powerUpHit.play();
      powerUpHit.rewind();
      PUPos.x = random(25, width - 25);
      PUPos.y = -400;
      PUSpeed = rndSpeed();
      println("hhh");
    }

    if(PUPos.y > height + 50)
    {
      PUPos.x = random(25, width - 25);
      PUPos.y = random(-500);
      PUSpeed = rndSpeed();
    }
  }
  
  float rndSpeed()
  {
    return(random(3, 8));
  }
  
  void PUDraw()
  {
    fill(myGold);
    for(int i = 0; i < 5; i++)
    {
      int x = (int)random(50);
      int y = (int)random(50);
      rect(PUPos.x + x, PUPos.y + y, 5, 5); 
    }
  }
}
