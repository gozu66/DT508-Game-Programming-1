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
PFont myFont;

int _state = 0;    //_state = 0 MENU --- _state = 1 GAME1 --- _state == 2 GAME2 --- _state == 3 GAME3 --- _state == 4 GAME OVER --- _state == 5 GAME COMPLETE --- _State == 6 LEVEL TRANSITION

void setup()
{
  size(700, 700);
  smooth();
  rectMode(CENTER);
  frameRate(100);
  
  myFont = createFont("ka1.ttf", 40);
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
    
      rectMode(CENTER);
      textFont(myFont);
      textSize(60);
      textAlign(CENTER);
      text("BREAKOUT 2015", width/2, height/3);
      textSize(30);
      textAlign(RIGHT);
      text("Start Game", width/2 - 50, height/2);
      textAlign(LEFT);
      text("Face Mode", width/2 + 50, height/2);
      
      break;
    
    case 1:
    
      displayData();
      paddle.pUpdate();
      ball.bUpdate();  
      ball.bDraw(); 
      for(int i = 0; i < bricks.length; i++)
      {
        bricks[i].brUpdate();
      }   
      if(hits >= numOfBricks)
      {
        _state = 6;
        assembleLevel(_state);
      }
      
      break;
      
    case 2:
    
      displayData();
      paddle.pUpdate();
      ball.bUpdate();  
      ball.bDraw(); 
      for(int i = 0; i < bricks.length; i++)
      {
        bricks[i].brUpdate();
      }   
      if(hits >= numOfBricks)
      {
        _state = 6;
      }

      break;
      
    case 3:
    
      displayData();
      paddle.pUpdate();
      ball.bUpdate();  
      ball.bDraw(); 
      for(int i = 0; i < bricks.length; i++)
      {
        bricks[i].brUpdate();
      }   
      if(hits >= numOfBricks)
      {
        _state = 5;
      }
      
      break;
      
    case 4:
        
      textSize(70);
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2);
      
      break;
      
    case 5:
      break;
      
    case 6:
      displayData();

      textAlign(CENTER);
      fill(0,255,0);
      text("Stage Complete", width/2, height/3);
      text("Press Space to Continue", width/2, height*0.5f);
       
      break;
    
    
  }

//  println(frameRate);
//  println(hits);
//  println(numOfBricks);
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


//int brickRows, brickCols;
//void arrangeBlocks()
//{
//  for(int brickRows = 0; brickRows < 4; brickRows++)
//  {
//    for(int brickCols = 0; brickCols < 4; brickCols++)
//    {
//      
//    } 
//  }
//}
