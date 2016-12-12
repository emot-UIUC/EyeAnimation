class Eyeball{
  float x;
  float y;
  int diameter;
  
  float xmin;
  float xmax;
  
Eyeball(float tempD){
   x=tempD;
   y=200;
   diameter=250;
   
   xmin=width/4*1.1f-diameter/2;
   xmax=width/4*1.1f+diameter/2;
   
 }
  
void display(){
  noStroke();
  fill(255);
  ellipse(x,y,diameter,diameter);
  
}


  
  
  
  
  
}