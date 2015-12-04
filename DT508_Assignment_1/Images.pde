PImage mistyTarabryan, RichieVanaHarley;
float imageHeightWidth = 300.0f;
float x = imageHeightWidth*0.5f, y;
float speed = 5;

void imageSetup()
{
  mistyTarabryan = loadImage("BryanTara+Misty.png");
//  RichieVanaHarley = loadImage("RichieVana+Harley.png");
  imageMode(CENTER);
  //tint(105, 105, 105);
  
  y = height-(imageHeightWidth*0.5f);
}

float theta = 0, radius = 3;
void drawImages()
{
  image(mistyTarabryan, x, y, imageHeightWidth, imageHeightWidth);
  
  x += 6;
  y = y + cos(theta)*radius;
  theta += 0.2f;
  
  if(x + (imageHeightWidth / 2) > width)
  {
    image(mistyTarabryan, x - width, y, imageHeightWidth, imageHeightWidth);
  }
  if (x > width + (imageHeightWidth / 2))
  {
    x = x - width;
    println("hit");
  }
}
