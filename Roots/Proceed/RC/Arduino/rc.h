#ifndef RC_H
#define RC_H

#ifdef __cplusplus
extern "C" {
#endif

#include <Arduino.h>

#define F 13
#define B 12
#define R 6
#define L 4

/* Sets pinmodes of constants */
void init_rc();

/* Motion */ 
void forward();
void reverse();
void rest();

/* Turning */
void left();
void right();
void straight();

#ifdef __cplusplus
}
#endif

#endif