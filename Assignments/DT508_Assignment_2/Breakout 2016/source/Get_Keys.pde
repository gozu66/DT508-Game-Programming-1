void getKeys()
{
  if(key == 'x')
  {
    hits += 100;
  }
  
  if(key == 'r')
  {
    ball.startBall();
  }
  
}

void mousePressed()
{  
  switch(_state)
  {
    case 0:
    
      if(mouseX > 55 && mouseX < 310 && mouseY > 300 && mouseY < 375)
      {
        _state = 1;
        assembleLevel(_state);
      }
      else if(mouseX > 395 && mouseX < 625 && mouseY > 300 && mouseY < 375)
      {
        _state = 5;
      }
      
    break;
    
    case 1:
    
      if(ball.isReady)
      {
        ball.shootBall();
      }
          
    break;
    
    case 2:
      
      if(ball.isReady)
      {
        ball.shootBall();
      }
      
    break;
       
    case 3:
         
      if(ball.isReady)
      {
        ball.shootBall();
      }
        
    break;
    
    case 4:
      _state = 0;
      score = 0;
      hits = 0;
      currentLevel = 1;

    break;
    
    case 5:
      _state = 0;
      score = 0;
      hits = 0;
      currentLevel = 1;

    break;
    
    case 6:
    
      _state = currentLevel + 1;
      currentLevel++;
      assembleLevel(_state);
      hits = 0;
    
    break;
  }  
}