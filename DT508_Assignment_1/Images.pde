PImage mistyTara, bryan;

void imageSetup()
{
  mistyTara = loadImage("mistyTara.jpg");
  bryan = loadImage("bryan.jpg");
  imageMode(CENTER);
//  tint(255, 255, 255, 110);
}

void drawImages()
{
  //  tint(255, 255, 255, 110);
  image(mistyTara, 150, height/2, 350, 350);
  //  image(bryan, 150, height-150, 350, 350);
}

