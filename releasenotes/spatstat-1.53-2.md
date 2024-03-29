---
title: spatstat 1.53-2 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.53-2

### 08 October 2017

   We thank Christophe Biscio and Rasmus Waagepetersen for contributions.

### OVERVIEW

 * Correction to 'lohboot'

 * Improvements to ppm and update.ppm

 * Bug fixes and minor improvements.

 * Nickname: "Quantum Entanglement"

### NEW FUNCTIONS

 * fitin.profilepl  
    Extract the fitted interaction from a model fitted by profile likelihood.

### SIGNIFICANT USER-VISIBLE CHANGES

 * ppm.ppp, ppm.quad  
    New argument 'clipwin'

 * update.ppm  
    For the case 'update(model, X)' where X is a point pattern,  
    if the window of X is different from the original window,  
    then the model is re-fitted from scratch (i.e. use.internal=FALSE).

 * plot.leverage.ppm  
    A contour line showing the average value of leverage  
    is now drawn on the colour ribbon, as well as on the main image.  
    New argument 'args.contour'.

### BUG FIXES

1. lohboot  
     Implementation was completely incorrect.  
     [Spotted and fixed by Christophe Biscio and Rasmus Waagepetersen.]  
     Fixed.

2. update.ppm  
     Did not always work correctly with formulae that included 'polynom()' terms.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.53-2.txt).
