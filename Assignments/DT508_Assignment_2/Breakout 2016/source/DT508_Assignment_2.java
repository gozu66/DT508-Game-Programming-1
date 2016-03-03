import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.spi.*; 
import ddf.minim.signals.*; 
import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.ugens.*; 
import ddf.minim.effects.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class DT508_Assignment_2 extends PApplet {








PImage currentBackground;
PFont myFont;

int _state = 0;    //_state = 0 MENU --- _state = 1 GAME1 --- _state == 2 GAME2 --- _state == 3 GAME3 --- _state == 4 GAME OVER --- _state == 5 GAME COMPLETE --- _State == 6 LEVEL TRANSITION
boolean setupComplete;

Minim minim;
AudioPlayer paddleHit, brickHit, wallHit, lifeLost, powerUpHit, music;

int myGreen, myGold;

public void setup()
{
  
  
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
  
  myGreen = color(0, 200, 70);
  myGold = color(255, 255, 25);

  background(0);
}

public void draw()
{
//  println(_state);

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
    fill(myGreen);
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
    fill(myGreen);
    text("GAME OVER", width/2, height*0.25f);
    textSize(20);
    text("Click to Continue", width/2, height*0.75f);

    break;

  case 5:

    highScoreList();
    textSize(20);
    fill(myGreen);
    text("Click to Continue", width/2, height*0.9f);

    break;

  case 6:
    displayData();

    textAlign(CENTER);
    fill(myGreen);
    text("Stage Complete", width/2, height/3);
    text("Click to Continue", width/2, height*0.5f);

    break;
  }
}
FFT fft;

public void audioVisualizerSetup()
{
  fft = new FFT(music.bufferSize(), music.sampleRate());
}

int AVStep = 8;
float audioOutput = 0;
float audioOutput2 = 0;

public void audioVisualizerDraw()
{
  fft.forward(music.mix);
  audioOutput = fft.getBand(0);
  audioOutput2 = fft.getBand(60) * 20;
}

boolean brickIsHit;
int step = 1, step2 = 1, step3 = 1;

public void drawBackground()
{
  step3 = (int)audioOutput + 1;
  step2 = (int)audioOutput2 + 1;
  
  step += 1;
  
  if (step % 15 == 0)
  {
    step = 1;
  }
  
  loadPixels();
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
      if (y % step == 0)
      {
        if (!brickIsHit)
        {
          int loc = x + (y * width);
          int c  = color(step3, 0, step2);
          pixels[loc] = c;
        } 
        else
        {
          int loc = x + (y * width);
          int c  = color(255);
          pixels[loc] = c;
        }
      }
    }
  }
  brickIsHit = false;
  updatePixels();
}
class Brick                                          //BRICK CLASS
{
  float brX, brY, brWidth = 30, brHeight = 30;
  PVector brPos = new PVector(0, 0);
  
  Brick()
  {
    brPos.x = -100;
    brPos.y = -100;
  }
  
  public void brUpdate()
  {
    brDraw();
  }
  
  public void brDraw()
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
  
  public void pUpdate()
  {   
    pPos.x = mouseX;
    pDraw();
  }
 
  public void pDraw()
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
  
  public void startBall()
  {
    bPos = new PVector(paddle.pPos.x, paddle.pPos.y - 20);
    bSpeed = new PVector(0, 0);
    isReady = true;
  }
  
  public void shootBall()
  {
    isReady = false;
    float speedSplit = random(-fullSpeed / 2, fullSpeed / 2);
    bSpeed.x = speedSplit;
    bSpeed.y = (speedSplit > 0) ? fullSpeed - speedSplit : fullSpeed - abs(speedSplit);
  }
  
  public void bDraw()
  {
    fill(0, 200, 70, 175);
    ellipse(bPos.x, bPos.y, bRadius*2, bRadius*2);
  }
  
  public void bUpdate()
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
  
  public PVector reflect(float checkPoint, float divisor)
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
  int PUcol;
  float PUWidth = 20;
  
  PowerUp()
  {
    PUPos.x = random(25, width - 25);
    PUPos.y = -10;
    PUSpeed = rndSpeed();
  }
  
  public void PUUpdate()
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
  
  public float rndSpeed()
  {
    return(random(3, 8));
  }
  
