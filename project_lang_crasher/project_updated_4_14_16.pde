import java.util.LinkedList;

int value=0;
int abc = 0;
int cols = 8;
int rows = 8;
int health = 1;
int[][] myArray = new int[cols][rows];
 
String[] languages = { "java", "c++", "python" , "c#", "javascript", "haskell","ruby" }; 
seek_empty() {}
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
     //******************************************************   
        textAlign(CENTER,CENTER);
        ellipseMode(RIGHT);
        fill(0); 
        textAlign(CENTER,CENTER);
        text(languages[lang], endx,y);

        //size(500,500);
        /*
        size (800,800);
         for (int i = 0; i < cols; i++) {
            for (int j = 0; j < rows; j++) {
              myArray[i][j] = (int)random(languages.length-1) + 1;
             }
        */
         }
        
}
 
  LinkedList<Objects> fallingObjects;
  LinkedList<Objects> new_fallingObjects;
   
  void setup()
  {
    fallingObjects = new LinkedList<Objects>();
    new_fallingObjects = new LinkedList<Objects>();
    
    textAlign(CENTER,CENTER);
    ellipseMode(RIGHT);
    //size(500,500);
    size (800,800);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        myArray[i][j] = (int)random(languages.length-1) + 1;
      }
  }
  
 remove();
 seek_empty();
 /*
  textSize(32);
  text("Welcome to language Crasher",600,600);
  fill(0,102,153);
  */
}
void draw() {
  background(#330000);
  for (int i = 0; i < cols; i++) 
  {
    for (int j = 0; j < rows; j++)
    {
      fill(#ccffcc);
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
  /*
        fill(0);
        rect(endx, endy, 64, 64);     
        fill(255);
        ellipse(endx,y,48,48); 
        textAlign(CENTER,CENTER);
        ellipseMode(RIGHT);
        //size(500,500);
        size (800,800);
         for (int i = 0; i < cols; i++) {
            for (int j = 0; j < rows; j++) {
              myArray[i][j] = (int)random(languages.length-1) + 1;
             } */
        
}

      // this is the definition for our custom MovingCircle object,
// start with the name of the class (or type of object)
 
  



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
      remove();
      
      
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
  
//It deletes the 3 similar languages which are in a row or a column.
public seek_empty()
{
  for (int i = 0; i < cols; i++) {
      //for (int j = 0; j < rows; j++) {
          if(myArray[i][j]=0){
            return i;}
          
          
      /*}
   for(int y = 1; y < rows-1; y++)
    for(int x = 0; x < cols; x++)
      if(myArray[x][y] == myArray[x][y-1] && myArray[x][y] == myArray [x][y+1]) {
        myArray[x][y] = myArray[x][y-1] = myArray[x][y] = myArray [x][y+1] = 0;
      } */
  }
}
void remove()
{                                         

  for(int y = 0; y < rows; y++)
    for(int x = 1; x < cols-1; x++)
      if(myArray[x][y] == myArray[x-1][y] && myArray[x][y] == myArray [x+1][y]) {
        myArray[x][y] = myArray[x-1][y] = myArray[x][y] = myArray [x+1][y] = 0;
      }

  for(int y = 1; y < rows-1; y++)
    for(int x = 0; x < cols; x++)
      if(myArray[x][y] == myArray[x][y-1] && myArray[x][y] == myArray [x][y+1]) {
        myArray[x][y] = myArray[x][y-1] = myArray[x][y] = myArray [x][y+1] = 0;
      }
   

}