ArrayList<Particle> nathan = new ArrayList<Particle>();

void setup()
{
  size(500, 500);
  noStroke();
}

void draw()
{
  background(255);
  
  if(mousePressed)
  {
    Brianna();
  }
  
  for(int i = 0; i < nathan.size(); i++)
  {
    Particle p = nathan.get(i);
    p.render();
  }    
}

void Brianna()
{
  nathan.add(new Particle());
  
  //for(int i = 0; i < nathan.size(); i++)
  //{
  //  Particle p = nathan.get(i);
  //  p.render();
  //}
}