  public void PUDraw()
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
public void getKeys()
{
  if(key == 'x')
  {
    hits += 100;
  }
  
  if(key == 'r')
  {
    ball.startBall();
  }
  
}

public void mousePressed()
{  
  switch(_state)
  {
    case 0:
    
      if(mouseX > 55 && mouseX < 310 && mouseY > 300 && mouseY < 375)
      {
        _state = 1;
        assembleLevel(_state);
      }
      else if(mouseX > 395 && mouseX < 625 && mouseY > 300 && mouseY < 375)
      {
        _state = 5;
      }
      
    break;
    
    case 1:
    
      if(ball.isReady)
      {
        ball.shootBall();
      }
          
    break;
    
    case 2:
      
      if(ball.isReady)
      {
        ball.shootBall();
      }
      
    break;
       
    case 3:
         
      if(ball.isReady)
      {
        ball.shootBall();
      }
        
    break;
    
    case 4:
      _state = 0;
      score = 0;
      hits = 0;
      currentLevel = 1;

    break;
    
    case 5:
      _state = 0;
      score = 0;
      hits = 0;
      currentLevel = 1;

    break;
    
    case 6:
    
      _state = currentLevel + 1;
      currentLevel++;
      assembleLevel(_state);
      hits = 0;
    
    break;
  }  
}
Paddle paddle;
Ball ball;
Brick[] bricks;
PowerUp pUp;

int numOfBricks;
int currentLevel = 1;

public void assembleLevel(int currentState)
{
    int rows = 0, cols = 0;
    if(_state == 1)
    {
      numOfBricks = 20;
      rows = 5;
      cols = 4;
//      hits = 0;
      lives = 5;
    }
    else if (_state == 2)
    {
      numOfBricks = 30;
      rows = 6;
      cols = 5;
//      hits = 0;
      lives = 5;
    }
    else if (_state == 3)
    {
      numOfBricks = 50;
      rows = 5;
      cols = 10;
//      hits = 0;
      lives = 5;
    }

    hits = 0;
    paddle = new Paddle();
    ball = new Ball();
    bricks = new Brick[numOfBricks];
    
    for(int i = 0; i < bricks.length; i++)
    {
      bricks[i] = new Brick();
    }
    
    for(int r = 0; r < rows; r++)
    {
      for(int c = 0; c < cols; c++)
      {
        int loc = r + (c * rows);
        int xVal = width / rows;
        if(c % 2 == 0)
        {
          bricks[loc].brPos.x = r * xVal + bricks[loc].brWidth * 2 + 40;
        }
        else
        {
          bricks[loc].brPos.x = r * xVal + 40;
        }
        bricks[loc].brPos.y = 50 + (bricks[loc].brHeight * 1.4f) * c;
      }
    }
    
    pUp = new PowerUp();
}
int score = 0, hits;
int lives = 5;
float scoreMultiplier = 1;

public void displayData()
{
  fill(myGreen);
  textAlign(LEFT);
  textSize(20);
  text("Score : " + score, 0, 25);
  text("Lives : " + lives, 250, 25);
  text("multiplier : " + scoreMultiplier, 465, 25);
  fill(255);
  
  fill(0, 200, 70, alpha);
  text("+" + (int)points, floatingUIPos.x, floatingUIPos.y);
  alpha -= 10;
  floatingUIPos.y --;
  
  pUpScoreDisplay();
}

PVector pUpScorePos = new PVector(100, 100);
float puAlpha = 0;
float puPoints = 0;
public void pUpScoreDisplay()
{
  puAlpha--;
  pUpScorePos.y--;
  fill(255, 255, 25, puAlpha);
  text("+" + (int)puPoints, pUpScorePos.x, pUpScorePos.y);
}

public void updateScore(int amount, PVector pos)
{
  scoreMultiplier += 1;
  score += (amount * scoreMultiplier);
  brickIsHit = true;
  hits++;
  UpdateFloatingUI(amount * scoreMultiplier, pos);
}

public void updateScorePU(int amount)
{
  scoreMultiplier += 1;
  score += (amount * scoreMultiplier);
  puPoints = (amount * scoreMultiplier);
  puAlpha = 255;
  pUpScorePos.x = pUp.PUPos.x;
  pUpScorePos.y = pUp.PUPos.y;
}

PVector floatingUIPos = new PVector(-100, -100);
float points = 0, alpha;

public void UpdateFloatingUI(float _points, PVector pos)
{
  points = _points;
  alpha = 255;
  floatingUIPos = pos;
}

public void updateLives(int amount)
{
  lives = lives + amount;
  if(lives < 0)
  {
    _state = 4;
  }
}


///////HIGH SCORE HANDLER

boolean listLoaded = false;
String firstName, secondName, thirdName, fourthName, fifthName;
int first, second, third, fourth, fifth;
boolean scoreInput;

public void highScoreList()
{
  if(!listLoaded)
  {
    calculateHighScores();
    if(score > fifth)
    {
      scoreInput = true;
    }
  }
  
  fill(150, 5);
  rect(width / 2, height / 2, width * 0.7f, width * 0.5f);
  fill(0,200,70);
  textAlign(CENTER);
  textSize(30);
  text("HIGH SCORES", width / 2, height / 2 + 25, width * 0.7f, width * 0.5f);
  textSize(20);
  text(firstName + "          " + first + " points", width / 2, height / 2 + 100, width * 0.7f, width * 0.5f);
  text(secondName + "          " + second + " points", width / 2, height / 2 +150, width * 0.7f, width * 0.5f);
  text(thirdName + "          " + third + " points", width / 2, height / 2 + 200, width * 0.7f, width * 0.5f);
  text(fourthName + "          " + fourth + " points", width / 2, height / 2 + 250, width * 0.7f, width * 0.5f);
  text(fifthName + "          " + fifth + " points", width / 2, height / 2 + 300, width * 0.7f, width * 0.5f);
  
  if(scoreInput == true)
  {
    textInput();
  }
  
}

Table scoreTable;
public void calculateHighScores()
{
    scoreTable = loadTable("HighScores.csv", "header");
    int rows = scoreTable.getRowCount();
    int[] scores = new int[rows];
    String[] names = new String[rows];
    for(int i = 0; i < rows; i++)
    {
      scores[i] = scoreTable.getInt(i, 1);
      names[i] = scoreTable.getString(i, 0);
    }
    
    first = scores[0];
    firstName = names[0];
    for(int i = 0; i < rows; i++)
    {
      if(scores[i] > first)
      {
        first = scores[i];
        firstName = names[i];
      }
    }  
    
    second = 0;
    secondName = names[0];
    for(int i = 0; i < rows; i++)
    {
       if(scores[i] < first && scores[i] > second)
       {
         second = scores[i];
         secondName = names[i];
       }
    }  
    
    third = 0;
    thirdName = names[0];
    for(int i = 0; i < rows; i++)
    {
      if(scores[i] < second && scores[i] > third)
      {
        third = scores[i];
        thirdName = names[i];
      }
    }
   
    fourth = 0;
    fourthName = names[0];
    for(int i = 0; i < rows; i++)
    {
      if(scores[i] < third && scores[i] > fourth)
      {
        fourth = scores[i];
        fourthName = names[i];
      }
    }
   
    fifth = 0;
    fifthName = names[0];;
    for(int i = 0; i < rows; i++)
    {
      if(scores[i] < fourth && scores[i] > fifth)
      {
        fifth = scores[i];
        fifthName = names[i];
      }
    } 
    
    listLoaded = true;
}

String myName = "Enter Name";

public void textInput()
{
  if(scoreInput == true)
  {
    fill(150, 80);
    rect(width / 2, height / 6, width * 0.7f, height * 0.1f);
 
    fill(0, 200, 70);
    text(myName, width / 2, height / 6, width * 0.7f, height * 0.1f); 
  }
}

public void keyPressed()
{
  if(scoreInput)
  {
    if (keyCode == BACKSPACE) 
      {
        if (myName.length() > 0) 
        {
          myName = myName.substring(0, myName.length()-1);
        }
      } 
      else if (keyCode == DELETE) 
      {
        myName = "";
      } 
      else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && keyCode != ENTER && keyCode != RETURN) 
      {
        myName = myName + key;
      }
      else if(keyCode == ENTER || keyCode == RETURN)
      {
        scoreInput = false;
        addName();
      }
  }
}

public void addName()
{  
  TableRow newRow = scoreTable.addRow();
  newRow.setString("name", myName);
  newRow.setInt("score", score);
  saveTable(scoreTable, dataPath("HighScores.csv")); 
  calculateHighScores();
}
  public void settings() {  size(700, 700);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "DT508_Assignment_2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
