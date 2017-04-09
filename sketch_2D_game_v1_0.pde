player p;
enemy en;
map mp;
Object [] inventory;

int wdth = 1470;
int hght = 1270;
float x = round(random(30,hght));
float y = round(random(30,wdth));

void setup () {
  //frameRate(2);
  size (1500,1300);
  smooth();
  Object [] inventory = new Object [4];
  p = new player(100,100,20,20,20);
  en = new enemy(501,520,10,10,10);
  mp = new map(wdth, hght);
  p.getEdge();
  
  //print(mp.getMap());
  //print (x);
  //print (y);
}

void draw () {
  //background(0);
  mp.drawMap();
  en.drawenemy();
  p.drawplayer();


  en.walk();
  if(keyPressed)
  {
    if (key == 's')
    {
      for(int i = 0; i < 5; i++)
        p.moveDOWN();
    }
    else if(key == 'w')
    {
      for(int i = 0; i < 5; i++)
        p.moveUP();
    }
    else if(key == 'a')
    {
      for(int i = 0; i < 5; i++)
        p.moveLEFT();
    }
    else if(key == 'd')
    {
      for(int i = 0; i < 5; i++)
        p.moveRIGHT();
    }
    else if(key == 'o')
      p.loseHealth();
  }
}