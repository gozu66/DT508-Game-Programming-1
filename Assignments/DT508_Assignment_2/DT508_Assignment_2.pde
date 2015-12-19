import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Paddle paddle;
PImage currentBackground;

void setup()
{
  size(500, 500);
  paddle = new Paddle();
}

void draw()
{
  if (keyPressed)
  {
    getKeys();
  }
  drawBackground();
  paddle.pUpdate();
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
        float n = sin(x / 30 * y / 540) + sin(x / 10 + y / 5);
        float col = map(n, -1, 1, 0, 100);
        color c = color(col, -col, 0);
        pixels[loc] = color(c);
      }
    }
    updatePixels();
    save("currentBackground" + ".png");
    currentBackground = loadImage("currentBackground.png");
    isDrawn = true;
  } 
  else
  {
    image(currentBackground, 0, 0, width, height);
  }

  pixelScaler += 6f;

  println(isDrawn);
  println(frameRate);
}

