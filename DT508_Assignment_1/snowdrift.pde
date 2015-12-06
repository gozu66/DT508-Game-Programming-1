class SnowDrift
{
  float snowTheta = 0, snowRadius = 10, snowDriftMidpointX = 1020, snowDriftMidpointY = 300, rnd;
  color col;

  SnowDrift ()
  {
      snowTheta = 0; 
      snowRadius = random(10, 60); 
      snowDriftMidpointX = random(1020,2500); 
      snowDriftMidpointY = random(height);
      rnd = random(0.1f, 1.25f);
      col = color(random(50, 150));
  }

  void draw()
  {
    fill(col);
    noStroke();
    float x, y;
    x = snowDriftMidpointX + sin(snowTheta)*snowRadius;
    y = snowDriftMidpointY - cos(snowTheta)*snowRadius;
    ellipse(x,y,10,10);
    snowTheta -= rnd;
    snowDriftMidpointX -= 10;
    if(x <= -20)
    {
      snowDriftMidpointX = random(1020,2500); 
      snowDriftMidpointY = random(height);
    }
  }
}
