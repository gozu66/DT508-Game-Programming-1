PImage mistyTarabryan, RichieVanaHarley;
float imageHeightWidth = 300.0f;

void imageSetup()
{
  mistyTarabryan = loadImage("BryanTara+Misty.png");
  RichieVanaHarley = loadImage("RichieVana+Harley.png");
  imageMode(CENTER);
  tint(255, 205, 205, 170);
}

void drawImages()
{
  image(mistyTarabryan, imageHeightWidth*0.5f, height-(imageHeightWidth*0.5f), imageHeightWidth, imageHeightWidth);
  image(RichieVanaHarley, width - imageHeightWidth*0.5f, height-(imageHeightWidth*0.5f), imageHeightWidth, imageHeightWidth);
}
