float hyp, opp, adj, theta;
float t1x, t1y, t2x, t2y, t3x, t3y;
int offset = 10;

void setup()
{
  size(500, 500);
  adj = 200;
}

void draw()
{
  background(150);
  
  if(mousePressed)
  {
    adj = mouseX;
  }
  
  theta = 48;
  
  opp = tan(radians(theta)) * adj;
  hyp = adj / cos(radians(theta));
  
  t1x = (width - adj)/2;
  t1y = (height -(height - opp) / 2);
  t2x = t1x + adj;
  t2y = t1y;
  t3x = t2x;
  t3y = t2y - opp;
  
  text("Hypotenuse : " + hyp, offset, offset);
  text("Adjacent : " + adj, offset, offset + 30);
  text("Opposite : " + opp, offset, offset + 50);
  text("Theta : "    + theta, offset, offset + 70);
  
  line(t1x, t1y, t2x, t2y);
  line(t2x, t2y, t3x, t3y);
  line(t3x, t3y, t1x, t1y);
}
