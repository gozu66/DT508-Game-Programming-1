int currF = 1, prevF = 0, nextF = 1;
float x, y;
float radius, midpoint, theta;

void setup()
{
  size(500, 500);
  fill(255);
  textSize(12);
  background(0);
  
  midpoint = width * 0.5f;
  radius = 20f;

  theta = 0;                             //this code block hard-codes the first digit of the sequence
  x = midpoint + sin(theta) * radius;
  y = midpoint + -cos(theta) * radius;
  text(prevF, x , y);
  theta += TWO_PI / 10;
  radius += 10;
  
  x = midpoint + sin(theta) * radius;              //this code block hard-codes the second digit of the sequence
  y = midpoint + -cos(theta) * radius;
  text(currF, x , y);
  theta += TWO_PI / 10;
  radius += 10;
}

void draw()
{
  while(nextF < 6765)                             //this while loop calculates the rest of the fibonacci numbers and also
  {                                                //calculates the x + y co-ordinates to place the digits in a spiral
    float x = midpoint + sin(theta) * radius;
    float y = midpoint + -cos(theta) * radius;
    theta += TWO_PI / 10;
    radius += 10;
    
    nextF = currF + prevF;
    text(nextF, x , y);
    prevF = currF;
    currF = nextF;
  }  
}
