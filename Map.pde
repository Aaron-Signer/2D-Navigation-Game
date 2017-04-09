class map{
  
  int w, h;
  int [][] map;
    
   map(int w, int h)
   {
     this.w = w;
     this.h = h;
     map = new int [h][w];
     for (int r = 0; r < h; r++)
      for(int c = 0; c < w; c++)
        map[r][c] = 0;
     for(int i = 0; i < 200; i++)
       map[i + 400][400] = 1;
     for(int i = 0; i < 200; i++)
       map[i + 200][800] = 1;
     for(int i = 0; i < 600; i++)
       map[600][i + 400] = 1;
     for(int i = 0; i < 400; i++)
       map[400][i + 400] = 1;
       
     for(int i = 0; i < 400; i++)
       map[i + 200][1000] = 1;
       
     for(int i = 0; i < 200; i++)
       map[200][800+ i] = 1;
   }

  int getMap()
  {
    int a = 0;
    a = map[0][0];
    return a;
  }

  void drawMap()
  {
    background(0);
    for (int r = 0; r < h; r++)
      for(int c = 0; c < w; c++)
      {
        if (map [r][c] == 1)
         {
           fill(255);
           rect(c,r,1,1);
         }
      }
    
  }

}