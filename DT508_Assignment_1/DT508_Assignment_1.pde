import ddf.minim.*;

Minim minim;
AudioPlayer music;

Snowflake[] snowflakes = new Snowflake[150];
float midpointX, midpointY;

color sky = color(17.0f, 35.0f, 41.0f); 
color moon = color(213.0f, 217.0f, 232.0f); 
Trail _trail;

void setup()
{
  size(1000, 600);
  noCursor();
  midpointX = width * 0.5f; 
  midpointY = height * 0.5f;
  
  frameRate(40);
  
  minim = new Minim(this);
  music = minim.loadFile("_music.mp3");
  
  for(int i = 0; i < snowflakes.length; i++)
  {
    snowflakes[i] = new Snowflake();
  } 
  
  _trail = new Trail(25, 25);
  
  imageSetup();
  textSetup();
}

void draw()
{
  background(sky);
  
//  if(music.isPlaying() == false)
//  {
//    if(frameCount % 10 == 0)
//    {
//        music.play();
//    }
//  }

  renderMoon();
  
  drawImages();
  
//  println(frameRate);
  
  stroke(255);
  for(int i = 0; i < snowflakes.length; i++)
  {
    snowflakes[i].moveSnowflake();
    snowflakes[i].drawSnowflake();
  }
  
  playText();

  _trail.makeTrail(mouseX, mouseY);  
  
  if(fadeAlpha >= 0)
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
  
  if(moonWaveX >= width+101)
  {
    moonWaveX = -200.0f;
    moonWaveTheta = 0;
  }
}

float fadeAlpha = 255.0f;
void fadeIn()
{
  fill(0,0,0, fadeAlpha);
  rect(0,0,width, height); 
  fadeAlpha -= 2;
}
