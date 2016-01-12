---
title: spatstat 1.44-1 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.44-1

### 29 December 2015

   We thank Brian Ripley for contributions.

### OVERVIEW

 * Urgent bug fix.

 * More support for replicated point patterns.

 * More support for tessellations.

 * Version nickname: "Gift Horse"

### NEW FUNCTIONS

 * as.function.tess
   Convert a tessellation to a function(x,y). The function value
   indicates which tile of the tessellation contains the point (x,y).

 * tileindex
   Determine which tile of a tessellation contains a given point (x,y).

 * persp.leverage.ppm
   Method for persp plots for objects of class leverage.ppm

 * AIC.mppm, extractAIC.mppm
   AIC for point process models fitted to replicated point patterns.

 * nobs.mppm, terms.mppm, getCall.mppm
   Methods for point process models fitted to replicated point patterns.

### SIGNIFICANT USER-VISIBLE CHANGES

 * anova.mppm
   Now handles Gibbs models, and performs the
   adjusted composite likelihood ratio test.

 * update, step
   These functions now work for models of class 'mppm'.

 * textureplot
   Argument x can now be something acceptable to as.im

 * logLik.mppm
   New argument 'warn'.

### BUG FIXES

 1. nncross.lpp, nnwhich.lpp, distfun.lpp
  Caused a segmentation fault.
  [Spotted by Brian Ripley.]
  Fixed.

 2. anova.ppm
  If a single 'object' was given, and the object was a Gibbs model,
  then 'adjust' was effectively set to FALSE.
  Fixed.

