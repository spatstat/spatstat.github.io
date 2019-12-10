---
title: spatstat 1.62-2 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.62-2

### 10 December 2019

   

### OVERVIEW

 * Urgent bug fixes and workarounds.

 * Version nickname: "Shape-shifting lizard"

### SIGNIFICANT USER-VISIBLE CHANGES

 * colourmap  
    Argument 'col' is now permitted to have length 1, representing  
    a colour map in which all values are mapped to the same colour.

 * lut  
    Argument 'outputs' is now permitted to have length 1, representing  
    a lookup table in which all inputs are mapped to the same output value.

### BUG FIXES

1. envelope  
     Crashed sometimes, with a message about unrecognised arguments,  
     when applied to a summary function created by the user.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.62-2.txt).
