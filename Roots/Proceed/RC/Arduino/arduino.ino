
#include "rc.h"

#define TIME 50

void setup() 
{
  init_rc();
  Serial.begin(115200);
}

void loop() 
{
  if(Serial.available() > 0)
  {
    int cmd = Serial.read();
    Serial.println(cmd);
    switch(cmd)
    {
      case 0: straight(); rest(); delay(TIME); break;

     // single command
      case 1: forward(); delay(TIME); break;
      case 2: reverse(); delay(TIME); break;
      case 3: right(); delay(TIME); break;
      case 4: left(); delay(TIME); break;

     //combination command
      case 6: right(); forward(); delay(TIME); break;
      case 7: left(); forward(); delay(TIME); break;     
      case 8: right(); reverse();  delay(TIME); break;     
      case 9: left(); reverse(); delay(TIME); break;
      
      default: Serial.print("Invalid Command\n"); break;
    }
  }
  else
  {
    straight();
    rest();
  }
}