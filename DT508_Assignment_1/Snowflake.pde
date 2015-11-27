class Snowflake
{
  float originX;
  float originY;
  float hLegLength;
  float vLegLength;
  float dLegLength;
  float diagonalOffset;
  float speed;
  float xSpeedMod;
  
  Snowflake()
  {
    originX = random(0, width*1.5f);
    originY = random(0, height);
    hLegLength = random(5, 10);
    vLegLength = random(5, 10);
    dLegLength = random(1, 10);
    diagonalOffset = random(0.2f, 0.7f);
    speed = random(1, 7);
    xSpeedMod = random(-0.5f, 0.5f);
  }

  void drawSnowflake()
  {
    line(originX - hLegLength * 0.5f, originY, originX + hLegLength*0.5f, originY);
    line(originX, originY - vLegLength * 0.5f, originX, originY + vLegLength * 0.5f);
    line(originX - dLegLength * diagonalOffset, originY - dLegLength * diagonalOffset, originX + dLegLength * diagonalOffset, originY + dLegLength * diagonalOffset);
    line(originX + dLegLength * diagonalOffset, originY - dLegLength * diagonalOffset, originX - dLegLength * diagonalOffset, originY + dLegLength * diagonalOffset);    
  }
  void moveSnowflake()
  {
    originX -= speed * xSpeedMod;
    originY += speed;

    if (originX < 0 || originY > height)
    {
      originX = random(width*1.5f);
      originY = -5;
    }
  }
}

