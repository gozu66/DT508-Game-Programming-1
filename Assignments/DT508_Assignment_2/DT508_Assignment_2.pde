import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Paddle paddle;

void setup()
{
  size(500, 500);
  paddle = new Paddle();
}

void draw()
{
  if(keyPressed)
  {
    getKeys();
  }
  drawBackground();
  paddle.pUpdate();
}

float pixelScaler = 0;
void drawBackground()
{
  loadPixels();
  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      int loc = x + (y * width);
      float z = (x*x) + pixelScaler;
      pixels[loc] = (int)z;
    }
  }
  updatePixels();
  pixelScaler += 6000f;
  
//  fill(0, 0, 0, 200);
//  rect(0, 0, width, height);
  
  println(frameRate);
}
