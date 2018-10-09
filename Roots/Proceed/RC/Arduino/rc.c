#include "rc.h"

void init_rc()
{
  pinMode(F, OUTPUT);
  pinMode(B, OUTPUT);
  pinMode(R, OUTPUT);
  pinMode(L, OUTPUT);
}

void forward()
{
  digitalWrite(F, HIGH);
  digitalWrite(B, LOW);
}

void reverse()
{
  digitalWrite(F, LOW);
  digitalWrite(B, HIGH);
}

void rest()
{
  digitalWrite(F, LOW);
  digitalWrite(B, LOW);
}

void right()
{
  digitalWrite(R, HIGH);
  digitalWrite(L, LOW);
}

void left()
{
  digitalWrite(R, LOW);
  digitalWrite(L, HIGH);
}

void straight()
{
 digitalWrite(R, LOW);
 digitalWrite(L, LOW); 
}