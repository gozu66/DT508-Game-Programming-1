PImage vana;

void setup()
{
  size(530, 530);
  vana = loadImage("IMG_20130722_162805.jpg");
}

void draw()
{
  image(vana, 0, 0);
  vana.loadPixels();
  loadPixels();
  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      int loc = x + (y * width);
      float r = red(vana.pixels[loc]);
      float b = blue(vana.pixels[loc]);
      
      pixels[loc] = color(0, 0, r);
    }
  }
  updatePixels();
}



//float xMod = 0, xModPlus = 1;
//void drawBackground()
//{
//  loadPixels();
//  
//  for(int x = 0; x < width; x++)
//  {
//    for(int y = 0; y < height; y++)
//    {
//      int loc = x + (y * width);
//      pixels[loc] = color(x + xMod, y + xMod, y - xMod);
//    }
//  }
//  updatePixels();
//  
//  xMod += xModPlus;
//  if(xMod >= 150 || xMod <= 0)
//  {
//    xModPlus *= -1;
//  }
//
//}

