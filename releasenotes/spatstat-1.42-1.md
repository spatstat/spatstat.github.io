---
title: spatstat 1.42-1 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.42-1

### 05 June 2015

   We thank Andrew Hardegen, Tom Lawrence, Robin Milne, Suman Rakshit,
   and Brian Ripley for contributions.

### OVERVIEW

 * Urgent bug fix.

 * More robust simulation of cluster processes.

 * Slightly accelerated.

 * Version nickname: 'Vogon Poetry'

### NEW FUNCTIONS

 * boundingbox.solist  
   Method for boundingbox for lists of spatial objects.

### SIGNIFICANT USER-VISIBLE CHANGES

 * rThomas, rMatClust, rCauchy, rVarGamma, rNeymanScott  
   New faster algorithm which is more robust against extreme values of  
   the parameters.

 * rNeymanScott  
   New argument 'nonempty' controls choice of algorithm.

 * solist, as.solist  
   Accelerated. 

 * as.list.hyperframe  
   Accelerated. 

### BUG FIXES

1. residuals.mppm  
    Brought some computers to a grinding halt, due to the bug in solist().  
    Fixed.

2. solist, as.solist  
    In rare cases, the format was corrupted, or the algorithm never terminated.  
    Fixed.

Release notes are available in raw text format [here](spatstat-1.42-1.txt).
