float cX, cY, theta = 0.0f, radius = 25;
float eR = 10;
float rndColour;
float eFill = 0;
float x = 1;
float y;

void setup()
{
  size(500, 500);
  cX = width/2;
  cY = height/2;
  
}

void draw()
{
//  fill(random(0, 255), 0, 0); 
  y = cY - sin(theta) * radius; 
  ellipse(x, y, eR, eR); 
//  if(mousePressed){
//   theta -= random(0.1f, 1.0f);
//   radius += 0.5f;
//   eR += 0.25f;
//  }else{
//   theta += random(0.1f, 1.0f);
//   radius -= 0.5f;
//   eR -= 0.25f;
//  }
   x += 0.75f; 
   theta += 0.1f;
   //radius -= 0.5f;
   //eR -= 0.25f;
}

