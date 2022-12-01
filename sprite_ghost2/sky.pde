class Sky extends Sprite  //copy of parent Sprite
{
  Sky()
  {
    super();
    this.boxx = 1000;
    this.boxy = 600;
    this.reg.x = 0;
    this.reg.y = 0;
    this.velocity.x = -4;
    this.location.y = (height/2.0)-(this.boxy);
  }
 
  void check()
  {
    if(this.location.x <= -this.boxx-(width/2.0))
    {
      this.location.x = -(width/2.0)+(this.boxx * (nSky-1));
      this.currentAni = floor(random(0,this.nAni));
    }
  }
  
 
}
