import processing.sound.*;
SoundFile beep;  

int gameState = 0; //0 startscreen, 1 is gameplay, 2 is death

Ghost s; 
Ground[] g;  //made array instead of Groung g1,g2,g3
int nGround = 0;
Sky[] k;
int nSky = 0;
Fence[] f;
int nFence = 0;
Hill[] h;
int nHill = 0;
Boulder b;


void setup()
{
  size(800,600);
  //beep = new SoundFile(this,"wind.wav");
  reset();
}

void draw()
{
  if(gameState == 0) startScreen();
  if(gameState == 1) gamePlay();
  if(gameState == 2) deadScreen();
}

void keyPressed()
{
  if(gameState == 0) gameState = 1;
  if(gameState == 1) s.jump();
  if(gameState == 2)
  {
   reset();
   gameState = 1;
  }
}

void reset()
{
  s = new Ghost(); 
  s.location.x = (-width/2)+100;
  s.location.y = (height/2)-200;
  String[] files = {"ghosts1.svg","ghosts2.svg"}; //created 2 element arrays w/ those filenames
  s.addAnimation(files,15);
  String[] files1 = {"ghosts1.svg","ghosts2.svg"}; //for changing its direction when it flips, would make new svg files
  s.addAnimation(files1,15);
  String[] files2 = {"ghostsUp.svg"}; //for jump
  s.addAnimation(files2,15);
  String[] files3 = {"ghostsDown.svg"}; //for jump
  s.addAnimation(files3,15);
  s.currentAni = 0;
  
  nGround = ceil(width/1000.0)+1;          //ceiling 
  
  g = new Ground[nGround];                 //creates an array for g1,g2,g3
  println(nGround);
  String[] files4 = {"ground1.svg"};       //for jump
  for(int i =0; i < nGround; i = i + 1)    //creates array loop
  {
    g[i] = new Ground();
    g[i].addAnimation(files4,15);
    g[i].location.x = -(width/2.0)+(g[i].boxx * i);
  }
  
  nSky = ceil(width/1000.0)+1;          //ceiling
  
  k = new Sky[nSky];                 //creates an array
  println(nSky);
  String[] files5 = {"sky.svg"};
  for(int i =0; i < nSky; i = i + 1)    //creates array loop
  {
    k[i] = new Sky();
    k[i].addAnimation(files5,15);
    k[i].location.x = -(width/2.0)+(k[i].boxx * i);
  }
  
    nFence = ceil(width/1000.0)+1;          //ceiling
  
  f = new Fence[nFence];                 //creates an array
  println(nFence);
  String[] files6 = {"fence.svg"};
  for(int i =0; i < nFence; i = i + 1)    //creates array loop
  {
    f[i] = new Fence();
    f[i].addAnimation(files6,15);
    f[i].location.x = -(width/2.0)+(k[i].boxx * i);
  }
  
  
  String[] files7 = {"boulder1.svg"};
  String[] files8 = {"boulder2.svg"};
  b = new Boulder();
  b.addAnimation(files7,10);
  b.addAnimation(files8,10);

    nHill = ceil(width/1000.0)+1;          //ceiling
  
  h = new Hill[nHill];                 //creates an array
  println(nHill);
  String[] files9 = {"hills.svg"};
  for(int i =0; i < nHill; i = i + 1)    //creates array loop
  {
    h[i] = new Hill();
    h[i].addAnimation(files9,15);
    h[i].location.x = -(width/2.0)+(h[i].boxx * i);
  }

}

void startScreen()
{
  noStroke();
  fill(100);
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER,CENTER);
  text("Avoid the open graves and dirt. Press ANY key to begin.", width/2, height/2);
}

void deadScreen()
{
  noStroke();
  fill(0);
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER,CENTER);
  text("You died... again. Press ANY key to give it another go.", width/2, height/2);
}

void gamePlay()
{
  background(255);
  translate(width/2,height/2);
  
  for(int i =0; i < nSky; i = i + 1)  //creates array loop
  {
    k[i].update();
    k[i].check();
    k[i].display();
  }
  
  for(int i =0; i < nHill; i = i + 1)  //creates array loop
  {
    h[i].update();
    h[i].check();
    h[i].display();
  }
  
    for(int i =0; i < nFence; i = i + 1)  //creates array loop
  {
    f[i].update();
    f[i].check();
    f[i].display();
  }
  
  for(int i =0; i < nGround; i = i + 1)  //creates array loop
  {
    g[i].update();
    g[i].check();
    g[i].display();
  }
  
  
  b.update();
  b.check();
  b.display();
  
  s.update();
  s.check();
  s.display();
}
