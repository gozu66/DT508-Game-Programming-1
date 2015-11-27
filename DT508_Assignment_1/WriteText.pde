PFont font;
String currentText; 
float n = 0;
float alphaStep = -5.0f;
int textInc = 0;
String[] displayText = new String[3];

void textSetup()
{
  if(font == null)
  {
    font = createFont("PWChristmasfont.ttf", 75);
    textFont(font); 
  }
  
  textSize(75);
  textAlign(CENTER);
    
  displayText[0] = "To Bryan, Tara \n & Misty"; 
  displayText[1] = "Happy Holidays!!";
  displayText[2] = "From Richie, Vanadia \n & Harley";
  
  currentText = displayText[0];
}
 
void playText()
{
  fill(255, 0, 0, n);
  text(currentText, 0, 50, width, 200);  
    
  if(millis() % 2 == 0)
  {
    n -= alphaStep;
  }
  
  if(n < 0 || n > 256)
  {
    alphaStep *= -1;

  if(n < 0)
  {
    currentText = changeText();
  }
    
  n = (n < 0) ? 0 : 255; 
  }
}

String changeText()    
{
  textInc = (textInc < displayText.length -1) ? textInc + 1 : 0;
  return displayText[textInc];
}
