class Trail
{  
  float[] x;
  float[] y;
  float xFollow, yFollow;

  Trail(int xNum, int yNum)
  {
    x = new float[xNum];
    y = new float[yNum];
  }
  
  void makeTrail(float xFollow, float yFollow)
  {
    x[x.length-1] = xFollow;
    y[y.length-1] = yFollow;
    
    int colorStep = 8;
    
    for(int i = 0; i < x.length-1; i++)
    {
      x[i] = x[i+1];
      y[i] = y[i+1];
      
      fill(255, 255 - (i * colorStep), 255 - (i * colorStep));
      noStroke();  
      ellipse(x[i], y[i], i, i);
    }
  }  
}
