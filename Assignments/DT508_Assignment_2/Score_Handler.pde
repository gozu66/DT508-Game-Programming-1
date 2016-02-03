int score = 0, hits;
int lives = 5;
float scoreMultiplier = 1;

void displayData()
{
  fill(0, 200, 70);
  textAlign(LEFT);
  textSize(20);
  text("Score : " + score, 0, 25);
  text("Lives : " + lives, 250, 25);
  text("multiplier : " + scoreMultiplier, 465, 25);
  fill(255);
  
  fill(0, 200, 70, alpha);
  text("+" + (int)points, floatingUIPos.x, floatingUIPos.y);
  alpha -= 10;
  floatingUIPos.y --;
  
  pUpScoreDisplay();
}

PVector pUpScorePos = new PVector(100, 100);
float puAlpha = 0;
float puPoints = 0;
void pUpScoreDisplay()
{
  puAlpha--;
  pUpScorePos.y--;
  fill(255, 255, 25, puAlpha);
  text("+" + (int)puPoints, pUpScorePos.x, pUpScorePos.y);
}

void updateScore(int amount, PVector pos)
{
  scoreMultiplier += 1;
  score += (amount * scoreMultiplier);
  brickIsHit = true;
  hits++;
  UpdateFloatingUI(amount * scoreMultiplier, pos);
}

void updateScorePU(int amount)
{
  scoreMultiplier += 1;
  score += (amount * scoreMultiplier);
  puPoints = (amount * scoreMultiplier);
  puAlpha = 255;
  pUpScorePos.x = pUp.PUPos.x;
  pUpScorePos.y = pUp.PUPos.y;
}

PVector floatingUIPos = new PVector(-100, -100);
float points = 0, alpha;

void UpdateFloatingUI(float _points, PVector pos)
{
  points = _points;
  alpha = 255;
  floatingUIPos = pos;
}

void updateLives(int amount)
{
  lives = lives + amount;
  if(lives < 0)
  {
    _state = 4;
  }
}


///////HIGH SCORE HANDLER

boolean listLoaded = false;
String firstName, secondName, thirdName, fourthName, fifthName;
int first, second, third, fourth, fifth;
boolean scoreInput;

void highScoreList()
{
  if(!listLoaded)
  {
    calculateHighScores();
    if(score > fifth)
    {
      scoreInput = true;
    }
  }
  
  fill(150, 5);
  rect(width / 2, height / 2, width * 0.7f, width * 0.5f);
  fill(0,200,70);
  textAlign(CENTER);
  textSize(30);
  text("HIGH SCORES", width / 2, height / 2 + 25, width * 0.7f, width * 0.5f);
  textSize(20);
  text(firstName + "          " + first + " points", width / 2, height / 2 + 100, width * 0.7f, width * 0.5f);
  text(secondName + "          " + second + " points", width / 2, height / 2 +150, width * 0.7f, width * 0.5f);
  text(thirdName + "          " + third + " points", width / 2, height / 2 + 200, width * 0.7f, width * 0.5f);
  text(fourthName + "          " + fourth + " points", width / 2, height / 2 + 250, width * 0.7f, width * 0.5f);
  text(fifthName + "          " + fifth + " points", width / 2, height / 2 + 300, width * 0.7f, width * 0.5f);
  
  if(scoreInput == true)
  {
    textInput();
  }
  
}

Table scoreTable;
void calculateHighScores()
{
    scoreTable = loadTable("HighScores.csv", "header");
    int rows = scoreTable.getRowCount();
    int[] scores = new int[rows];
    String[] names = new String[rows];
    for(int i = 0; i < rows; i++)
    {
      scores[i] = scoreTable.getInt(i, 1);
      names[i] = scoreTable.getString(i, 0);
    }
    
    first = scores[0];
    firstName = names[0];
    for(int i = 0; i < rows; i++)
    {
      if(scores[i] > first)
      {
        first = scores[i];
        firstName = names[i];
      }
    }  
    
    second = 0;
    secondName = names[0];
    for(int i = 0; i < rows; i++)
    {
       if(scores[i] < first && scores[i] > second)
       {
         second = scores[i];
         secondName = names[i];
       }
    }  
    
    third = 0;
    thirdName = names[0];
    for(int i = 0; i < rows; i++)
    {
      if(scores[i] < second && scores[i] > third)
      {
        third = scores[i];
        thirdName = names[i];
      }
    }
   
    fourth = 0;
    fourthName = names[0];
    for(int i = 0; i < rows; i++)
    {
      if(scores[i] < third && scores[i] > fourth)
      {
        fourth = scores[i];
        fourthName = names[i];
      }
    }
   
    fifth = 0;
    fifthName = names[0];;
    for(int i = 0; i < rows; i++)
    {
      if(scores[i] < fourth && scores[i] > fifth)
      {
        fifth = scores[i];
        fifthName = names[i];
      }
    } 
    
    listLoaded = true;
}

String myName = "Enter Name";

void textInput()
{
  if(scoreInput == true)
  {
    fill(150, 80);
    rect(width / 2, height / 6, width * 0.7f, height * 0.1f);
 
    fill(0, 200, 70);
    text(myName, width / 2, height / 6, width * 0.7f, height * 0.1f); 
  }
}

void keyPressed()
{
  if(scoreInput)
  {
    if (keyCode == BACKSPACE) 
      {
        if (myName.length() > 0) 
        {
          myName = myName.substring(0, myName.length()-1);
        }
      } 
      else if (keyCode == DELETE) 
      {
        myName = "";
      } 
      else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && keyCode != ENTER && keyCode != RETURN) 
      {
        myName = myName + key;
      }
      else if(keyCode == ENTER || keyCode == RETURN)
      {
        scoreInput = false;
        addName();
      }
  }
}

void addName()
{  
  TableRow newRow = scoreTable.addRow();
  newRow.setString("name", myName);
  newRow.setInt("score", score);
  saveTable(scoreTable, dataPath("HighScores.csv")); 
  calculateHighScores();
}
