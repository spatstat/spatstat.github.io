---
title: spatstat 1.46-1 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.46-1

### 08 July 2016

   

### OVERVIEW

 * Important bug fix.

 * Version nickname: 'Spoiler Alert'

### BUG FIXES

1. density.ppp, Smooth.ppp  
     The results of density(X, at="points") and Smooth(X, at="points")  
     were incorrect in some cases. The contribution from the   
     left-most data point (the point with the smallest x coordinate)   
     was omitted.   [Bug introduced in spatstat 1.26-0, April 2012.]  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.46-1.txt).
