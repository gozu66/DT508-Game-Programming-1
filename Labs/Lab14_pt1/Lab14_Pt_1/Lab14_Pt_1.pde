import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer audioPlayer;

//  STATES  :
//
//  0  :  PLAYER STAT DISPLAY
//  1  :  PLAYER TURN <<serves all players>>
//  2  :  WIN SCREEN
//  3  :  ???

int state  = 0;

Player[] players = new Player[4];
Room[] rooms = new Room[6];

void setup()
{ 
  minim = new Minim(this);
  audioPlayer = minim.loadFile("alarm.wav");
  //  size(displayWidth, displayHeight);
  size(854, 480);  
  stroke(0);
  textSize(17);

  for (int i = 0; i < players.length; i++)
  {
    players[i] = new Player();
  }  
  for (int i = 0; i < 6; i++)
  {
    rooms[i] = new Room(i);
  }  
  startScreenSetup();
}

int startTimer;
void draw()
{
  switch(state)
  {
  case 0 :
    startScreenUpdate();
    break;

  case 1 :
    turnScreen();
    break;

  case 2 :
    winScreen();
    break;

  case 3 :
    break;
  }
  
  for(int i = 0; i <players.length; i++)
  {
    if(players[i].sanity < 0){players[i].sanity = 0;}
    if(players[i].sanity > 10){players[i].sanity = 10;}
    if(players[i].energy < 0){players[i].energy = 0;}
    if(players[i].sanity > 10){players[i].energy = 10;}
  }

}

void startScreenSetup()
{
  background(150);
  int boxHeight = 65;
  for (int i = 1; i < 5; i++)
  {
    fill(200);
    rect(0, (20 * i) + boxHeight * (i - 1), width, boxHeight);
    fill(200, 0, 0);

    String playerDetails = "Player " + i + " -- Pilot Skill : " +  players[i - 1].pilot + " -- Exterior Repair Skill : " 
      + players[i - 1].repair_Ext + " --Interior Repair Skill : " + players[i - 1].repair_Int + " -- Movement Speed : " + players[i -1].movement;// + "\n" + "                  Constitution : " + players[i - 1].constitution;

    textAlign(LEFT);
    text(playerDetails, 0, (20 * i) + (boxHeight * (i-1) - 5) + (boxHeight / 2));
  }
}
void startScreenUpdate()
{
  fill(200, 0, 0);
  rect(width/2 - 75, height - 100, 150, 70);
  fill(0);
  textAlign(CENTER);
  text("Start", width/2 - 75, height - 80, 150, 70);

  if (mousePressed)
  {
    if (mouseX > width/2 - 75 && mouseX < width/2 + 75)
    {
      if (mouseY > height - 100 && mouseY < height + 100)
      {
        state = 1;
      }
    }
  }
}

int currentPlayer = 0;
boolean isSetup;
String playerDetailsS;
String[] actionsTaken = new String[] {"", ""};
String[] actions = new String[] {"Move", "Pilot", "Repair Exterior", "Repair Interior", "SpaceWalk", "Eat", "Recreation"};

int currentAction = 0;
boolean turnFinished;

String endTurnDamageReport = "xxxxxx";

