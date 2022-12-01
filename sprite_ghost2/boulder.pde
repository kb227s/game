class Boulder extends Sprite
{
  
  Boulder()
  {
    super();
    this.velocity.x = -5;
    this.location.y = (height/2.0)+200;  //position of frame 0
  }
    
    
  void check()
  {
    if(this.location.x <= -this.boxx-(width/2.0)) 
    {
      this.location.x = (width/2.0)+random(10,200);      //random boulder position (#,1000)<-- number of boulder in segments by 100?
      this.location.y = (height/2.0)-150;                 //boulder height
      this.currentAni = floor(random(0,this.nAni));
      this.boxx = this.ani[currentAni].frames[0].width/3;   //boulder size changes by the animation via box size
      this.boxy = this.ani[currentAni].frames[0].height/3;
      this.ani[currentAni].w = this.boxx;
      this.ani[currentAni].h = this.boxy;
      this.reg.x = this.boxx/2;
      this.reg.y = this.boxy/2;
    }
    if(this.collide())  
    {
     beep.play();
     gameState = 2;
    }
  }
  
  
  boolean collide()          //collision detection (when ghost hits boulder)
  {
    PVector s1 = new PVector(this.location.x,this.location.y);  //location vector of boulder
    PVector s2 = new PVector(s.location.x,s.location.y);         //locaton vector of ghost
    PVector d = s1.sub(s2);       //vector from boulder to zombie
    float dist = d.mag();         //length of the vector
    float limit = (min(this.boxx,this.boxy)/2)+ (min(s.boxx,s.boxy)/2);      //get the circle radius to get minimum distance for collision
    if(dist < limit) return(true);
    return(false);
  }
   
}
