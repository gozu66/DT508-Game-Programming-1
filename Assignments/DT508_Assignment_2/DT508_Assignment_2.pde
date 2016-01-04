import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Paddle paddle;
Ball ball;

PImage currentBackground;

void setup()
{
  size(500, 500);
  smooth();

  paddle = new Paddle();
  ball= new Ball();
}

void draw()
{
  if (keyPressed)
  {
    getKeys();
  }
  
  drawBackground();
  paddle.pUpdate();
  ball.bUpdate();
}

//float pixelScaler = 0;
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
        color c  = color(x/5, y/5, 0);
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

//  pixelScaler += 6f;
}

