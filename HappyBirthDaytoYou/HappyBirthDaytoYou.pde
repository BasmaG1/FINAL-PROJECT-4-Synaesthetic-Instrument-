import processing.sound.*;
String filename = "piano.jpg";
PImage p;
int numsounds = 24;
String[] note={"c4","c4","d4","c4","f4","e4","c4","c4","d4","c4","g4","f4","c4","c4","c5","a4","f4","e4","d4","a5","a5","f4","g4","f4"};
int[] loc = {181, 190, 50, 180, 300,170,140,110,100,100,100,100,300,170,140,110,100,100,100,100,100,100,100,100,100};
int[] pause ={1000, 500, 500, 500, 500,500,1000,500,500,500,500,500,1000,500,500,500,500,500,500,1000,500,500,500,500};
int trigger;
int i;
SoundFile[] file;

void setup() {
 p = loadImage(filename);           // load
 size(660,385);           // set size to that of the image
 image(p, 0, 0);
 trigger = millis();
 file = new SoundFile[numsounds];  
 for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, note[i] + ".mp3");
  }
}

void draw() {  
  colorMode(RGB);  
  noStroke();
  fill(0, 200, 255);
  //rect(181, 245, 44, 105); //left,top,width,height
  if (i<numsounds)
  {
    if (millis()>trigger+pause[i])
   {
     image(p, 0, 0);
      
     int loc=notepos(note[i]);
     rect(loc, 245, 44, 105); //left,top,width,height     
     textSize(30);
     fill(0, 0, 0);
     text(note[i],loc+10,300);
     file[i].play(1, 1);
     trigger+=pause[i];
     i++;
   }  
  }
    //print ("millis:",millis(),"pause",trigger+pause[i],"i:",i);        print(char(10));
  if (i==numsounds)
  {
    image(p, 0, 0);
    textAlign(CENTER);
    textSize(75);
    fill(59, 118, 92);
    text  ("HAPPY BIRTHDAY!", width/2, height/2);
  }
}

int notepos(String note)
{
  char solfege=note.charAt(0);
  int octatve=int(note.substring(1,2));
  int loc=(int(solfege)-int('a'))*44+int(octatve-4)*60;
  print (int(solfege)," ", octatve," ",loc,char(10)); 
  return loc;
 
}
