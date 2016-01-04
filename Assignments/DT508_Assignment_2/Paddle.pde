class Paddle
{
  Paddle()
  {
    pWidth = 100;
    pHeight = height / 50;
    pSpeed = 4.0f;
    pX = (width / 2) - (pWidth / 2);
    pY = height - pHeight * 4;
  }
  
  float pWidth, pHeight, pSpeed, pX, pY;
 
 void pUpdate()
 {   
   pDraw();
 }
 
 void pDraw()
 {
   rect(pX, pY, pWidth, pHeight);
 }
 
}
