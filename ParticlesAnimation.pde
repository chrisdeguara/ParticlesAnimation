import processing.opengl.*;
import java.util.LinkedList;

int x, y;
LinkedList particles = new LinkedList();
int maxVelocity = 5;
boolean showFirework = false;
PFont font;

void setup()
{
  size(512,512,OPENGL);
  smooth();
  font = loadFont("AgencyFB-Reg-48.vlw");
}

void draw()
{
  background(0);
  color(255);
  textFont(font);
  textSize(20);
  
  text(frameRate, 0,50);
  text(particles.size(), 75,50);
  
  //Add a new particle to the LinkedList
  Particle newP = new Particle(mouseX, mouseY, (int)random(10)-maxVelocity, (int)random(10)-maxVelocity, 7, 255, 0, 0, 255);
  particles.add(newP);

  //Loop through all particles, delete faded ones and show the rest
  for (int i = 0; i < particles.size(); i++)
  {
    Particle p = (Particle)particles.get(i);
    
    //Remove faded particles
    if (p.shouldRemove())
    {
      particles.remove(i);
    }
    p.update();
    p.enlarge();
    p.changeColour();
    p.draw();
  }  
}
