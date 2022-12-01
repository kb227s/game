class Hill extends Sprite  //copy of parent Sprite
{
  Hill()
  {
    super();
    this.boxx = 1000;
    this.boxy = 600;
    this.reg.x = 0;
    this.reg.y = 0;
    this.velocity.x = -2;
    this.location.y = (height/2.0)-(this.boxy);
  }
 
  void check()
  {
    if(this.location.x <= -this.boxx-(width/2.0))
    {
      this.location.x = -(width/2.0)+(this.boxx * (nHill-1));
      this.currentAni = floor(random(0,this.nAni));
    }
  }
  
 
}
