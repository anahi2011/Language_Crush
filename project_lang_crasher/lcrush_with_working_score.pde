import java.util.LinkedList;
//import processing.sound.*;
//SoundFile file;

int value=0;
int abc = 0;
int cols = 8;
int rows = 8;
int health = 1;
int[][] myArray = new int[cols][rows];

//***********************Timer****************
PFont font;
String message = "Language Crush";
String time = "60";//here is the count down time
String timer = "Time: ";
int t;
int interval = 60;
int score = 0;
 
String[] languages = { "Java", "C++", "Python" , "C#", "JavaScript", "Haskell","Ruby" }; 

class Objects {
  float y, vy, ay;
  
  boolean alive = true;
  
  void update(float dt) {
    y += vy * dt;
    vy += ay * dt;
  }
  
  void draw() { }
}

class Ball extends Objects 
{
      int endx, endy;
      int lang;
      
      Ball(int ballx, int bally, int endy, int language) {
        y = bally;
        endx = ballx;
        this.endy = endy;
        ay = 0.1;
        lang = language;
      }
      
      void update(float dt) {
        super.update(dt);
        
        if(floor(y) == endy) 
          alive = false;
      }      
      
      void draw() {
        fill(0);
        rect(endx, endy, 64, 64);
        fill(255);
        ellipse(endx,y,48,48);   
        textAlign(CENTER,CENTER);
        ellipseMode(RIGHT);
        fill(0); 
        textAlign(CENTER,CENTER);
        text(languages[lang], endx,y);

         }
        
}
 
  LinkedList<Objects> fallingObjects;
  LinkedList<Objects> new_fallingObjects;
   
  void setup()
  {
    fallingObjects = new LinkedList<Objects>();
    new_fallingObjects = new LinkedList<Objects>();
    //********************message*******************
    font = createFont ("Arial", 30);// font for timer
    //***********************************************
    stroke(204, 102, 0);
    rect(0, 0, 700, 700);
    textAlign(CENTER,CENTER);
    ellipseMode(RIGHT);
    size (700,700);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        myArray[i][j] = (int)random(languages.length-1) + 1;
      }
  }
  
 remove();
 seek_empty();

}
void draw() {
  background(#f2eaf2);
  //********************************
  //Here is the score part
  textSize(34);
  fill(random(255),0,0);
  text("Score: " + score, 600, 50);
  
  
  //***********Timer function to draw a timer*********
  // here is the function for the timer
  {
  t= interval -int(millis()/1000);
  time = nf(t , 3);
  if(t<=0){
    text("Game Over", 600,400);
    noLoop();
    interval +=60;}
    textFont (font);
    textSize(64);
    text(message,260,600);
    textSize(54);
    text(timer, 610, 550);
    text(time, 600,600);
    textSize(10);
  }
  
  for (int i = 0; i < cols; i++) 
  {
    for (int j = 0; j < rows; j++)
    {
      fill(#ffa700);
      if(myArray[i][j] != 0) {
        ellipse(64*i, 64*j,50,50); 
        //rect(width/cols, height/rows, width/3, height/18); // shuffle value
        fill(0); 
        textAlign(CENTER,CENTER);
        text(languages[(myArray[i][j]) % languages.length], 64*i + 25,64*j + 25);
        fill(255, 0, 0);
      }
    }
  }
 
}
 

// we need to check whether the clicked language is adjacent to the first selected language, if true, then swap else ignore the frst selection.

boolean first_click = true;
int first_click_x, first_click_y;

void mouseClicked(){
  int circlex = mouseX / 64;
  int circley = mouseY / 64;
  
  if(first_click) {
    first_click_x = circlex;
    first_click_y = circley;
    first_click = false;
    println("First click");
  }
  else {
    if(abs(circlex - first_click_x) == 1 || abs(circley - first_click_y) == 1) {
      swap(circlex,circley,first_click_x,first_click_y);
      if(remove())
        score = score + 50;
      seek_empty();
     
    }
    else{
      ;
    }
    first_click = true;
  }
} 
  
  // source is the frst lang to swap
  // dest is the second lang to swap with the first one
 
  void swap(int cx1, int cy1, int cx2, int cy2){
    int temp = myArray[cx1][cy1];
    println(temp);
    println(myArray[cx2][cy2]);
    myArray[cx1][cy1] = myArray[cx2][cy2];
    myArray[cx2][cy2] = temp;
    
    
  }
  
//**************function to look for the empty spaces and makes them fall***********************
void seek_empty()
{
  //for(int k=0;k<cols; k++){
    //for (int l = 0; l < rows-1; l++) {
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows-1; j++) {
          if(myArray[i][j]!=0 && myArray[i][j+1] == 0){
              myArray[i][j+1] = myArray[i][j];
              myArray[i][j] = 0;
       
             }  
            }
        }
     // }
  //}
  
    
  
  
}
//******************************************************************************************************S
//********************************function to remove ***************************************************
boolean remove(){                                         

  boolean removed = false;
  for(int y = 0; y < rows; y++)
    for(int x = 1; x < cols-1; x++)
      if(myArray[x][y] != 0 && myArray[x][y] == myArray[x-1][y] && myArray[x][y] == myArray [x+1][y]) {
        myArray[x][y] = myArray[x-1][y] = myArray[x][y] = myArray [x+1][y] = 0;
        removed = true;
      }

  for(int y = 1; y < rows-1; y++)
    for(int x = 0; x < cols; x++)
      if(myArray[x][y] != 0 && myArray[x][y] == myArray[x][y-1] && myArray[x][y] == myArray [x][y+1]) {
        myArray[x][y] = myArray[x][y-1] = myArray[x][y] = myArray [x][y+1] = 0;
        removed = true;
      }

  return removed;
}
