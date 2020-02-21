---
title: spatstat 1.63-1 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.63-1

### 21 February 2020

   

### OVERVIEW

 * Enhancement to plot.linim

 * Fill missing pixel values by taking the nearest defined pixel value.

 * Minor improvements and bug fixes.

 * spatstat now requires spatstat.utils version 1.17-0.

 * Version nickname: 'Made from recycled electrons'

### NEW FUNCTIONS

 * is.linim  
    Tests whether an object belongs to class 'linim'.

 * nearestValue  
    Given a pixel image on a subset of a rectangle,  
    extend the image to the entire rectangle,  
    using the nearest well-defined pixel value.

### SIGNIFICANT USER-VISIBLE CHANGES

 * markconnect  
    Runs faster and handles much larger datasets.

 * markvario  
    Runs faster and handles much larger datasets.

 * markcorr, markconnect, markvario   
    The 'weights' can now be an expression to be evaluated,  
    or a function, or a pixel image, as well as a numeric vector.

 * Smooth.ppp  
    The 'weights' can now be an expression to be evaluated,  
    or a function, or a pixel image, as well as a numeric vector.

 * rpoislpp  
    If 'lambda' is a list of 'linim' or 'linfun' objects, then  
    the argument L can be omitted.

 * plot.linim  
    New argument 'fatten' improves visual appearance when style="colour".

 * plot.im, plot.owin  
    The coordinate axes will be plotted if axes=TRUE.  
    Axis labels xlab, ylab will be plotted if ann=TRUE.

 * bugfixes  
    If sincedate="all" or sinceversion="all", then all bugs will be listed.

 * Jfox  
    New argument 'warn.trim' makes it possible to suppress repeated warnings.

 * requireversion  
    New argument 'fatal'

### BUG FIXES

1. predict.rhohat, simulate.rhohat  
     When applied to a 'rhohat' object computed from  
     linear network data (lpp or lppm), there was a warning  
     about the lengths of vectors, and the results were incorrect.  
     Fixed.

2. predict.rhohat, simulate.rhohat  
     Crashed when applied to a 'rhohat' object computed from *multitype*   
     linear network data (multitype lpp or lppm).  
     Fixed.

3. Jfox  
     envelope() commands using the summary function 'Jfox'  
     crashed sometimes with a message about illegal spacing of 'r' values.  
     Fixed.

4. leverage, influence, dfbetas  
     Crashed when applied to an 'ippm' object in which  
     the irregular components of the score, but not the Hessian,  
     were provided by symbolic differentiation.  
     Fixed.

5. parres  
     Crashed in rare circumstances, when the data did not contain  
     enough useable values to perform smoothing.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.63-1.txt).
