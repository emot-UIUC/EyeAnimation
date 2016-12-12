class Blob{
  float yoff=0;
  float r;
  float a =0;
  
 Blob(float radius){
   
  r = radius; 
   
   
 }
  
  void display(){
     translate(width / 2, height / 3-100); // location of the blob
    float b=r;
    float b2=r;
  fill(#FC732E);
  
    if (data != null)
  {  
    beginShape();
    for (int i = 0; i < data.length-1; i++)
    {
      if(i != data.length-1){
        //stroke(0);
       // strokeWeight(3);
        //line(i, map(data[i], -32768, 32767,height,height/2), i+1, map(data[i+1], -32768, 32767,height,height/2));
        float offset = map(data[i], -32768, 32767,-30,30);
        float offset2 = map(data[i+1], -32768, 32767,-30,30);
        b = b + offset;
        b2 = b2 + offset2;
        float x = (b+15) * cos(a);
        float y = (b-5) * sin(a);
        float x2 = (b2+15) * cos(a+0.1);
        float y2 = (b2-5) * sin(a+0.1);
        vertex(x, y); 
        vertex(x2, y2); 
        a+=0.1;
        if(a>TWO_PI){
         a=0; 
        }
      }
    }
     endShape();
  }
  
  //translate(width / 2, height / 2);
  //float b=r;
  //fill(255);
  //beginShape();
  //float xoff = 0;
  //for (float a = 0; a < TWO_PI; a += 0.1) {
  //  float offset = map(noise(xoff,yoff), 0, 1, -10, 10);
  //  b = b + offset;
  //  float x = b * cos(a);
  //  float y = b * sin(a);
  //  vertex(x, y);
  //  xoff += 0.01;
  //  //ellipse(x, y, 4, 4);
  //}
  //endShape();

  //yoff += 0.01;
}




    
    
  }