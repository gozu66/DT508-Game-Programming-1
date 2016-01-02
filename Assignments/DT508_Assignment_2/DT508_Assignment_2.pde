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
  paddle = new Paddle();
  ball= new Ball();
//  frameRate(100);
}

void draw()
{
  if (keyPressed)
  {
    getKeys();
  }
  drawBackground();
  paddle.pUpdate();
  ball.bDraw();
//  println(frameRate);
}

float pixelScaler = 0;
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
//        float n = sin(x - y) + sin(x / 10 + y / 5);
//        float col = map(n, -1, 1, 0, 100);
//        color c = color(col, -col, 0);
//        color c = color(width * x, height * y, 0);
        color c  = color(0, y, 0);
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

  pixelScaler += 6f;
}

