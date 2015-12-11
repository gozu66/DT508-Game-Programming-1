float radius = 25;
float x = width / 2, y = height / 2;  //Global Variable declaration
float speedX, speedY, moveSpeed = 5;
int eyeWidth = 5, noseWidth = 5;

void setup()
{
  size(500, 500);
  stroke(0);
  fill(150);
  x = radius;
  y = (height/2);
  speedX = 0;
  speedY = 0;
  
  radius = 25;
//  eyeWidth = width/8;
//  noseWidth = width/8; 
}

void draw()
{    
  background(0, 0, 100);
  
  ellipse(x, y, radius * 2, radius * 2);
  ellipse(x - eyeWidth, y - eyeWidth, eyeWidth, eyeWidth);
  ellipse(x + eyeWidth, y - eyeWidth, eyeWidth, eyeWidth);
  ellipse(x, y, noseWidth, noseWidth);
  
  line(x - eyeWidth, y + eyeWidth, x + eyeWidth, y + eyeWidth);
  line(x - eyeWidth, y + eyeWidth, x - 15, y - eyeWidth/2);
  line(x + eyeWidth, y + eyeWidth, x + 15, y - eyeWidth/2);
  
  if(x <= radius && y <= height-radius)
  {
    speedX = 0;
    speedY = moveSpeed;
  }
  if(y >= height-radius && x <= radius)
  {
    speedY = 0;
    speedX = moveSpeed;
  }
  if(x >= width-radius && y >= width - radius)
  {
    speedX = 0;
    speedY = -moveSpeed;
    y = height - radius;
  }
  if (y <= radius && x <= width-radius)
  {
    speedX = -moveSpeed;
    speedY = 0;
  }
   if(x <= radius && y <= radius)
  {
    speedX = 0;
    speedY = moveSpeed;
  }  
  
  x += speedX;
  y += speedY;

}
