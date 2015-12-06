class SnowSplat
{
  float ox, oy, x, y, theta = 0, radius = 30;
  int steps;
  float noiseValue;
  float[] vertsX;
  float[] vertsY;
  
  SnowSplat(int _steps, float _ox, float _oy, float _noiseValue)
  {
    noiseValue = _noiseValue;
    steps = _steps;
    vertsX = new float[steps + 1];
    vertsY = new float[steps + 1];
//    ox = _ox;
//    oy = _oy;
//    
//    for(int i = 0; i <= steps; i++)
//    {
//      x = ox + sin(theta) * radius;
//      y = oy - cos(theta) * radius;
//      vertsX[i] = x;
//      vertsY[i] = y; 
//      theta += TWO_PI/steps;
//      radius += random(-noiseValue, noiseValue);
//    }
  }
  float xMove = 0, yMove = 0;
  void draw(float _x, float _y)
  {
    fill(255);
    noStroke();
    beginShape();
  
    for(int i = 0 ;i < vertsX.length; i++)
    {
      vertex(xMove + vertsX[i], yMove + vertsY[i]);
    }
    xMove += _x;
    yMove -= _y;
    endShape(CLOSE);
  }

  void updatePosition(float newX, float newY)
  { 
    ox = newX;
    oy = newY;
    xMove = 0;
    yMove = 0;
    
    for(int i = 0; i <= steps; i++)
    {
      x = ox + sin(theta) * radius;
      y = oy - cos(theta) * radius;
      vertsX[i] = x;
      vertsY[i] = y; 
      theta += TWO_PI/steps;
      radius += random(-noiseValue, noiseValue);
    }
  }
}
