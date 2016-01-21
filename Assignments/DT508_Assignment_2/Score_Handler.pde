int score, hits;
int lives = 5;
float scoreMultiplier = 1;

void updateScore(int amount)
{
  scoreMultiplier += 1;
  score += (amount * scoreMultiplier);
  hits++;
}

void updateLives(int amount)
{
  lives = lives + amount;
  if(lives < 0)
  {
    _state = 4;
  }
}

void displayData()
{
  fill(0, 255, 0);
  textAlign(LEFT);
  textSize(20);
  text("Score : " + score, 0, 25);
  text("Lives : " + lives, 200, 25);
  text("multiplier : " + scoreMultiplier, 400, 25);
  fill(255);
}

