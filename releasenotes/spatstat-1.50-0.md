---
title: spatstat 1.50-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.50-0

### 23 March 2017

   We thank Richard Cotton, Adrian Heyner, Abdollah Jalilian,
   Dominic Schuhmacher and Rasmus Waagepetersen for contributions.

### OVERVIEW

 * spatstat now 'Imports' the package 'spatstat.utils'.

 * Bandwidth selection for pair correlation function.

 * Improvements and bug fixes.

### PACKAGE STRUCTURE

 * spatstat is being split into several sub-packages, to satisfy
    the requirements of CRAN. This should not affect the user:
    existing code will continue to work in the same way.
    Currently there are two sub-packages, called 'spatstat.utils'
    and 'spatstat'. Typing 'library(spatstat)' will load the familiar
    'spatstat' package which can be used as before, and will silently
    import the 'spatstat.utils' package. The 'spatstat.utils' package
    contains utility functions that were originally written for 'spatstat':
    they were undocumented internal functions in 'spatstat', but are now
    documented and accessible in a separate package because they may be
    useful for other purposes. To access these functions, you need to
    type 'library(spatstat.utils)'. 

### NEW FUNCTIONS

 * bw.pcf
 Bandwidth selection for pair correlation function.
 Original code contributed by Abdollah Jalilian and Rasmus Waagepetersen.

 * grow.box3
 Expand a three-dimensional box.


### SIGNIFICANT USER-VISIBLE CHANGES

 * as.owin
    Now refuses to convert a 'box3' to a two-dimensional window.

 * pixellate.ppp
    If the pattern is empty, the result is an integer-valued image
    (by default) for consistency with the results for non-empty patterns.

 * ppp
    If the coordinate vectors x and y contain NA, NaN or infinite values,
    these points are deleted with a warning, instead of causing a fatal error.

 * ppm
    Argument 'interaction' can now be a function that makes an interaction,
    such as Poisson, Hardcore, MultiHard.

 * pcf, pcfinhom
    New argument 'close' for advanced use.

 * runifpointx, rpoisppx
    New argument 'drop'.

 * shapley, ponderosa
    In these installed datasets, the functions shapley.extra$plotit
    and ponderosa.extra$plotit have changed slightly (to accommodate the
    dependence on the package spatstat.utils).

 * kppm
    Improved printed output.

### BUG FIXES

1. rMaternI, rMaternII
     If 'win' was a three-dimensional box of class 'box3', 
     the result was a two-dimensional point pattern.
     [Spotted by Adrian Heyner.]
     Fixed.

2. rmhmodel.ppm, simulate.ppm
     Crashed when applied to a fitted Lennard-Jones model.
     [Spotted by Dominic Schuhmacher.]
     Fixed.
    
3. leverage.ppm, influence.ppm, dfbetas.ppm
     Crashed when applied to some hard-core models.
     Fixed.

4. "[.ppx"
     The format of the result was slightly malformed 
     if exactly one point was selected.
     Fixed.

5. unmark.lpp, marks<-.lpp
     The result had class c("lpp", "lpp", "ppx") instead of c("lpp", "ppx").
     Fixed.

Release notes are available in raw text format [here](spatstat-1.50-0.txt).
