//float snowTheta = 0, snowRadius = 10, snowDriftMidpointX = 1020, snowDriftMidpointY = 300;
//float[] snowBalls;
//
//void snowDriftDraw()
//{
//  
//  fill(255);
//  float x, y;
//  x = snowDriftMidpointX + sin(snowTheta)*snowRadius;
//  y = snowDriftMidpointY - cos(snowTheta)*snowRadius;
//  ellipse(x,y,10,10);
//  snowTheta -= 0.5;
//  snowDriftMidpointX -= 10;
//}

class SnowDrift{
  float snowTheta = 0, snowRadius = 10, snowDriftMidpointX = 1020, snowDriftMidpointY = 300;
//  float[] snowBalls;

  SnowDrift ()
  {
      snowTheta = 0; 
      snowRadius = random(10, 40); 
      snowDriftMidpointX = random(1020, 1500); 
      snowDriftMidpointY = random(height/2);
  }

  void draw()
  {
    fill(255);
    float x, y;
    x = snowDriftMidpointX + sin(snowTheta)*snowRadius;
    y = snowDriftMidpointY - cos(snowTheta)*snowRadius;
    ellipse(x,y,10,10);
    snowTheta -= 0.5;
    snowDriftMidpointX -= 10;
  }
}
