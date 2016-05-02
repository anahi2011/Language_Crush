int value=0;
int abc = 0;
int cols = 8;
int rows = 8;
int health = 1;
int[][] myArray = new int[cols][rows];
PFont font;// this is for our timer font
String time = "20";//here is the count down time
int t;
int interval = 60;
 
String[] languages = { "java", "c++", "python" , "c#", "javascript" }; 
 
void setup()
{
  font = createFont ("Arial", 30);// font for timer
  textAlign(CENTER,CENTER);
  ellipseMode(LEFT);
  size(800,800);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      myArray[i][j] = (int)random(languages.length-1) + 1;
    }
  }
  
  remove();
}
 
void draw() {
 
  
  background(#330000);
  // here is the function for the timer
  {
  t= interval -int(millis()/1000);
  time = nf(t , 3);
  if(t<=0){
    println("Game Over");
    noLoop();
    interval +=60;}
    textSize(34);
    text(time, 600,600);
    textSize(10);
  }
  //
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

void remove(){                                         

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
/*
// objects above the removed ones need to fall now

void fall(){
    
}
 /*
void mouseReleased() {
  if (value == 0 && mouseX > width/3 && mouseX < width/3 + width/3 && mouseY > height/18*17 && mouseY < height/18*17 + height/18) { 
    shuffleArray(myArray);
  }
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (value == 0 && mouseX > 25+(50*i) && mouseX < 25+(50*i) +25 && mouseY > 50*j && mouseY < (50*j)+25) {
        value = 255;
        println("1st value"+ j);
        println("2nd value"+ i );
        fill(0, 255, 0);
        ellipse(25+(50*i), 50*j, 25, 25);
 
        int getal = myArray[j][i] ;          
        println("number: "+ getal);
 
        if (j == 3 && i == 5) {
          println("oki!");
        }
        rect(25+(50*i), 50*j, 25, 25);
      }
      else {
        value = 0;
      }
    }
  }}
*/