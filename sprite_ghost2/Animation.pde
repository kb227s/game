 class Animation
{
 int nFrames = 0;
 PShape[] frames;  //array of frames
 int counter = 0;  //help us specify frames and when
 int speedcount = 0;
 int speed = 5;  //every 5 frame counts, change the frames
 float w = 10;
 float h = 10;
 int frameCounter = 0;
 
 Animation(String[] filenames) //constructor
 {
   this.nFrames = filenames.length;  //# of files will be # of frames
   this.frames = new PShape[this.nFrames];  
   for(int i= 0; i < this.nFrames; i = i + 1)  //creates the loop
   {
     this.frames[i]=loadShape(filenames[i]);
   }
   this.w = this.frames[0].width;
   this.h = this.frames[0].height;
 }
 
 void display()
 {
   this.counter = this.counter + 1;
   if(this.counter > this.speed)
   {
    this.counter = 0; 
    this.frameCounter = this.frameCounter + 1;
    
    if(this.frameCounter >= this.nFrames) this.frameCounter = 0;
   }
  shape(this.frames[frameCounter],0,0,this.w,this.h);
 }
 
}
