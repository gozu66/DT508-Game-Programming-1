void getKeys()
{
//  if(key == 'a' || keyCode == LEFT)
//  {
//    paddle.pX -= paddle.pSpeed;
//  }
//  else if(key == 'd' || keyCode == RIGHT)
//  {
//    paddle.pX += paddle.pSpeed;
//  }
  
  if(key == 'r')
  {
    ball.startBall();
  }
  
  if(key == 'x')
  {
    if(_state < 1)
    {
      gameStart();
      _state++;
    } 
    else 
    {
      _state = 0;
    }
  }
}
