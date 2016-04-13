



 
int value=0;
int abc = 0;
int cols = 8;
int rows = 8;
int[][] myArray = new int[cols][rows];
 
String[] languages = { "java", "c++", "python" , "c#", "javascrip" }; 
 
void setup()
{
  textAlign(CENTER,CENTER);
  ellipseMode(RIGHT);
  size(500,500);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      myArray[i][j] = (int)random(languages.length-1) + 1;
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

void mousePressed()
{
  
  
  int cx = mouseX / 64;
  int cy = mouseY / 64;
  
  //myArray[cx][cy] = 0;
  fill(cx,cy,myArray[cx][cy]);
}


void fill(int x, int y, int l){
  if(l == 0 || x < 0 || y < 0 || x >= 8 || y >= 8 )
    return;
  //l= languages[mousePress()];
  if(myArray[x][y] != l)
    return;
  myArray[x][y] = 0;
  fill(x-1,y,l);
  fill(x+1,y,l);
  fill(x,y-1,l);
  fill(x,y+1,l);
  
  
}
      // this is the definition for our custom MovingCircle object,
// start with the name of the class (or type of object)
 /*
class MovingCircle 
{
 
  // any variable declared here will be properties of
  // objects of this type 
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float circleSize;
  boolean show = true;
 
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
*/

void hide()
  {
    // Maybe you'll want to do some fun stuff here
    //show = false;
  }

/*
public boolean hasDuplicatesInRows(String[][] languages)
{
    for (int row = 0; row < languages.length; row++)
    {
        for (int col = 0; col < languages[row].length; col++)
        {
            String lang = languages[row][col];
            for (int otherCol = col + 1; otherCol < languages.length; otherCol++)
            {
                if (lang == languages[row][otherCol])
                {
                    languages.hide();
                }
            }
        }
    }

    return false;
}
*/     
    
    