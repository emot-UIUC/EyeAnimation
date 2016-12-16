import ketai.sensors.*;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

KetaiAudioInput mic;
short[] data;

Context context;
SensorManager manager;
Sensor sensor;
AccelerometerListener listener;

Eyeball eL;
Eyeball eR;
Blob blob;

float ax, ay, az, nax,nay;
float yPos=0;
float yDir=1;
float x1, y1;

float t;
int i;
float Pmin = 50;
float Pmax = 130;

void setup() {
  
  fullScreen();  
  
  mic = new KetaiAudioInput(this);
 
 
  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  listener = new AccelerometerListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);

  eL= new Eyeball(width/4*1.1f);
  eR= new Eyeball(width/4*3);
  blob = new Blob(120);

}

void draw() {
  background(#FFE708); 
  noStroke();
  eL.display();    // ellipse(width/4*1.1f, 200, 250,250);
  eR.display();   // ellipse(width/4*3, 200, 250,250);
 
  pupil(width/4*1.1f-5,200);     //Left
  pupil(width/4*3-5, 200);  //Right

 //eyelid
 /*if(random(100)<2) {
  eyelid();
 }
 */
 
 if(i>3 && i<300){
   angry();
   i++;
 } else if (i>300){
  i=0; 
 }

 blob.display();
 
 
}

 
void mousePressed(){
  if(mic.isActive())
    mic.stop();
  else
    mic.start();
  i++;  
 }
 
void onAudioEvent(short[] _data)
{
  data= _data;
}

public void pupil(float pupilx, float pupily){
   int i=0xff1585E5; //pupil color
  
   nax= map(ax*10,-25,25,pupilx-eL.diameter/2, pupilx+eL.diameter/2);
   nay= map(ay*10,110,-1,pupily-eL.diameter/2,pupily+eL.diameter/2);
   
   x1=lerp(pupilx,nax,0.2);
   y1=lerp(pupily,nay,0.2);
   
   noStroke();
   fill(i);
   ellipse(x1, y1, 150,170);
   fill(0xff52B0FF);
   ellipse(x1, y1, 100,100);

}

public void eyelid(){
  
 fill(0xffF7E111);
 
 t=t+0.01;
 yPos=noise(t);
 yPos=map(yPos,0,1,100,500);
 ellipse(width/4*1.1f, 0, 500,yPos);
 ellipse(width/4*3, 0, 500, yPos);
 
 yPos=yPos+yDir*1;
 if(yPos>500)
 { yDir=-1; }
 else if(yPos<0)
 { yDir=1; }
 
}

public void angry() {
  
 fill(0xffF7E111);
 noStroke();
 arc(width/4*1.1f, 210, 300, 300,  -PI+QUARTER_PI,0, CHORD);
 arc(width/4*3, 210, 300, 300, -PI,-QUARTER_PI, CHORD);
  
}

class AccelerometerListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    ax = event.values[0];
    ay = event.values[1];
    az = event.values[2];    
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}