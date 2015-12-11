float roadWidth = 100;
int carHeight = 50;                                                
float carYPos, carXPos;
int carSpeed = 2;
color carColor;

void setup()
{
  size(500, 500);  
  noStroke();
  rectMode(CENTER);
  
  carXPos = (width * 0.5f) + (roadWidth * 0.25f);                  //Initialize the cars X Position 
  carYPos = -(carHeight * 0.5f);                                   //Initialize the cars Y Position 
  carColor = color(random(255), random(255), random(255));         //Randomize the cars color for the first cycle
}

void draw()
{
  background(0);  
  drawRoad();  
  drawCar(); 
  
  carYPos += carSpeed;                                               //This is the code that handles moving the car
  
  if(carYPos > height + (carHeight * 0.5f))                          //If the car goes off the BOTTOM of the screen...
  {                                                                  //..
    changeDirectionAndLane(-1);                                      //call changeDirectionAndLane() function
  }     
  
  if (carYPos < -(carHeight * 0.5f))                                 //If the car goes off the TOP of the screen...
  {                                                                  //..
    changeDirectionAndLane(1);                                       //call changeDirectionAndLane() function
  }
}

void drawRoad()                                                     //This method draws the road, it is called every frame
{
  float roadY = height * 0.5f;
  float roadX = width * 0.5f;
  fill(100);                                                        //Colouring the road
  rect(roadX, roadY, roadWidth, height);                            //Drawing the road
  
  fill(255);
  int roadMarkingLength = 20;    
  for(int  i = roadMarkingLength / 2; i < height; i += (roadMarkingLength * 2))         //Using a loop to draw the road markings
  {
    rect(roadX, i, roadMarkingLength * 0.1f, roadMarkingLength);    
  } 
}

void drawCar()                                                      //This function called every frame
{
  float carWidth = 20;
  fill(carColor);                                                   //Set the car colour to current value
  rect(carXPos, carYPos, carWidth, carHeight);                      //Draw the car
}

void changeDirectionAndLane(int posNeg)                             //This method is called when the car goes off the bottom OR top of screen
{
  int carXInc = 50;
  carColor = color(random(255), random(255), random(255));          //Randomize car colour value
  carSpeed *= -1;                                                   //Invert the car speed (negative to positive or Positive to negative)
  carXPos += (roadWidth * 0.5f) * posNeg;                           //Move the car to the opposite side of the road
}
