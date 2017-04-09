class enemy {
  float locX;
  float locY;
  int health1;
  int defense1;
  int attack1;
  
  
  enemy (float xx, float yy, int hh, int dd, int aa) {
    locX = xx;
    locY = yy;
    health1 = hh;
    defense1 = dd;
    attack1 = aa;
  }
  
  void moveRandom(){
    float i1 = random(0,1);
    i1 = round(i1);
    float i2 = random (0,1);
    i2 = round(i2);
    if (i1 == 0){
      if (locX < 1470 && 30 < locX){
        if (i2 == 0){
        locX = locX + 30;
        }
        if (i2 ==1){
        locX = locX - 30;
        }
      }
      
      else
      {
        if( locX < 30)
        {
          if(i2 == 0)
            locX = locX + 30;
        }
        else
        {
          if(i2 == 1)
          locX = locX - 30;
        }   
      }
      
    }
    if (i1 == 1){
      if (locY < 1270 && 30 < locY){
        if (i2 == 0){
        locY = locY + 30;
        }
        if (i2 ==1){
        locY = locY - 30;
        }
      }
      
       else
      {
        if( locY < 30)
        {
          if(i2 == 0)
            locY = locY + 30;
        }
        else
        {
          if(i2 == 1)
          locY= locY - 30;
        }   
      }
      
    }
  }
  
  void drawenemy(){ 
    fill(255);
    //translate(locX,locY);
    stroke(255);
    rect(locX,locY,30,30);
  }
  

  void walk()
  {
    int xBelow = 0, xAbove = 0, xLeft = 0, xRight = 0;
    
    while(mp.map[int(locY - xAbove)][int(locX)] != 1)
    {
     xAbove ++; 
    }
    
    while(mp.map[int(locY + xBelow)][int(locX)] != 1)
    {
     xBelow ++; 
    }
    
    while(mp.map[int(locY)][int(locX -xLeft)] != 1)
    {
     xLeft ++; 
    }
    
    while(mp.map[int(locY)][int(locX + xRight)] != 1)
    {
     xRight ++; 
    }
    
    //print(xBelow + "  \n " + locY);
    
    //print("\n");
    //print(mp.map[int(locY - xAbove)][int(locX)]);
    //print(int(locY - xAbove));
    //print(int(locX));
    
    //print("\n");
    //print(xAbove);
    //print(xBelow);
  
    
    
    if(mp.map[int(locY)][int(locX+50)] != 1)
      moveRIGHT();
      
    if(xBelow  < xAbove && !(mp.map[int(locY)][int(locX+50)] != 1))
      moveUP();
  }
  
  void moveUP()
  {
    locY = locY - 1;
  }
  void moveDOWN()
  {
    locY = locY + 1;
  }    
  void moveLEFT()
  {
    locX = locX - 1;
  }    
  void moveRIGHT()
  {
    locX = locX + 1;
  }    
}