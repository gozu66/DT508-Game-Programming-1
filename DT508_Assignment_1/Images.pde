PImage mistyTarabryan, RichieVanaHarley;
float imageHeightWidth = 300.0f;
float x = imageHeightWidth*0.5f, y;
float speed = 5;

SnowSplat[] mySplat = new SnowSplat[6];

void imageSetup()
{
  mistyTarabryan = loadImage("BryanTara+Misty.png");
  imageMode(CENTER);
  
  y = height-(imageHeightWidth*0.5f);
  for(int i = 0; i < mySplat.length; i++)
  {
   mySplat[i] = new SnowSplat(30, -100, -100, 4);
  }
}

float theta = 0, radius = 3;
void drawImages()
{
  image(mistyTarabryan, x, y, imageHeightWidth, imageHeightWidth);
  
  x += speed;
  y = y + cos(theta)*radius;
  theta += 0.2f;
  
  if(x + (imageHeightWidth / 2) > width)
  {
    image(mistyTarabryan, x - width, y, imageHeightWidth, imageHeightWidth);
  }
  if (x > width + (imageHeightWidth / 2))
  {
    hits = 0;
    x = x - width;
  }
  
  if(hits > 0)
  {
    for(int i = 0; i < hits; i++)
    {
      mySplat[i].draw(speed, -cos(theta)*radius);
    }
  }
}
int hits = 0, count = 0;

void snowBallHitCheck(float sbx, float sby)
{
  if(sby <= (x - imageHeightWidth * 0.5f) || sbx <= (x + imageHeightWidth * 0.5f))
  {
      mySplat[hits].updatePosition(sbx, sby);
      hits++;
      count++;
      println("hit"+ count);
  }
}

