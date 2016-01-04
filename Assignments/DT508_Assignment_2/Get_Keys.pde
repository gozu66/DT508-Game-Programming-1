void getKeys()
{
  if(key == 'a' || keyCode == LEFT)
  {
    paddle.pX -= paddle.pSpeed;
  }
  else if(key == 'd' || keyCode == RIGHT)
  {
    paddle.pX += paddle.pSpeed;
  }
  
  if(key == 'r')
  {
    ball.startBall();
  }
}