void turnScreen()
{
  if (!turnFinished)
  {
    if (players[currentPlayer].actions <= 0)
    {
      turnFinished = true;
    }

    if (!isSetup)
    {
      background(150);

      actionsTaken[0] = "";
      actionsTaken[1] = "";

      if (currentPlayer > 3)
      {
        currentPlayer = 0; 
        state = 3;
      }

      playerDetailsS = "Player " + (currentPlayer + 1) + " -- Pilot Skill : " +  players[currentPlayer].pilot + " -- Exterior Repair Skill : " + players[currentPlayer].repair_Ext + " --Interior Repair Skill : " + players[currentPlayer].repair_Int + " -- Movement Speed : " + players[currentPlayer].movement;// + "\n" + "                  Constitution : " + players[currentPlayer].constitution;

      isSetup = true;
    }

    background(150);

    fill(200);
    rect(0, 70, width, 55);
    fill(200, 0, 0);
    textAlign(LEFT);
    text(playerDetailsS, 0, 70, width, 100);

    noFill();
    rect(10, 5, 150, 30);
    rect(width - 160, 5, 150, 30);
    rect(width / 2 - 75, 5, 150, 30);

    fill(150, 0, 0);
    rect(10, 5, 150 * (players[currentPlayer].sanity / 10), 30);
    rect(width - 160, 5, 150 * (players[currentPlayer].energy / 10), 30);

    fill(0);
    textAlign(CENTER);
    text("Sanity : " + players[currentPlayer].sanity, 10, 5, 150, 30);
    text("Energy : " + players[currentPlayer].energy, width - 160, 5, 150, 30);
    text("Actions : " + players[currentPlayer].actions + " / 2", width / 2 - 75, 5, 150, 30);

    fill(255,0,0);
    text(endTurnDamageReport, width / 2, height * 0.9f);
    fill(0);
    
    textAlign(LEFT);
    text(actionsTaken[0], width * 0.35f, 150, width - (width * 0.5f), 60);
    text(actionsTaken[1], width * 0.35f, 180, width - (width * 0.5f), 60);
    
    for (int i = 0; i < 7; i++)
    {
      fill(150);
      rect(width * 0.125, height / 3.5 + (50 * i), 150, 40);
      fill(0);
      text(actions[i], width / 8, height / 3 + (50 * i), 150, 40);
    }
  } else
  {
    //Here boy
    background(150);

    text(endTurnDamageReport, width / 2, height * 0.9f);

    fill(200);
    rect(0, 70, width, 55);
    fill(200, 0, 0);
    textAlign(LEFT);
    text(playerDetailsS, 0, 70, width, 100);

    noFill();
    rect(10, 5, 150, 30);
    rect(width - 160, 5, 150, 30);
    rect(width / 2 - 75, 5, 150, 30);

    fill(150, 0, 0);
    rect(10, 5, 150 * (players[currentPlayer].sanity / 10), 30);
    rect(width - 160, 5, 150 * (players[currentPlayer].energy / 10), 30);

    fill(0);
    textAlign(CENTER);
    text("Sanity : " + players[currentPlayer].sanity, 10, 5, 150, 30);
    text("Energy : " + players[currentPlayer].energy, width - 160, 5, 150, 30);
    text("Actions : " + players[currentPlayer].actions + " / 2", width / 2 - 75, 5, 150, 30);

    textAlign(LEFT);
    text(actionsTaken[0], width * 0.35f, 150, width - (width * 0.5f), 60);
    text(actionsTaken[1], width * 0.35f, 180, width - (width * 0.5f), 60);


    for (int i = 0; i < 7; i++)
    {
      fill(150);
      rect(width * 0.125, height / 3.5 + (50 * i), 150, 40);
      fill(0);
      text(actions[i], width / 8, height / 3 + (50 * i), 150, 40);
    }


    if (mousePressed)
    {
      isSetup = false;
      players[currentPlayer].actions = 2;
      currentPlayer++;
      if (currentPlayer >= 4)
      {
        currentPlayer = 0;
        activePilotSkill = 0;
        endTurn();
      }
      turnFinished = false;
    }
  }

  gameTimer -= 1 / frameRate;
  eventTimer -= 1 / frameRate;

  if (gameTimer <= 0)
  {
    state = 2;
  }

  if (eventTimer <= 0)
  {
    createEvent();
    eventTimer = 30;
  }

  fill(150);
  noStroke();
  rect(width * 0.7f, height * 0.6f, 500, 500);
  fill(0);
  stroke(0);
  textAlign(CORNER);
  text("Time Remaining : " + gameTimer, width * 0.7f, height * 0.8f);
  text("Next Event : " + eventTimer, width * 0.7f, height * 0.9f);

  fill(255, 0, 0);
  textAlign(CENTER);
  textSize(20);
  text(currentEvent, width * 0.75f, height * 0.5f);
  textSize(17);
}

float gameTimer = 300;
float eventTimer = 10;
String currentEvent = "";
int activePilotSkill;

void endTurn()
{
  
}

void mouseReleased()
{
  if (state == 1 && !turnFinished)
  {
    if (mouseX > width / 8 && mouseX < (width / 8) + 150)
    {
      if (mouseY > 138 && mouseY < 178)
      {
        //        println("move");

        players[currentPlayer].actions -= 1;        
        players[currentPlayer].energy -= players[currentPlayer].movement;
        actionsTaken[currentAction] = "Player has moved (-" + players[currentPlayer].movement + " Energy)";
        currentAction++;
      } else if (mouseY > 188 && mouseY < 228)
      {
        //        println("Pilot");

        players[currentPlayer].actions = 0;

        float eLoss = (int)random(1.0f, 3.5f);
        float sLoss = (int)random(1.0f, 3.5f);

        players[currentPlayer].energy -= eLoss;
        players[currentPlayer].sanity -= sLoss;

        actionsTaken[currentAction] = "Player is Piloting the ship (-" + eLoss + " Energy) (-" + sLoss + " Sanity)";
        activePilotSkill = players[currentPlayer].pilot;
        currentAction += 2;
      } else if (mouseY > 238 && mouseY < 278)
      {
        //        println("Repair Ext");

        players[currentPlayer].actions = 0;

        int repairAmt = players[currentPlayer].repair_Ext + (int)random(-2, 3);
        

        actionsTaken[currentAction] = "Player has repaired the ship Exterior for " + repairAmt;
        currentAction += 2;
      } else if (mouseY > 288 && mouseY < 328)
      {
        //        println("Repair Int");

        players[currentPlayer].actions = 0;

        int repairAmt = players[currentPlayer].repair_Int + (int)random(-2, 3);

        actionsTaken[currentAction] = "Player has repaired the ship Interior for " + repairAmt;
        currentAction += 2;
      } else if (mouseY > 338 && mouseY < 378)
      {
        //        println("Spacewalk");

        players[currentPlayer].actions -= 1;
        players[currentPlayer].energy -= players[currentPlayer].movement;

        int sanityLoss = (int)random(1, 3);
        players[currentPlayer].sanity -= sanityLoss;

        actionsTaken[currentAction] = "Player is spacewalking (-" + players[currentPlayer].movement + " Energy) (-" + sanityLoss + " Sanity)";
        currentAction++;
        //POSSIBLE DAMAGE ROLL FOR PLAYER?
      } else if (mouseY > 388 && mouseY < 428)
      {
        //        println("Eat");

        players[currentPlayer].actions -= 1;

        float gain = (int)random(3f, 7f);
        players[currentPlayer].energy += gain;
        actionsTaken[currentAction] = "Player has eaten (+" + gain + " Energy)";
        currentAction++;
      } else if (mouseY > 438 && mouseY < 478)
      {
        //        println("Rec");

        players[currentPlayer].actions -= 1;

        float gain = (int)random(3f, 7f);
        players[currentPlayer].sanity += gain;
        actionsTaken[currentAction] = "Player takes some rec time (+" + gain + " Sanity)";
        currentAction++;
      }

      if (currentAction >= 2) 
      {
        currentAction = 0;
      }
    }
  }
}

