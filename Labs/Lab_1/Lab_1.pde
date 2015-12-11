int faceMidpointX = 712;
int faceMidpointY = 256;

int shipMidpointX = 312;
int shipMidpointY = 256;


void setup()
{
  size(1024, 512);
}

void draw()
{
  background(128,0,200);
  
  fill(255, 10, 50);                                                                          //This section draws the face
  stroke(255);                                                
  ellipse(faceMidpointX, faceMidpointY, 200, 200);
  ellipse(faceMidpointX, faceMidpointY, 10, 10);
  ellipse(faceMidpointX - 40, faceMidpointY - 40, 10, 10);
  ellipse(faceMidpointX + 40, faceMidpointY - 40, 10, 10);
  line(faceMidpointX - 50, faceMidpointY + 30, faceMidpointX - 30, faceMidpointY + 45);
  line(faceMidpointX + 50, faceMidpointY + 30, faceMidpointX + 30, faceMidpointY + 45);
  line(faceMidpointX - 30, faceMidpointY + 45, faceMidpointX + 30, faceMidpointY + 45);
  
  
  fill(0, 0, 0, 0);
  stroke(0);
  line(shipMidpointX-175, shipMidpointY-25, shipMidpointX-135, shipMidpointY-12);            //This section draws the Enterprise
  line(shipMidpointX-175, shipMidpointY+25, shipMidpointX-135, shipMidpointY+12);
  line(shipMidpointX, shipMidpointY-50, shipMidpointX-175, shipMidpointY);
  line(shipMidpointX, shipMidpointY+50, shipMidpointX-175, shipMidpointY);
  fill(128,0,200);
  ellipse(shipMidpointX, shipMidpointY, 150, 150);
  line(shipMidpointX-200, shipMidpointY+25, shipMidpointX-150, shipMidpointY+25);
  line(shipMidpointX-200, shipMidpointY-25, shipMidpointX-150, shipMidpointY-25);
}
