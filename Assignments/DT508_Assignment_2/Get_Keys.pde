void getKeys()
{
  if(key == 'r')
  {
    ball.startBall();
  }
  if(key == ' ')
  {
    if(_state == 6)
    {
      _state++;
      assembleLevel(_state);
    }
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
//        gameStart();
        assembleLevel(_state);
      }
      else if(mouseX > 395 && mouseX < 625 && mouseY > 300 && mouseY < 375)
      {
//        println("Face Mode Pressed");
      }
      
    break;
    
    case 1:
    break;
    
    case 2:
    break;
    
    case 3:
    break;
    
    case 4:
    break;
  }  
}
