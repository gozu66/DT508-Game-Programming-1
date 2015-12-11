import ddf.minim.*;

Minim minim;
AudioPlayer _zap;
AudioPlayer _blip;

int speed = 3;
float playerX = 50, playerY;

float bugX = 50, bugY = 50;
float bugX_P = 50, bugY_P = 50;
int bugWidth = 30, bugHeight = 35;

int score;
int playerWidth = 40, playerHeight = 20;
float halfWidth;
float halfHeight;

float bugXMoveMinMax = 100, bugYMoveMin = 10, bugYMoveMax = 30;

int frame = 60;
float timer = 0;

boolean gameOver, startScreen, shootPressed, exploding;


void setup()
{
  size(500, 500);
  
  minim = new Minim(this);
  _zap = minim.loadFile("zap.wav");
  _blip = minim.loadFile("blip.wav");
  
  playerY = height - playerHeight;
  
  halfWidth = playerWidth / 2;
  halfHeight = playerHeight / 2;
  
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
    textAlign(LEFT);    
    text("Score: " +score, 20, 20); 
  }
  
  if(gameOver)
  {
    GameOver();
  }
  
  if(exploding)
  {
    timer += 0.1f;
    drawExplosion(bugX_P, bugY_P);
    if(timer >= 1)
    {
      exploding = false;
      timer = 0;
    }
  }
}

void StartScreen()
{
  textSize(40);
  textAlign(CENTER);
  fill(random(0,255),random(0,255),random(0,255));
  text("BUG ZAPPER", width/2, height/2);
  fill(255);
  textSize(20);
  text("Click Anywhere to Play", width/2, height * 0.75f);
  
  if(mousePressed)
  {
    startScreen = false;
  }
}

void GameOver()
{
  textSize(25);
  textAlign(CENTER);
  fill(125);
  text("GAME OVER", width/2, height/5);
  text("You Scored " + score, width/2, height/4);
  textSize(40);
  fill(random(0,255),random(0,255),random(0,255)); 
  text("BUG ZAPPER", width/2, height/2);
  fill(125);
  textSize(20);
  text("Click Anywhere to Try Again!", width/2, height * 0.75f);
  
  if(mousePressed)
  {
    gameOver = false;
    positionBug();
    frame = 60;
    frameCount = 0;
    score = 0;
  }
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
    
    _blip = minim.loadFile("blip.wav");
    _blip.play();
    
    //bugMoveTimerLimit = random(bugMoveTimerMin, bugMoveTimerMax);
    
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
  if(bugY >= playerY - bugHeight/2)
  {
    gameOver = true;
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
      shootPressed = true;
    } else {
      shootPressed = false;
    } } else {
      shootPressed = false;
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
  
  if(shootPressed)
  {
    _zap.play();
    shootPressed = true;
  }else{
    _zap.pause();
  }
  
  if(playerX-bugX < bugWidth/2 && playerX-bugX > -(bugWidth/2))
  {
    score++;
    bugX_P = bugX;
    bugY_P = bugY;
    positionBug();
    frame = 60;
    exploding = true;
  }
}

void positionBug()
{
  bugX = random(halfWidth, width-halfWidth);
  bugY = random(halfHeight, (height * 0.7f)-halfHeight);
}

void drawExplosion(float x, float y)
{
  stroke(0,255,50);
  line(x, y, x+20, y);
  line(x, y, x-20, y);
  line(x, y, x, y+20);
  line(x, y, x, y-20);
  line(x, y, x+10, y+10);
  line(x, y, x-10, y-10);
  line(x, y, x+10, y-10);
  line(x, y, x-10, y+10);
}
