Paddle paddle;
Ball ball;
Brick[] bricks;
PowerUp pUp;

int numOfBricks;
int currentLevel = 1;

void assembleLevel(int currentState)
{
    int rows = 0, cols = 0;
    if(_state == 1)
    {
      numOfBricks = 20;
      rows = 5;
      cols = 4;
//      hits = 0;
      lives = 5;
    }
    else if (_state == 2)
    {
      numOfBricks = 30;
      rows = 6;
      cols = 5;
//      hits = 0;
      lives = 5;
    }
    else if (_state == 3)
    {
      numOfBricks = 50;
      rows = 5;
      cols = 10;
//      hits = 0;
      lives = 5;
    }

    hits = 0;
    paddle = new Paddle();
    ball = new Ball();
    bricks = new Brick[numOfBricks];
    
    for(int i = 0; i < bricks.length; i++)
    {
      bricks[i] = new Brick();
    }
    
    for(int r = 0; r < rows; r++)
    {
      for(int c = 0; c < cols; c++)
      {
        int loc = r + (c * rows);
        int xVal = width / rows;
        if(c % 2 == 0)
        {
          bricks[loc].brPos.x = r * xVal + bricks[loc].brWidth * 2 + 40;
        }
        else
        {
          bricks[loc].brPos.x = r * xVal + 40;
        }
        bricks[loc].brPos.y = 50 + (bricks[loc].brHeight * 1.4f) * c;
      }
    }
    
    pUp = new PowerUp();
}
