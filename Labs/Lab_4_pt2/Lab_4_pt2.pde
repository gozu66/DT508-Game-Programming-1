float cX, cY, theta = 0.1f, radius = 300;
float eR = 10;
float r = 40f, g = 0.1f, b = 0.1f;
float colorChangeRate = 0.5f;
boolean decline;

void setup()
{
  size(700, 700);
  cX = width/2;
  cY = height/2;
}

void draw()
{
  float x = cX + sin(theta) * radius;
  float y = cY -cos(theta) * radius;
  fill(r, g, b);
  ellipse(x, y, eR, eR); 
  
  theta += 0.1f;
  float i = 0.1f;
  radius -= i;
  i += 0.2;
  
  float col = r + g + b;
  if(col >= 255 * 3)
  {
    decline = true;
  }
  if(!decline)
  {
    if(col < 255)
    {
      r += colorChangeRate;
    }
      else if(g < 255)
      {
        g += colorChangeRate;
      }
        else if(g >= 255 && b < 255)
        {
          b += colorChangeRate;
        }
  }
  else
  {
     if(col > 510)
     {
       r-=colorChangeRate;
     }
       else if(col < 510 && col < 255)
       {
         g -= colorChangeRate;
       }
         else 
         {
           b -= colorChangeRate;
           
             if(col == 0)
             {
               decline = false;
             }
       }
   }
}


