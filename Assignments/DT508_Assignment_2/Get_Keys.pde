void getKeys()
{
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
        println("Play Pressed");
        gameStart();
        _state = 1;
      }
      else if(mouseX > 395 && mouseX < 625 && mouseY > 300 && mouseY < 375)
      {
        println("Face Mode Pressed");
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
