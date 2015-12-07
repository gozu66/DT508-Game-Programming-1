float[] playerX = new float[2];
float[] playerY = new float[2];

float playerHeight = 100;
float playerWidth = 20;

boolean isPaused = true;

float ballSize = 20;
float ballX, ballY;
float ballSpeedX, ballSpeedY;

int[] score = new int[2];

float gap = 50;

void setup()
{
  size(700, 500);
  noStroke();
  frameRate(100);

  playerY[0] = playerY[1] = (height / 2) - (playerHeight / 2);
 
  playerX[0] = gap - playerWidth;
  playerX[1] = (width - gap) - playerWidth; 
  
  ballX = (width/2) - (ballSize / 2);
  ballY = (height/2) - (ballSize / 2);
  
  int i = (int) random(0, 2);
  if(i == 0)
  {
    ballSpeedX = -1;
  }
  else
  {
    ballSpeedX = 1;
  }
  
  ballSpeedY = random(-5, 5);
}

void draw()
{
  background(0);
  drawPlayers();
  updatePlayers();
  drawBall();
  updateBall();
}

void drawPlayers()
{
  for(int i = 0; i < playerX.length; i++)
  {
     rect(playerX[i], playerY[i], playerWidth, playerHeight);
  }
}

void updatePlayers()
{
  if(keyPressed)
  {
    if(key == 'w')
    {
      playerY[0] -= 5;
    }
    if(key == 's')
    {
      playerY[0] += 5;
    }
  }  
}

void drawBall()
{
  rect(ballX, ballY, ballSize, ballSize);  
}

void updateBall()
{
  ballX += ballSpeedX;
  ballY += ballSpeedY;    
  
  if(ballY <= 0 || ballY >= (height - ballSize))
  {
    ballSpeedY *= -1;
  }
  
  if(ballX < (playerX[0] + playerWidth) && ballY + ballSize > playerY[0] && ballY < playerY[0] + playerHeight +ballSize)
  {
    ballSpeedX *= -1.1f;
    ballSpeedY *= -1.1f;
  }
  
  if(ballX > (playerX[1] - playerWidth) && ballY + ballSize > playerY[1] && ballY < playerY[1] + playerHeight +ballSize)
  {
    ballSpeedX *= -1.1f;
    ballSpeedY *= -1.1f;
  }
}
