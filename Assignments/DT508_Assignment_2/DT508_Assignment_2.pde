import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

PImage currentBackground;
PFont myFont;

int _state = 0;    //_state = 0 MENU --- _state = 1 GAME1 --- _state == 2 GAME2 --- _state == 3 GAME3 --- _state == 4 GAME OVER --- _state == 5 GAME COMPLETE --- _State == 6 LEVEL TRANSITION
boolean setupComplete;

Minim minim;
AudioPlayer paddleHit, brickHit, wallHit, lifeLost, powerUpHit, music;

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
  powerUpHit = minim.loadFile("powerUpHit1.wav");

  brickHit.setGain(-15);
  paddleHit.setGain(-10);
  wallHit.setGain(100);
  powerUpHit.setGain(-5);
  
  music.play();
  music.loop();

  audioVisualizerSetup();

  myFont = createFont("ka1.ttf", 40);
  
  background(0);
}

void draw()
{
  if (keyPressed)
  {
    getKeys();
  }
  
  if(millis() > 500)
  {
    drawBackground();
  }
  audioVisualizerDraw();

  switch(_state)
  {
  case 0:

    rectMode(CENTER);
    textFont(myFont);
    textSize(60);
    textAlign(CENTER);
    fill(0,200,70);
    text("BREAKOUT 2016", width/2, height/3);
    textSize(30);
    textAlign(RIGHT);
    text("Start Game", width/2 - 50, height/2);
    textAlign(LEFT);
    text("High Scores", width/2 + 50, height/2);

    break;

  case 1:

    displayData();
    paddle.pUpdate();
    ball.bUpdate();  
    ball.bDraw(); 
    pUp.PUUpdate();
    
    for (int i = 0; i < bricks.length; i++)
    {
      bricks[i].brUpdate();
    }   
    
    if (hits >= numOfBricks)
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
    pUp.PUUpdate();

    for (int i = 0; i < bricks.length; i++)
    {
      bricks[i].brUpdate();
    }   
    if (hits >= numOfBricks)
    {
      _state = 6;
    }

    break;

  case 3:

    displayData();
    paddle.pUpdate();
    ball.bUpdate();  
    ball.bDraw(); 
    pUp.PUUpdate();

    for (int i = 0; i < bricks.length; i++)
    {
      bricks[i].brUpdate();
    }   
    if (hits >= numOfBricks)
    {
      _state = 5;
    }

    break;

  case 4:

    textSize(50);
    textAlign(CENTER);
    fill(0, 200, 70);
    text("GAME OVER", width/2, height*0.25f);
    textSize(20);
    text("Click to Continue", width/2, height*0.75f);

    break;

  case 5:

    highScoreList();
    textSize(20);
    fill(0, 200, 70);
    text("Click to Continue", width/2, height*0.9f);

    break;

  case 6:
    displayData();

    textAlign(CENTER);
    fill(0, 200, 70);
    text("Stage Complete", width/2, height/3);
    text("Click to Continue", width/2, height*0.5f);

    break;
  }

  println(frameRate);
}
