class Ghost extends Sprite
{
  boolean isJump = false; //deciphers when jumping or running
  int nJump = 0;
  
  Ghost()
  {
   super(); //makes Ghost know everything that Sprite knows
   this.reg.x = boxx/2;
   this.reg.y = boxy/2;
  }
  
  void jump()
  {
    if(this.nJump < 3)
    {
     this.velocity.y = -6; 
     this.acceleration.y = 0.2;  //gravity for jump
     this.isJump=true;     //will jump when jump
     this.nJump = this.nJump + 1;    //can jump 3 times only
    }
  }
  
  void check()
  {
   //float actualY = screenX(this.location.x,this.location.y); //to make it stop at ground after jump
   if(location.y > (height/2)-200)
   {
    this.acceleration.y = 0;
    this.velocity.y = 0;
    this.location.y = (height/2)-200;
    println("landed");
    this.isJump = false;
    this.nJump = 0;  //jump counter
   }
   
   if(this.isJump)
   {
     if(this.velocity.y < 0)
     {
       this.currentAni = 2;  //up
     }
     else
     {
       this.currentAni = 3;  //down
     }
   }
   else
   {
     this.currentAni = 0;  //ground, displays first ani 
   }
  }
}
  
