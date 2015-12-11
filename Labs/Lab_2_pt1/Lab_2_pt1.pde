float radius = 25;
float x = 200, y = 100;  //Global Variable declaration
float speedX, speedY;
int eyeWidth = 5, noseWidth = 5;


void setup()
{
  size(600, 600);
  stroke(0);
  fill(150);
  x = width/2;
  y = height/2;
  speedX = 7;
  speedY = 4;
  
  radius = width/2;
  eyeWidth = width/8;
  noseWidth = width/8; 
}

void draw()
{    
  background(0, 0, 100);
  
  ellipse(x, y, radius * 2, radius * 2);
  ellipse(x - eyeWidth, y - eyeWidth, eyeWidth, eyeWidth);
  ellipse(x + eyeWidth, y - eyeWidth, eyeWidth, eyeWidth);
  ellipse(x, y, noseWidth, noseWidth);
  
  line(x - eyeWidth, y + eyeWidth, x + eyeWidth, y + eyeWidth);
  line(x - eyeWidth, y + eyeWidth, x - eyeWidth*1.25, y + eyeWidth/25);
  line(x + eyeWidth, y + eyeWidth, x + eyeWidth*1.25, y + eyeWidth/25);

}
