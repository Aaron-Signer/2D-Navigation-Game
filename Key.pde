class Key
{
  PImage img;
  int locX, locY;
  
  Key ()
  {
    super();
    locY = 0;
    locX = 0;
    img = loadImage("KeyPic.jpg");
  }
  
  void drawKey()
  {
    image(img,locX,locY,50,50);
  }
  
}