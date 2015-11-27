String[] monthNames = new String[12];
int [] rainAmountMm = new int[12];

void setup()
{
  size(1000, 500);
  
  String[] monthNames = {
    "Jan", "Feb", "March", "April", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"
  };
  
  int[] rainAmountMm = {
    45, 37, 55, 27, 38, 50, 79, 48, 104, 31, 100, 58,
  };
  
  
  float Ave = 0;
  for(int i = 0; i < rainAmountMm.length; i++)
  {
    Ave += rainAmountMm[i];
  }
  Ave = Ave / rainAmountMm.length;
  println("Average Rainfall for Year : " + Ave);
  
  
  int highestRainfall = 0, highestRainfallIndex = 0;
  for(int i = 0; i < rainAmountMm.length; i++)
  {
    if(rainAmountMm[i] > highestRainfall)
    {
      highestRainfall = rainAmountMm[i];
      highestRainfallIndex = i;
    }
  }
  println("Month with highest rainfall : " + monthNames[highestRainfallIndex]);
  
  
 int lowestRainfall = 100, lowestRainfallIndex = 0;
  for(int i = 0; i < rainAmountMm.length; i++)
  {
    if(rainAmountMm[i] < lowestRainfall)
    {
      lowestRainfall = rainAmountMm[i];
      lowestRainfallIndex = i;
    }
  }
  println("Month with lowest rainfall : " + monthNames[lowestRainfallIndex]);
  
  color[] myColors = new color[12];
  
  for(int i = 0; i < myColors.length; i++)
  {
    myColors[i] = color(random(0, 255), random(0, 255), random(0, 255));
  }  
  
   float barX = 20, barHeight = 0;
   stroke(255, 0, 0);
   strokeWeight(5);
   for(int i = 0; i < monthNames.length-1; i++)
   {
     line(barX, (height-20) - rainAmountMm[i]*4, barX +width/monthNames.length, (height-20) - rainAmountMm[i + 1]*4); 
     barX += width/monthNames.length;
   }
  
   barX = 20; 
   strokeWeight(1);;
   stroke(0);
   for(int i = 0; i < monthNames.length; i++)
   {
     fill(myColors[i], 150);
     rect(barX - 15, (height-20) - rainAmountMm[i]*4, 30, rainAmountMm[i]*4);
     fill(0);
     text(monthNames[i], barX, height-10);
     text(rainAmountMm[i] + " mm", barX, (height-20) - rainAmountMm[i]*4);
     barX += width/monthNames.length;
   }
    
  float angles[] = new float[12]; 
  int sum = 0;
  
  for(int i = 0; i < monthNames.length; i++)
  {
    sum += rainAmountMm[i];
  }
   
  float prevAngle = 0;
  for(int i = 0; i < monthNames.length; i++)
  {
    angles[i] = rainAmountMm[i] * 360.0f / sum; 
    
    fill(myColors[i]);
    arc(width/2 - 250, height/2 - 125, 200, 200, prevAngle, prevAngle + radians(angles[i]));
    prevAngle += radians(angles[i]);
  }
}
