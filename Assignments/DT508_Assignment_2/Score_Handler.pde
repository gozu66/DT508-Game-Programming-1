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

boolean listLoaded = false;
void highScoreList()
{
  if(!listLoaded)
  {
    Table scoreTable = loadTable("HighScores.csv", "header");
//    println(scoreTable.getRowCount());
    int rows = scoreTable.getRowCount();
    int[] scores = new int[rows];
    String[] names = new String[rows];
    for(int i = 0; i < rows; i++)
    {
      scores[i] = scoreTable.getInt(i, 1);
      names[i] = scoreTable.getString(i, 0);
    }
    
    int first = scores[0];
    String firstName = names[0];
    for(int i = 0; i < rows; i++)
    {
      if(scores[i] > first)
      {
        first = scores[i];
        firstName = names[i];
      }
    }  
    
    int second = 0;
    String secondName = names[0];
    for(int i = 0; i < rows; i++)
    {
       if(scores[i] < first && scores[i] > second)
       {
         second = scores[i];
         secondName = names[i];
       }
    }  
    
    int third = 0;
    String thirdName = names[0];
    for(int i = 0; i < rows; i++)
    {
      if(scores[i] < second && scores[i] > third)
      {
        third = scores[i];
        thirdName = names[i];
      }
    } 
    
//    println("First : " + firstName + " " + first + " points");
//    println("Second " + secondName + " " + second + " points");
//    println("Third " + thirdName + " " + third + " points");
    
    listLoaded = true;
  }
  
}