//void incidentScreen()
//{
//  background(0);
//}

void winScreen()
{
  background(random(255), random(255), random(255));
  fill(random(255), random(255), random(255));
  textAlign(CENTER);
  textSize(100);
  text("WINNERS", width / 2, height / 2);
}

class Player
{  
  //STATS
  int pilot;
  int repair_Ext;
  int repair_Int;
  int movement;

  //HP
  int HP = 10;

  //NEEDS
  float energy = 10.0f;
  float sanity = 10.0f;

  //ACTIONS
  int actions = 2;

  Player()
  {
    pilot  = (int)random(10);
    repair_Ext = (int)random(10);
    repair_Int = (int)random(10);
    //    constitution = (int)random(10);
    movement = (int)random(1, 3);
  }
}

class Room
{
  float roomHPInt = 10;
  float roomHPExt = 10;
  int roomNum;
  String roomName;
  String[] roomNames = new String[] {
    "The Bridge", "The Engine Room", "The Dormitories", "The Observation Room", "The Maintanence Room", "The Laborotory"
  };
  Room(int i)
  {
    roomNum = i;
    roomName = roomNames[i];
  }
}

class Event
{
  int eventTypeIndex;
  int subTypeIndex;
  String eventTypeName;
  String subTypeName;
  String damagedRoom;
  int damage;

  String[] eventTypes = new String[] {
    "External Damage", "Internal Damage", "Hazardous Condiitions"
  };
  String[] ExternalDamageSub = new String[] {
    "Debris Impact", "Solar Flare", "Decompression"
  };
  String[] InternalDamageSub = new String[] {
    "Electrical Failure", "Oxygen Leak", "Fire"
  };
  String[] HazConSub = new String[] {
    "Asteroid Field", "Black Hole Proximity", "Ion Storm"
  };

  Event()
  {
    eventTypeIndex = (int)random(0, 3);
    subTypeIndex = (int)random(0, 3);

    eventTypeName =  eventTypes[eventTypeIndex];

    if (eventTypeIndex == 0)
    {
      subTypeName = ExternalDamageSub[subTypeIndex];
      int damagedRoomIndex = (int)random(1, 6);
      damagedRoom = rooms[damagedRoomIndex].roomName;
      
      damage = (int)random(2, 7);
      rooms[damagedRoomIndex].roomHPExt -= damage;    

      currentEvent = "NEW EVENT: \n" + eventTypeName + " Detected\n" + subTypeName + " has caused " + damage + " Damage \nto " + damagedRoom;
    } else if (eventTypeIndex == 1)
    {
      subTypeName = InternalDamageSub[subTypeIndex];
      int damagedRoomIndex = (int)random(1, 6);
      damagedRoom = rooms[damagedRoomIndex].roomName;
      
      damage = (int)random(2, 7);      
      rooms[damagedRoomIndex].roomHPInt -= damage;

      currentEvent = "NEW EVENT: \n" + eventTypeName + " Detected\n" + subTypeName + " has caused " + damage + " Damage \nto " + damagedRoom;
    } else if (eventTypeIndex == 2)
    {
      subTypeName = HazConSub[subTypeIndex];

      currentEvent = "NEW EVENT: \n" + eventTypeName + " Ahead!!\nNow entering " + subTypeName + "\nAssign Pilot Now!";
    }

    //DAMAGE AND ROOM CALC HERE

    //    currentEvent = "NEW EVENT: \n" + eventTypeName + " Detected\n" + subTypeName + " has caused " + damage + " Damage \nto" + damagedRoom;
  }
}

void createEvent()
{
  println("OH SHIT");
  //  background(150);
  Event _event = new Event();
  audioPlayer.rewind();
  audioPlayer.play();
}

