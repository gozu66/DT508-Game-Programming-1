import ddf.minim.*;

Minim minim;
AudioPlayer music;
AudioPlayer splat;
AudioPlayer sling;

Snowflake[] snowflakes = new Snowflake[150];
SnowDrift[] snowDrift = new SnowDrift[20];
float midpointX, midpointY;

color sky = color(17.0f, 35.0f, 41.0f); 
color moon = color(213.0f, 217.0f, 232.0f); 
Trail _trail;

boolean slingIsFired;



void setup()
{
  size(1000, 600);
  noCursor();
  midpointX = width * 0.5f; 
  midpointY = height * 0.5f;

  minim = new Minim(this);
  music = minim.loadFile("_music.mp3");
  splat = minim.loadFile("_splat.wav");
    
  for (int i = 0; i < snowflakes.length; i++)
  {
    snowflakes[i] = new Snowflake();
  } 

  for (int i = 0; i < snowDrift.length; i++)
  {
    snowDrift[i] = new SnowDrift();
  }

  _trail = new Trail(25, 25);

  imageSetup();
  textSetup();
  //  audioVisualizerSetup();
}

void draw()
{
  background(sky);

  if (music.isPlaying() == false)
  {
    if (frameCount % 10 == 0)
    {
      music.play();
    }
  }
   if(!slingIsFired)
 {
   currMpx = mpx;
 }  
  renderMoon();

  drawTree(width * 0.5f, height * 0.5f, 100, 40);
  drawTree(width * 0.125f, height * 0.65f, 60, 16);
  drawTree(width * 0.75f, height * 0.75f, 45, -40);
  drawTree(width * 0.95f, height * 0.52f, 75, 24);
  drawTree(width * 0.275f, height * 0.8, 40, -45);

  drawImages();

  _trail.makeTrail(mouseX, mouseY);  

  stroke(255);
  for (int i = 0; i < snowflakes.length; i++)
  {
    snowflakes[i].moveSnowflake();
    snowflakes[i].drawSnowflake();
  }

  for (int i = 0; i < snowDrift.length; i++)
  {
    snowDrift[i].draw();
  }

  playText();

  if (slingIsFired)
  {
    fireSlingShot();
  } else {
    if (mousePressed)
    {
      if(!slingIsFired)
      {
        slingIsFired = true;
      }
    }
  }

  drawSlingShot();

  if (fadeAlpha >= 0)
  {
    fadeIn();
  }  
}

float moonWaveTheta, moonWaveRadius = 100.0f, moonWaveX = -150.0f, moonStartPoint = height+200;

void renderMoon()
{
  moonWaveX += 1.0f;

  float moonWaveY = moonStartPoint + cos(moonWaveTheta) * moonWaveRadius;

  strokeWeight(10);
  stroke(205, 205, 205, 125);
  fill(moon);
  ellipse(moonWaveX, moonWaveY, 200, 200);
  fill(178, 181, 194);
  noStroke();
  ellipse(moonWaveX-50, moonWaveY+20, 75, 75);
  ellipse(moonWaveX+60, moonWaveY-50, 25, 25);
  ellipse(moonWaveX+65, moonWaveY-45, 25, 25);
  ellipse(moonWaveX-26, moonWaveY-15, 110, 110);
  ellipse(moonWaveX+40, moonWaveY+60, 50, 45);
  strokeWeight(1);

  moonWaveTheta += 0.005f;

  if (moonWaveX >= width+101)
  {
    moonWaveX = -(moonWaveRadius*2);
    moonWaveTheta = 0;
  }
}

float fadeAlpha = 255.0f;

void fadeIn()
{
  fill(0, 0, 0, fadeAlpha);
  rect(0, 0, width, height); 
  fadeAlpha -= 2;
}


void drawTree(float x, float y, float size, float brightness)
{
  float treeCenter = x;
  float treeTop = y;
  float treeWidth = size;
  float treeLength = size;

  fill(0, 100 + brightness, 0);
  triangle(treeCenter, treeTop, treeCenter - treeWidth/2, treeTop + treeLength, treeCenter + treeWidth/2, treeTop + treeLength);
  triangle(treeCenter, treeTop + treeLength - 35, treeCenter - treeWidth, treeTop + (treeLength*2.5), treeCenter + treeWidth, treeTop + (treeLength*2.5));
  triangle(treeCenter, treeTop + (treeLength*2) - 35, treeCenter - (treeWidth*1.5), treeTop + (treeLength*4), treeCenter + (treeWidth*1.5), treeTop + (treeLength*4));
}

float mpx;
float mpy;
void drawSlingShot ()
{
  mpx = mouseX;
  mpy = height * 0.5f;
  beginShape();
  strokeWeight(2);
  stroke(0);
  fill(150, 75, 0);
  vertex(mpx + 10, height);
  vertex(mpx + 10, height - 40);
  vertex(mpx + 50, height - 90);
  vertex(mpx + 40, height - 90);
  vertex(mpx, height - 45);
  vertex(mpx - 40, height - 90);
  vertex(mpx - 50, height - 90);
  vertex(mpx - 10, height - 40);
  vertex(mpx - 10, height);
  endShape(CLOSE);
  fill(210);
  rect(mpx - 12, height - 36, 24, 10);
  rect(mpx - 12, height - 21, 24, 10);
  rect(mpx - 13, height - 30, 26, 10);
}

float mpxMod = 0, mpyMod = 0, currMpx;
float snowBallDiameter = 100;

void fireSlingShot()
{
  if (slingIsFired)
  {
    fill(255);
    ellipse(currMpx, (height - 75) + mpyMod, snowBallDiameter, snowBallDiameter);
    snowBallDiameter -= 2;
    
    if(snowBallDiameter > 50)
    {
     mpyMod -= 5;
    }
    else if(snowBallDiameter < 50 && snowBallDiameter > 20)
    {
     mpyMod += 5;
    }
    else if(snowBallDiameter < 20)
    {
      slingIsFired = false;
      snowBallDiameter = 100;
      mpyMod = 0;
      mpxMod = 0;
      snowBallHitCheck(currMpx, (height - 75) + mpyMod);
    }
  }
}

