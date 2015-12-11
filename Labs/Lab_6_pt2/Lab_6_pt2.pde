float halfScreen;

void setup()
{
  size(500, 500);
  halfScreen = width * 0.5f;
}

void draw()
{
  background(100);

  if (!keyPressed)
  {
    textSize(25);
    for (int i = 1; i <= 5; i++)
    {
      textAlign(CENTER);
      text("Hold " +  i + " for sketch " + i, halfScreen, 50 * i);
    }
  }

  if (keyPressed)
  {
    if (key == '1')
    {
      stroke(0);
      for (int i = 50; i < height; i += 50)
      {
        line(0, i, width, i);
        line(i, 0, i, height);
      }
    }

    if (key == '2')
    {
      float thetaINC = TWO_PI / 12.0f;
      float radius = halfScreen/4;
      float x, y;

      for (float theta = 0; theta <= TWO_PI; theta += thetaINC)
      {
        fill(255, 255, 0);
        stroke(255, 255, 0);
        x = halfScreen + sin(theta) * radius;
        y = halfScreen - cos(theta) * radius;

        ellipse(x, y, 100, 100);
      }
      stroke(255);
      fill(255);
      ellipse(halfScreen, halfScreen, (halfScreen/2), (halfScreen/2));
    }

    if (key == '3')
    {
      fill(0);
      stroke(255, 255, 0);

      float diameter = 50;
      float halfDiameter = diameter/2;
      float quarterDiameter = halfDiameter/2;
      float faceHeight = height/2;

      for (float x =  diameter/2; x < width; x += diameter)
      {
        ellipse(x, faceHeight, diameter, diameter);
        ellipse(x, faceHeight, diameter/10, diameter/10);
        ellipse(x - quarterDiameter, faceHeight - (quarterDiameter), diameter/10, diameter/10);
        ellipse(x + quarterDiameter, faceHeight - (quarterDiameter), diameter/10, diameter/10);
        line(x - quarterDiameter, faceHeight + (quarterDiameter), x + quarterDiameter, faceHeight + (quarterDiameter));
        line(x - quarterDiameter, faceHeight + (quarterDiameter), x - quarterDiameter-5, faceHeight + (quarterDiameter/2));
        line(x + quarterDiameter, faceHeight + (quarterDiameter), x + quarterDiameter+5, faceHeight + (quarterDiameter/2));
      }
    }

    if (key == '4')
    {
      fill(0);
      stroke(255, 255, 0);

      float diameter = 50;
      float halfDiameter = diameter/2;
      float quarterDiameter = halfDiameter/2;
      float faceHeight = height/2;
      int count = 1;

      for (float x =  diameter/2; x < width; x += diameter)
      {
        if (count > 2)
        {
          count = 1;
        }

        if (count == 1)
        {
          ellipse(x, faceHeight, diameter, diameter);
          ellipse(x, faceHeight, diameter/10, diameter/10);
          ellipse(x - quarterDiameter, faceHeight - (quarterDiameter), diameter/10, diameter/10);
          ellipse(x + quarterDiameter, faceHeight - (quarterDiameter), diameter/10, diameter/10);
          line(x - quarterDiameter, faceHeight + (quarterDiameter), x + quarterDiameter, faceHeight + (quarterDiameter));
          line(x - quarterDiameter, faceHeight + (quarterDiameter), x - quarterDiameter-5, faceHeight + (quarterDiameter/2));
          line(x + quarterDiameter, faceHeight + (quarterDiameter), x + quarterDiameter+5, faceHeight + (quarterDiameter/2));
          count ++;
        } else
        {
          ellipse(x, faceHeight, diameter, diameter);
          ellipse(x, faceHeight, diameter/10, diameter/10);
          ellipse(x - quarterDiameter, faceHeight - (quarterDiameter), diameter/10, diameter/10);
          ellipse(x + quarterDiameter, faceHeight - (quarterDiameter), diameter/10, diameter/10);
          line(x - quarterDiameter, faceHeight + (quarterDiameter), x + quarterDiameter, faceHeight + (quarterDiameter));
          line(x - quarterDiameter, faceHeight + (quarterDiameter), x - quarterDiameter-5, faceHeight + (quarterDiameter*1.5f));
          line(x + quarterDiameter, faceHeight + (quarterDiameter), x + quarterDiameter+5, faceHeight + (quarterDiameter*1.5f));
          count++;
        }
      }
    }

    if (key == '5')
    {
      fill(0);
      stroke(255, 255, 0);

      float diameter = 50;
      float halfDiameter = diameter/2;
      float quarterDiameter = halfDiameter/2;
      int count = 1;

      for (float y =  diameter/2; y < height; y += diameter)
      {
        for (float x =  diameter/2; x < width; x += diameter)
        {
          if (count > 2)
          {
            count = 1;
          }

          if (count == 1)
          {
            ellipse(x, y, diameter, diameter);
            ellipse(x, y, diameter/10, diameter/10);
            ellipse(x - quarterDiameter, y - (quarterDiameter), diameter/10, diameter/10);
            ellipse(x + quarterDiameter, y - (quarterDiameter), diameter/10, diameter/10);
            line(x - quarterDiameter, y + (quarterDiameter), x + quarterDiameter, y + (quarterDiameter));
            line(x - quarterDiameter, y + (quarterDiameter), x - quarterDiameter-5, y + (quarterDiameter/2));
            line(x + quarterDiameter, y + (quarterDiameter), x + quarterDiameter+5, y + (quarterDiameter/2));
            count ++;
          } else 
          {
            ellipse(x, y, diameter, diameter);
            ellipse(x, y, diameter/10, diameter/10);
            ellipse(x - quarterDiameter, y - (quarterDiameter), diameter/10, diameter/10);
            ellipse(x + quarterDiameter, y - (quarterDiameter), diameter/10, diameter/10);
            line(x - quarterDiameter, y + (quarterDiameter), x + quarterDiameter, y + (quarterDiameter));
            line(x - quarterDiameter, y + (quarterDiameter), x - quarterDiameter-5, y + (quarterDiameter*1.5f));
            line(x + quarterDiameter, y + (quarterDiameter), x + quarterDiameter+5, y + (quarterDiameter*1.5f));
            count++;
          }
        }
      }
    }
  }
}

