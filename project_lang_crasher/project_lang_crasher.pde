


//this part will draw a grid to place all the objects
//size(512,512);
/*
for(int i=0; i<width; i+=48){
   line(i,0,i,height);
 }
 for(int w=0; w<height; w+=48
 ){
   line(0,w,width,w);
 }
 */
 //draw a circle inside of each box
 //in a grid form with random colors
/* noStroke();
 background(23, 100, 240);
 
 float x=0;
 while(x < width) {
   float y= 0;
   while(y<height){
     if(random(100)>50){
     fill(random(100,150)); //randomly create circles with differnt colors
     }
     else{
      fill(random(0,105));
     }
   ellipse(x,y,40,40);
   
   y=y+40;
   }
   x=x+40;
 }
 */
 
int value=0;
int abc = 0;
int cols = 4;
int rows = 4;
int[][] myArray = new int[cols][rows];
 
void setup()
{
  textAlign(CENTER,CENTER);
  ellipseMode(CENTER);
  size(500,500);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      myArray[i][j] = abc++;
    }
  }
}
 
void draw() {
  
  
  background(#330000);
  for (int i = 0; i < cols; i++) 
  {
    for (int j = 0; j < rows; j++)
    {
      fill(#ccffcc);
      ellipse(64*i, 64*j,50,50);
      //rect(width/cols, height/rows, width/3, height/18); // shuffle value
      fill(0);
      text("java", 60, 20);
      fill(255, 0, 0);
    }
  }
}

      // this is the definition for our custom MovingCircle object,
// start with the name of the class (or type of object)
 
class MovingCircle 
{
 
  // any variable declared here will be properties of
  // objects of this type 
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float circleSize;
 
  // this special function declaration has the same name
  // as the class (MovingCircle) and it has no return type. This
  // is known as the constructor and it's run when an 
  // object of this type is created.
   
  MovingCircle(float xpos, float ypos, float csize) 
    {
      x = xpos;
      y = ypos;
      circleSize = csize;
       
      xSpeed = random(-10, 10);
      ySpeed = random(-10, 10);
       
    }
 
  // update adds the speed to the position, making
  // our circle move around.
  void update() 
    {
      x += xSpeed;
      y += ySpeed; 
    }
}
      //text(myArray[i][j], "java", "hello");
     // text(i+","+j, 15+ 50*j, 10+ 50*i);
      //text("shuffle", width/2 -20, height/18*17.7);
      //text(myArray[i][j], 30+ 50*j, 40+ 50*i);
    
    /*
    
 
void shuffleArray(int[][] a) {
  int nbrCols = a.length;
  int nbrRows = a[0].length;
  for (int c = 0; c < nbrCols; c++) {
    for (int r = 0; r < nbrRows; r++) {
      int nc = (int)random(nbrCols);
      int nr = (int)random(nbrRows);
      int temp = a[c][r];
      a[c][r] = a[nc][nr];
      a[nc][nr] = temp;
    }
  }
}
 
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
  }

*/
