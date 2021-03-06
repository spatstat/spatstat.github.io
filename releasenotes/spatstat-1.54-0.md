---
title: spatstat 1.54-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.54-0

### 21 November 2017

   We thank Rochelle Constantine, Lily Kozmian-Ledward,
   Ian Renner and Leigh Torres for contributions.

### OVERVIEW

 * New dataset 'cetaceans'.

 * Gamma correction for colour maps and image plots.

 * Class 'units' has been renamed 'unitname' to avoid package collision.

 * Bug fix in leverage code

 * Tighter bounding box for psp, lpp, linnet objects.

 * Improved layout in plot.solist

 * Tools to increase colour saturation.

 * Connected components of a 3D point pattern.

 * Accelerated computations on linear networks.

 * Accelerated simulation of determinantal point processes.

 * Improved printing of 3D point patterns.

 * Minor corrections to handling of unitnames.

 * Nickname: 'Vacuous Mission Statement' 

### NEW DATASETS

 * cetaceans  
    Nine replicates of a marine survey in New Zealand,  
    consisting of recorded sightings of dolphins, whales and other species.  
    Generously contributed by Lily Kozmian-Ledward, Rochelle Constantine  
    and Leigh Torres.

### NEW FUNCTIONS

 * to.saturated  
    Convert a colour value to the corresponding fully-saturated colour.

 * intensity.psp  
    Compute the average total length of segments per unit area.

 * boundingbox.psp  
    Bounding box for line segment patterns.  
    This produces a tighter bounding box than the previous default behaviour.

 * boundingbox.lpp  
    Bounding box for point patterns on a linear network.  
    This produces a tighter bounding box than the previous default behaviour.

 * boundingbox.linnet  
    Bounding box for a linear network.  
    This produces a tighter bounding box than the previous default behaviour.

 * "Frame<-.default"  
    New default method for assigning bounding frame to a spatial object.

 * connected.pp3  
    Connected components of a 3D point pattern.

 * colouroutputs, "colouroutputs<-"  
    Extract or assign colour values in a colour map.  
    (Documented a previously-existing function)

### SIGNIFICANT USER-VISIBLE CHANGES

 * plot.im  
    New argument 'gamma' supports gamma correction of colour maps.  
    New argument 'ncolours' specifies the default number of colours.

 * colourmap, lut  
    New argument 'gamma' supports gamma correction of colour maps.

 * plot.solist, plot.anylist  
    New argument 'panel.vpad' controls vertical space for panel title  
    when equal.scales=FALSE.

 * class 'units'  
    The class 'units' has been renamed 'unitname' to avoid a clash with  
    other packages.

 * unitname  
    The generic function 'unitname' now returns an object of class 'unitname'. 

 * print.units, summary.units, print.summary.units, as.character.units,  
    compatible.units  
    These methods are now called print.unitname, summary.unitname,  
    print.summary.unitname, as.character.unitname and compatible.unitname.

 * as.units  
    This function has been renamed 'as.unitname' and now returns  
    an object of class 'unitname'.

 * rescale.units  
    This method has been renamed 'rescale.unitname' and now returns  
    an object of class 'unitname'.

 * profilepl  
    New argument 'fast' controls the use of shorcuts.

 * reload.or.compute  
    New argument 'force'.

 * pixellate.ppp, pixellate.owin, pixellate.psp  
    New argument 'DivideByPixelArea'.

 * density.psp  
    New argument 'at' determines locations where the density is evaluated.

 * as.solist  
    as.solist(x) always returns an object of class 'solist',  
    removing any additional classes.

 * lineardirichlet  
    Accelerated.

 * integral.linim  
    Accelerated.

 * "[.ppp", "[.lpp", "[.psp"  
    In the expression X[W] where W is a window,  
    if X has a unitname but W does not,   
    the result now inherits the unitname of X.

 * distfun.ppp  
    New argument 'undef'.

 * print.pp3  
    More informative output when x is marked.

### BUG FIXES

1. leverage.ppm, influence.ppm, dfbetas.ppm  
     Calculations were slightly incorrect for models fitted using the  
     border correction.  
     Fixed.

2. integral.linim  
     Gave incorrect value in some extreme cases  
     (where many network segments were shorter than one pixel width).  
     Fixed.

3. update.kppm  
     Did not function correctly when several additional arguments were given.  
     Fixed.

4. plot.solist  
     Panel titles were cut off, when equal.scales=FALSE (the default).  
     Fixed.

5. intersection.owin, union.owin, setminus.owin  
     The result sometimes did not inherit the correct 'unitname'.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.54-0.txt).
