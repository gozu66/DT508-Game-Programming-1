import ddf.minim.*;

Minim minim;
AudioPlayer _zap;
AudioPlayer _blip;

int speed = 3;
float playerX = 50, playerY;

float bugX = 50, bugY = 50;
int bugWidth = 30, bugHeight = 35;

int score;
int playerWidth = 40, playerHeight = 20;
float halfWidth;
float halfHeight;

float bugMoveTimer, bugMoveTimerLimit;
float bugXMoveMinMax = 100, bugYMoveMin = 10, bugYMoveMax = 30;
float bugMoveTimerMin = 1, bugMoveTimerMax = 4; 

int frame = 60;

boolean gameOver, startScreen;

void setup()
{
  size(500, 500);
  
  minim = new Minim(this);
  _zap = minim.loadFile("zap.wav");
  _blip = minim.loadFile("blip.wav");
  
  playerY = height - playerHeight;
  
  halfWidth = playerWidth / 2;
  halfHeight = playerHeight / 2;
  
  bugMoveTimerLimit = random(bugMoveTimerMin, bugMoveTimerMax);
  
  positionBug();
  
  startScreen = true;
}

void draw()
{
  background(0);
  
  if(startScreen)
  {
    StartScreen();
  }
  
  if(!gameOver && !startScreen)
  {  
    drawPlayer();
    drawBug();
    moveBug();
    lookForClicks();
    text("Score: " +score, 20, 20); 
  }
  
  if(gameOver)
  {
    
  }
}

void StartScreen()
{
  textSize(30);
  textAlign(CENTER);
  fill(random(0,255),random(0,255),random(0,255));
  text("BUG ZAPPER", width/2, height/2);
  fill(255);
  text("Click Anywhere to Play", width/2, height * 0.75f);
}

void drawPlayer()
{ 
  stroke(0,255,0);
  line(playerX - halfWidth, playerY + halfHeight, playerX + halfWidth, playerY + halfHeight);
  line(playerX - halfWidth, playerY + halfHeight, playerX - halfWidth, playerY);
  line(playerX - halfWidth, playerY, playerX - playerWidth * 0.25f, playerY - halfHeight);
  line(playerX - playerWidth * 0.25f, playerY - halfHeight, playerX + (playerWidth * 0.25f), playerY - halfHeight);
  line(playerX + (playerWidth * 0.25f), playerY - halfHeight, playerX + halfWidth, playerY);
  line(playerX + halfWidth, playerY, playerX + halfWidth, playerY + halfHeight);
}

void drawBug()
{
  float bugHalfWidth = bugWidth/2;
  float bugHalfHeight = bugHeight/2;
  
  stroke(255,0,0);
  line(bugX - bugHalfWidth, bugY + bugHalfHeight, bugX + bugHalfWidth, bugY + bugHalfHeight);
  line(bugX + bugHalfWidth, bugY + bugHalfHeight, bugX, bugY - halfHeight);
  line(bugX, bugY - halfHeight, bugX - bugHalfWidth, bugY + bugHalfHeight);
  line(bugX - (bugHalfWidth * 0.5f), bugY + bugHalfHeight, bugX - (bugHalfWidth * 0.5f), bugY + bugHeight); 
  line(bugX + (bugHalfWidth * 0.5f), bugY + bugHalfHeight, bugX + (bugHalfWidth * 0.5f), bugY + bugHeight); 
}

void moveBug()
{
  if(frameCount % frame == 0)
  {
    bugX += random(-bugXMoveMinMax, bugXMoveMinMax);
    bugY += random(bugYMoveMin, bugYMoveMax);
    
    _blip.play();
    
    bugMoveTimerLimit = random(bugMoveTimerMin, bugMoveTimerMax);
    
    if(bugX - bugWidth/2 < 0)
    {
      bugX = bugWidth / 2;
    }
    if(bugX > width-(bugWidth/2))
    {
      bugX = width-(bugWidth/2);
    }
    
    frame--;
  }
}

void lookForClicks()
{
  if(keyPressed)                                    
  {
    if(keyCode == LEFT && playerX > halfWidth)
    {
      movePlayer(-speed);
    }
    if(keyCode == RIGHT && playerX < (width-halfWidth))                                //Player Move Inputs
    {
      movePlayer(speed);
    }
  }
  
  if(keyPressed)  
  {                                
    if(key == ' ')    
    {
      shoot();
    }
  }
}


void movePlayer(int direction)
{
    playerX += direction;
}

void shoot()
{
  stroke(255);
  line(playerX, playerY - (playerHeight/2), playerX, playerY - height);        // Player Shoot Input
  
  _zap.play();
  
  if(playerX-bugX < bugWidth/2 && playerX-bugX > -(bugWidth/2))
  {
    score++;
    drawExplosion(bugX, bugY);
    positionBug();
    frame = 60;
  }
}

void positionBug()
{
  bugX = random(halfWidth, width-halfWidth);
  bugY = random(halfHeight, (height * 0.7f)-halfHeight);
}

void drawExplosion(float x, float y)
{
  line(x, y, x+5, y);
  line(x, y, x-5, y);
  line(x, y, x, y+5);
  line(x, y, x, y-5);
}
