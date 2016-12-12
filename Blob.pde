class Blob{
  float yoff=0;
  float r;
  
 Blob(float radius){
   
  r = radius; 
   
   
 }
  
  void display(){
    
  translate(width / 2, height / 2);
  float b=r;
  fill(255);
  beginShape();
  float xoff = 0;
  for (float a = 0; a < TWO_PI; a += 0.1) {
    float offset = map(noise(xoff,yoff), 0, 1, -1, 1);
    b = b + offset;
    float x = b * cos(a);
    float y = b * sin(a);
    vertex(x, y);
    xoff += 0.01;
    //ellipse(x, y, 4, 4);
  }
  endShape();

  yoff += 0.01;
}
    
    
    
  }