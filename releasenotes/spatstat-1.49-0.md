---
title: spatstat 1.49-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.49-0

### 08 February 2017

   We thank Tilman Davies, Kassel Hingee, Abdollah Jalilian,
   Brian Ripley and Dominic Schuhmacher for contributions.

### OVERVIEW

 * spatstat now 'Suggests' the package 'fftwtools'.

 * Operations on signed measures.

 * Operations on lists of pixel images.

 * Improved pixellation of point patterns.

 * Stieltjes integral extended.

 * Subset operators extended.

 * Greatly accelerated 'rmh' when using 'nsave'

 * Some computations accelerated.

 * Size of namespace reduced, for efficiency.

 * Bug fixes.

 * Version nickname: 'So-Called Software'

### NEW DEPENDENCIES

 * fftwtools  
    spatstat now 'Suggests' the package 'fftwtools'.  
    This package provides a very fast implementation of   
    the Fast Fourier Transform, leading to much faster computation  
    in the spatstat functions 'density.ppp', 'relrisk.ppp', 'convolve.im',  
    'blur', 'scan.test' and many other functions.  
    The 'fftwtools' package requires the external software library 'fftw'.  
    We strongly recommend installing this library if possible.

### NEW FUNCTIONS

 * hexagon, regularpolygon  
    Create regular polygons.

 * Ops.msr  
    Arithmetic operations for measures.

 * Math.imlist, Ops.imlist, Summary.imlist, Complex.imlist  
    Arithmetic operations for lists of pixel images.

 * measurePositive, measureNegative, measureVariation, totalVariation  
    Positive and negative parts of a measure, and variation of a measure.

 * as.function.owin  
    Convert a spatial window to a function (x,y), the indicator function.

 * as.function.ssf  
    Convert an object of class 'ssf' to a function(x,y)

 * as.function.leverage.ppm  
    Convert an object of class 'leverage.ppm' to a function(x,y)

### SIGNIFICANT USER-VISIBLE CHANGES

 * stieltjes  
    Argument 'M' can be a stepfun object (such as an empirical CDF).

 * quantile.ewcdf  
    The function is now normalised to the range [0,1]  
    before the quantiles are computed.   
    This can be suppressed by setting normalise=FALSE.

 * pixellate.ppp  
    New arguments 'fractional' and 'preserve' for more accurate discretisation.

 * "[.layered"  
    Subset index i can now be an 'owin' object.

 * "[.solist"  
    Subset index i can now be an 'owin' object.

 * plot.solist, plot.imlist, plot.anylist  
    Result is now an (invisible) list containing the result  
    from executing the plot of each panel.

 * ppp  
    New argument 'checkdup'.

 * Summary.im  
    Argument 'na.rm' is no longer ignored.

 * cdf.test   
    The methods for classes ppp, ppm, lpp, lppm, slrm  
    have a new argument 'interpolate'.

 * as.solist  
    The argument x can now be a spatial object;  
    as.solist(cells) is the same as solist(cells).

 * bw.diggle, bw.ppl, bw.relrisk, bw.smoothppp  
    These functions now extract and store the name of the unit of length  
    from the point pattern dataset. When the bandwidth selection criterion  
    is plotted, the name of the unit of length is shown on the x-axis.

 * polynom  
    This function now has a help file.

 * rmhcontrol  
    New parameter 'pstage' determines when to generate random proposal points.

 * rmh  
    Accelerated, in the case where multiple patterns are saved using 'nsave'.

 * bdist.pixels  
    Accelerated for polygonal windows. New argument 'method'.

 * spatstat namespace  
    The namespace of the spatstat package has been shortened  
    (by internally registering the native routines) which should  
    make the package run faster.

 * sum.im, range.im, max.im, min.im  
    These functions have been removed, as they are now subsumed in Summary.im.

### BUG FIXES

1. plot.msr  
     If one of 'nrows' or 'ncols' was specified, but not both,  
     an obscure error occurred.  
     Fixed.

2. plot.solist, plot.imlist, plot.anylist  
     Crashed if 'nrows' and 'ncols' were given values implying  
     that some rows or columns would not contain any plots.  
     Fixed.

3. as.ppp.lpp  
     Crashed if there was more than one column of marks.  
     Fixed.

4. has.close.pp3  
     Results were incorrect, or a crash occurred, when argument 'Y' was given.  
     Fixed.

5. rmpoispp  
     If 'lambda' was a list of images, 'names(lambda)' was ignored,  
     rather than serving as the default value of 'types'.  
     Fixed.

6. bugfixes  
     Output was garbled, in rare cases.  
     Fixed.

7. kppm  
     Result was malformed when clusters="VarGamma" and method="clik2".  
     Spotted by Abdollah Jalilian.  
     Fixed.

8. QQversion  
     Plotting labels were malformed.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.49-0.txt).
