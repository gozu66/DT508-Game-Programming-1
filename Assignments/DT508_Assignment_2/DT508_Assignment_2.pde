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

Minim minim;
AudioPlayer paddleHit, brickHit, wallHit, lifeLost, music;

void setup()
{
  size(700, 700);
  smooth();
  rectMode(CENTER);
  frameRate(60);
  
  minim = new Minim(this);
  music = minim.loadFile("Vectorwolf - Street Justice.mp3");
  paddleHit = minim.loadFile("paddleHit1.wav");
  brickHit = minim.loadFile("brickHit1.wav");
  wallHit = minim.loadFile("wallHit1.wav");
  lifeLost = minim.loadFile("lifeLost1.wav");
  
  music.play();
  music.loop();
  
  audioVisualizerSetup();
  
  myFont = createFont("ka1.ttf", 40);
}

void draw()
{
  if (keyPressed)
  {
    getKeys();
  }
    
  drawBackground();
  
  audioVisualizerDraw();
  
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
    
      highScoreList();
      
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
}

boolean isDrawn, brickIsHit;
int step = 1, step2 = 1, step3 = 1;


void drawBackground()
{
  if (!isDrawn)
  {
    loadPixels();
    for (int x = 0; x < width; x++)
    {
      for (int y = 0; y < height; y++)
      {
        if(y % step == 0)
        {
          if(!brickIsHit)
          {
            int loc = x + (y * width);
            color c  = color(step3, 0, step2);
            pixels[loc] = c;
          }
          else
          {
            int loc = x + (y * width);
            color c  = color(255, 255, 255);
            pixels[loc] = c;           
          }
        }
      }
    }
    
    brickIsHit = false;
    
    if(frameCount % 2 == 0)
    {
      step3 = (int)audioOutput + 1;
      step2 = (int)audioOutput2 + 1;
    }
    step += 1;
    if(step % 15 == 0)
    {
      step = 1;
    }
    
    updatePixels();
  } 
}
