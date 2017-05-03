class Particle
{
  float x,y,vx,vy,size,colourR,colourG,colourB,alpha;
  static final float GRAVITY = 0.1;
 
  public Particle(int x, int y, int vx, int vy, int size, int colourR, int colourG, int colourB, int alpha)
  {
    this.x = x; 
    this.y = y; 
    this.vx = vx; 
    this.vy = vy; 
    this.size = size;
    this.colourR = colourR;
    this.colourG = colourG;
    this.colourB = colourB;
    this.alpha = alpha;
  }
  
  public void update()
  {
    //Particle collision with borders
    if (x > width || x < 0) 
    {
      vx = -vx;
    }
    if (y > height || y < 0)
    {
      vy = -vy;
    }
    x += vx;
    y += vy;
    vy += GRAVITY;
  }
  
  //Draw  particle
  public void draw()
  {
    ellipse(x,y,size,size);
  }

  //Enlarge particle gradually
  public void enlarge()
  {
    size += 0.1f;
  }
  
  //Change particle colour 
  public void changeColour()
  {
    colourR = random(255);
    colourG = random(255);
    colourB = random(255); 
    fill(colourR,colourG,colourB,alpha--);
  }
  
  public boolean shouldRemove() 
  {
    return alpha <= 0;
  }
}
