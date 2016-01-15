int score;
int lives = 5;

void updateScore(int amount)
{
  score = score + amount;
}

void updateLives(int amount)
{
  lives = lives + amount;
  if(lives < 0)
  {
    _state = 3;
  }
}

void displayScore()
{
//  fill(255);
  textAlign(LEFT);
  textSize(20);
  text("Score : " + score, 0, 25);
  text("Lives : " + lives, 0, 50);
//  fill(255);
}
