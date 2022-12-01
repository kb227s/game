class Sprite
{
  PVector location = new PVector(0,0);
  PVector velocity = new PVector(0,0);
  PVector acceleration = new PVector(0,0);
  float boxx = 100;
  float boxy = 150;
  PVector reg = new PVector(boxx/2,boxy/2);
  Animation[] ani = new Animation[10];
  int nAni = 0;
  int currentAni = -1; 
  
  Sprite()
  {
    
  }
  
  void addAnimation(String[] filenames, int speed)
  {
    if(nAni < 10)
    {
     this.ani[nAni] = new Animation(filenames); 
     this.ani[nAni].speed = speed;
     this.ani[nAni].w = boxx;
     this.ani[nAni].h = boxy;
     nAni = nAni + 1;
     currentAni = nAni-1;
    }
  }
  
  void update()
  {
    this.velocity = this.velocity.add(this.acceleration);
    this.location = this.location.add(this.velocity);
  }
  
  void check()
  {
    float actualX = screenX(this.location.x,this.location.y);
   if(actualX > width+boxx) 
   {
     this.velocity.mult(-1);  //makes sprite turn around & go backwards
     this.currentAni = 1;
   }
   if(actualX < -boxx) 
   {
     this.velocity.mult(-1);
     this.currentAni = 0;
   }
  }
  
  void display()
  {
    pushMatrix();
      translate(this.location.x,this.location.y);
      noStroke();
      //circle(0,0,10);
      fill(color(0,200,0,50));
      circle(0,0,min(boxx,boxy));        //min = given 2 values, returns smaller value
      //rect(boxx,boxy,100,200);  <-- ?? rect around dug grave
      translate(-reg.x,-reg.y);

      fill(10,50,255,10);
      rect(0,0,boxx,boxy);
      if(currentAni > -1) ani[currentAni].display();
    popMatrix();
  }
  
  void jump()
  {
    
  }
}
