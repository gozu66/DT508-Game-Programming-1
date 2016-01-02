class Paddle
{
  Paddle()
  {
    pWidth = width / 8;
    pHeight = height / 64;
    pSpeed = 1.0f;
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
