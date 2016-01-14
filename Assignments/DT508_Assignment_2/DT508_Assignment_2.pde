import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;



Paddle paddle;
Ball ball;
Brick[] bricks;

PImage currentBackground;

int _state = 0;    //  _state = 0 MENU --- _state = 1 GAME ---

void setup()
{
  size(700, 700);
  smooth();
  rectMode(CENTER);
  frameRate(100);
}

void gameStart()
{
  paddle = new Paddle();
  ball= new Ball();
  bricks = new Brick[100];
  for(int i = 0; i < bricks.length; i++)
  {
    bricks[i] = new Brick();
  }
}

void draw()
{
  if (keyPressed)
  {
    getKeys();
  }
  
  drawBackground();
  
  switch(_state)
  {
    case 0:
      textSize(70);
      textAlign(CENTER);
      text("START GAME", width/2, height/2);
      break;
    
    case 1:
      paddle.pUpdate();
      ball.bUpdate();
          
      for(int i = 0; i < bricks.length; i++)
      {
        bricks[i].brUpdate();
      }
      break;
  }

  println(frameRate);
}

boolean isDrawn;
void drawBackground()
{
  if (!isDrawn)
  {
    loadPixels();
    for (int x = 0; x < width; x++)
    {
      for (int y = 0; y < height; y++)
      {
        int loc = x + (y * width);
        color c  = color(x/5, 0, y/5);
        pixels[loc] = c;
      }
    }
    updatePixels();

    currentBackground = createImage(width, height, RGB);
    currentBackground.loadPixels();
    
    for (int x = 0; x < width; x++)
    {
      for (int y = 0; y < height; y++)
      {
        int loc = x + (y * width);
        currentBackground.pixels[loc] = pixels[loc];
      }
    }

    isDrawn = true;
  } 
  else
  {
    image(currentBackground, 0, 0, width, height);
  }
}


int brickRows, brickCols;
void arrangeBlocks()
{
  for(int brickRows = 0; brickRows < 4; brickRows++)
  {
    for(int brickCols = 0; brickCols < 4; brickCols++)
    {
      
    } 
  }
}
