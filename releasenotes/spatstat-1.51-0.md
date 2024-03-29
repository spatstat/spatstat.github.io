---
title: spatstat 1.51-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.51-0

### 08 May 2017

   We thank Greg McSwiggan, Mehdi Moradi and Tammy L Silva for contributions.

### OVERVIEW

 * New fast algorithm for kernel smoothing on a linear network.

 * Leverage and influence diagnostics extended to Poisson/Gibbs models
   fitted by logistic composite likelihood.

 * Two-stage Monte Carlo test.

 * Dirichlet/Voronoi tessellation on a linear network.

 * Thinning of point patterns on a linear network.

 * More support for functions and tessellations on a linear network.

 * Improvements and bug fixes.

### NEW FUNCTIONS

 * bits.test
   Balanced Independent Two-Stage Monte Carlo test,
   an improvement on the Dao-Genton test.

 * lineardirichlet
   Computes the Dirichlet-Voronoi tessellation associated with a
   point pattern on a linear network.

 * domain.lintess, domain.linfun
   Extract the linear network from a 'lintess' or 'linfun' object.

 * summary.lintess
   Summary of a tessellation on a linear network.

 * clicklpp
   Interactively add points on a linear network.
    
 * envelopeArray
   Generate an array of envelopes using a function that returns 'fasp' objects.


### SIGNIFICANT USER-VISIBLE CHANGES

 * density.lpp
   New fast algorithm (up to 1000 times faster) for the default case
   where kernel="gaussian" and continuous=TRUE.
   Generously contributed by Greg McSwiggan.
    
 * leverage.ppm, influence.ppm, dfbetas.ppm
   These methods now work for models that were fitted by logistic
   composite likelihood (method='logi'). 
    
 * rthin
   Argument X can now be a point pattern on a linear network (class 'lpp').

 * fitted.ppm
   New option: type = "link"
    
 * update.kppm
   New argument 'evaluate'.

 * integral.linfun
   New argument 'delta' controls step length of approximation to integral.

 * as.linim.default
   New argument 'delta' controls spacing of sample points in internal data.

 * as.linfun.lintess
   New argument 'values' specifies the function value for each tile.
   New argument 'navalue'.

### BUG FIXES

1. leverage.ppm, influence.ppm, dfbetas.ppm
   Results for Gibbs models were incorrect due to a mathematical error.
   (Results for Poisson models were correct). 
   Fixed.
    
2. leverage.ppm, influence.ppm, dfbetas.ppm, ppmInfluence
   Calculations were incorrect for a Geyer model fitted using
   an edge correction other than "border" or "none".
   Fixed.
    
3. step, kppm, update.kppm
   'step' did not work for kppm objects in some cases
   due to a scoping problem in update.kppm.
   Fixed.
    
4. improve.kppm
   Crashed if the window was not a rectangle.
   Fixed.

5. pcf.ppp, pcfinhom
   Crashed if kernel="epa" rather than "epanechnikov".
   Fixed.

6. alltypes
   Crashed if envelope=TRUE and reuse=FALSE.
   Fixed.

7. pairdist.lpp, nndist.lpp, nnwhich.lpp, nncross.lpp
   Crashed if the network was disconnected.
   Fixed.

8. as.im.linim, as.linim.linim
   Additional arguments such as 'eps' and 'dimyx' were ignored.
   Fixed.
    
9. as.im.default
   Arguments 'eps and 'xy' were ignored if X was a single numeric value.
   Fixed.
    
10. 'timed' class
    Printing of these objects did not work in some locales.
    Fixed.

11. runifpoint
    Ignored 'drop' argument if the window was a rectangle.
    Fixed.


Release notes are available in raw text format [here](spatstat-1.51-0.txt).
