class player {
  int locationX;
  int locationY;
  int health;
  int defense;
  int attack;
  int transition = 1;
  boolean moveUp = false, moveDown = false, moveLeft = false, moveRight = false, conflict = false;
  int [][] playerEdge;
  int wdth = 61, hght = 61;
  int radius = 30;
  int xx,yy;
  boolean q1 = false,q2 = false,q3 = false,q4 = false;
  int xxx,yyy;
  
  player (int x, int y, int h, int d, int a) {
    locationX = x;
    locationY = y;
    health = h;
    defense = d;
    attack = a;
    
    playerEdge = new int [wdth][hght];
    for (int r = 0; r < hght; r++)
      for(int c = 0; c < wdth; c++)
        playerEdge[r][c] = 0;
    
  }
  
  void getEdge()
  {
    for(int theta = 0; theta <= 360; theta++)
    {
      xx = int(radius*sin((theta*(PI/180))));
      yy = int(radius*cos((theta*(PI/180))));
      playerEdge[(int(hght/2) + yy)][(int(wdth/2) + xx)] = 1;
      //int temp = (int(hght/2) + yy);
      //int temp1 = (int(wdth/2) + xx);
    }
  }
  
  void attack(){
    rect(locationX + 30,locationY - 18,30,10);
  }
  
  void loseHealth()
  {
    if(health >0 && health <= 20)
      health --;
  }
  
  void drawplayer(){ 
    
    float ratio = (float)health/20;
    float ratio2 = ratio * 100;
    
    frameRate(120);
    fill(255);
    stroke(255);
    ellipse(locationX,locationY,60,60);
    
    getEdge();
    conflict();
    
    fill(255,0,255);
    noStroke();
    rect(locationX - 55, locationY - 57, 110, 1);
    rect(locationX - 55, locationY - 37, 110, 1);
    fill(255,0,0);
    rect(locationX-50, locationY - 55, ratio2, 17);
   
    fill(255);
    textSize(20);
    text('/', locationX, locationY - 40);
    text(20, locationX-35, locationY - 40);
    text(health, locationX + 20, locationY - 40);
    
    
    
    if(moveUp)
      drawUp();
      
    else if(moveDown)
      drawDown();
    
    else if(moveLeft)
      drawLeft();
      
    else if(moveRight)
      drawRight();
    
  }
  
  void drawUp()
  {
    noStroke();
    fill(#6F6D76);
    ellipse(locationX, locationY-17,40,20);
  }
  
  void drawDown()
  {
    noStroke();
    fill(#6F6D76);
    ellipse(locationX, locationY+17,40,20);
  }
  
  void drawLeft()
  {
    noStroke();
    fill(#6F6D76);
    ellipse(locationX-17, locationY,20,40);
  }
  
  void drawRight()
  {
    noStroke();
    fill(#6F6D76);
    ellipse(locationX+17, locationY,20,40);
  }
  
  void conflict()
  {
    q3 = false;
    conflict = false;
    for( int r = 0; r < p.hght; r++)
    {
      for(int c = 0; c < p.wdth; c++)
      {
        if(playerEdge[r][c] == 1 && mp.map[(locationY-30)+r][(locationX -30)+c] == 1)
        {
          conflict = true;
          xxx = c;
          yyy = r;
        }
        else if (conflict == false)
        {
          xxx = 0;
          yyy = 0;
        }
      }
    }
    
   if(xxx > 30 && yyy < 30)
    {
      q1 = true;
      q2 = false;
      q3 = false;
      q4 = false;
    }
    
    else if(xxx < 30 && xxx > 0 && yyy < 30 && yyy > 0)
    {
      q1 = false;
      q2 = true;
      q3 = false;
      q4 = false;
    }
    
    else if(xxx < 30 && yyy > 30)
    {
      q1 = false;
      q2 = false;
      q3 = true;
      q4 = false;
    }
    
    else if(xxx > 30 && yyy > 30)
    {
      q1 = false;
      q2 = false;
      q3 = false;
      q4 = true;
    }
    
    else
    {
      q1 = false;
      q2 = false;
      q3 = false;
      q4 = false;
    }
    
   /* if(xxx < 30 && xxx > 0)
    {
      if(yyy < 30 && yyy > 0)
      {
        q1 = false;
      q2 = true;
      q3 = false;
      q4 = false;
      }
      else
      {
        q1 = false;
      q2 = false;
      q3 = true;
      q4 = false;
      }
    }
    
    else if(xxx > 30)
    {
      if(yyy < 30)
      {
        q1 = true;
      q2 = false;
      q3 = false;
      q4 = false;
      print("true");
      }
      else
      {
        q1 = false;
      q2 = false;
      q3 = false;
      q4 = true;
      }
    }
    
    else
    {
     q1 = false;
      q2 = false;
      q3 = false;
      q4 = false; 
    }*/
    
    //if(q4)
     // print("true");
    
  }
  
  void moveUP()
  { 
 
    if(mp.map[locationY - 30][locationX] != 1 && !q1 && !q2)
    {
      locationY = locationY - transition;
      moveUp = true;
      moveDown = false;
      moveLeft = false;
      moveRight = false;
    }
  }
  void moveDOWN()
  {
    if(mp.map[locationY + 30][locationX] != 1 && !q3 && !q4)
    {
      locationY = locationY + transition;
      moveUp = false;
      moveDown = true;
      moveLeft = false;
      moveRight = false;
    }
  }    
  void moveLEFT()
  {
    if(mp.map[locationY][locationX - 30] != 1 && !q2 && ! q3)
    {
      locationX = locationX - transition;
      moveUp = false;
      moveDown = false;
      moveLeft = true;
      moveRight = false;
    }
  }    
  void moveRIGHT()
  {
    if(mp.map[locationY][locationX + 30] != 1 && !q4 && !q1)
    {
      locationX = locationX + transition;
      moveUp = false;
      moveDown = false;
      moveLeft = false;
      moveRight = true;
    }
  }    
}