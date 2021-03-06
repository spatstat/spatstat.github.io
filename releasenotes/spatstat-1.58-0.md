---
title: spatstat 1.58-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.58-0

### 09 January 2019

   We thank Andrew Bevan, Hamidreza Heydarian and Andrew P Webster
   for contributions.

### OVERVIEW

 * Mark-mark scatter plot.

 * Standard error calculation for inverse-distance weighting

 * Minor improvements and extensions.

 * Version nickname: 'Drop Bear'

### NEW FUNCTIONS

 * markmarkscatter  
    Mark-mark scatterplot

### SIGNIFICANT USER-VISIBLE CHANGES

 * idw  
    Standard errors can now be calculated by setting 'se=TRUE'.

 * im.apply  
    Computation accelerated, especially when NA's are absent.  
    New arguments 'fun.handles.na' and 'check'.

 * kppm, dppm, clusterfit  
    Changed precedence rule for handling the algorithm parameters  
    in the minimum contrast algorithm. Individually-named arguments  
    'q,p,rmax,rmin' now take precedence over entries  
    with the same names in the list 'ctrl'.

 * rotmean  
    Improved algorithm stability

 * summary.kppm  
    Prints more information about algorithm convergence.

 * closepairs.pp3, crosspairs.pp3  
    Argument 'what' can take the value "ijd"

 * plot.onearrow  
    Graphical parameters, specified when the object was created,  
    are now taken as the defaults for graphical parameters to the plot.

### BUG FIXES

1. rotmean  
     When result="im" the resulting image did not have the same dimensions  
     as the input. [Spotted by Hamidreza Heydarian.]  
     Fixed.

2. rotmean  
     If argument 'origin' was given, and if result="im" was specified,  
     the resulting image was wrongly displaced.  
     Fixed.

3. runifpointx  
     Result was mangled when n=0 or n=1.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.58-0.txt).
