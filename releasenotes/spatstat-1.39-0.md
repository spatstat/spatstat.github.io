---
title: spatstat 1.39-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.39-0

### 23 October 2014

   We thank Shane Frank, Shaaban Ghalandarayeshi, Ute Hahn,
   Mahdieh Khanmohammadi, Nicoletta Nava, Jens Randel Nyengaard,
   Sebastian Schutte, Rasmus Waagepetersen and Carl G. Witthoft
   for contributions.

### OVERVIEW

 * ANOVA extended to Gibbs models.

 * Improved algorithm for locally-scaled K-function.

 * Leave-one-out calculation of fitted values in ppm objects.

 * New dataset: presynaptic vesicles.

 * Geometrical operations with windows and images.

 * More edge corrections for K-function.

 * Improved handling and plotting of 'fv' objects.

 * Utilities for perspective views of surfaces.

 * New classes 'anylist', 'solist' will ultimately replace 'listof'.

 * Bug fixes.

 * Version nickname: 'Smoke and Mirrors'

### NEW DATASETS

 * vesicles  
   Synaptic vesicles   
   (includes raw data files for training purposes)

### NEW CLASSES

 * anylist  
   List of objects.   
   (A replacement for 'listof')

 * solist  
   List of two-dimensional spatial objects.  
   (A replacement for some uses of 'listof')

### NEW FUNCTIONS

 * perspPoints, perspLines, perspSegments, perspContour  
   Draw points and lines on a surface, as seen in perspective view.

 * hopskel.test  
   Hopkins-Skellam test of CSR

 * project2set  
   For each data point in a point pattern X, find the nearest  
   spatial location in a given window W.

 * stienen, stienenset  
   Stienen diagrams

 * dirichlet.vertices  
   Vertices of the Dirichlet tessellation

 * discs   
   Union of discs.  
   Given a point pattern dataset recording the locations and diameters  
   of objects, find the region covered by the objects.

 * increment.fv  
   Increments of a summary function: g(x) = f(x+h)-f(x-h).

 * rotmean  
   Rotational average of pixel values in an image

 * fardist  
   Distance from each pixel/data point to farthest part of window boundary

 * circumradius.owin  
   Circumradius of a window

 * rmax.Trans, rmax.Ripley  
   Compute the maximum distance 'r' for which the   
   translation edge correction and isotropic edge correction     
   are valid.

 * is.grey  
   Determines whether a colour value is a shade of grey.

 * harmonise  
   Convert several objects of the same class to a common format.  
   (New generic function with existing methods harmonise.im and harmonise.fv)

 * area  
   New generic function, with methods for 'owin' and 'default'.

 * Fhazard  
   Hazard rate of empty space function

 * anylist, as.anylist, [.anylist, [<-.anylist, print.anylist, summary.anylist  
   Support for new class 'anylist'

 * solist, as.solist, [.solist, [<-.solist, print.solist, summary.solist  
   Support for new class 'solist'

 * plot.anylist, plot.solist  
   Plot methods for the classes 'anylist' and 'solist'  
   (Currently identical to 'plot.listof')

### SIGNIFICANT USER-VISIBLE CHANGES

 * anova.ppm  
   Now applies to Gibbs models as well as Poisson models,  
   using adjusted composite likelihood ratio test statistic.

 * persp.im  
   If visible=TRUE, the algorithm will also calculate which pixels of x  
   are visible in the perspective view. This is useful for drawing  
   points or lines on a perspective surface.

 * Kest  
   New option: correction="rigid" computes the rigid motion correction.

 * pairwise interactions   
   Fitted parameters and other calculations for pairwise interaction models  
   DiggleGatesStibbard, DiggleGratton, Fiksel, Geyer, Strauss   
   may change slightly due to a change in handling numerical rounding effects.

 * eval.fv  
   Functions no longer need to have exactly the same sequence of 'r' values.  
   They will now be made compatible using 'harmonise.fv'.

 * fitted.ppm  
   New argument 'leaveoneout' allows leave-one-out calculation  
   of fitted intensity at original data points.

 * Kinhom, Linhom  
   New argument 'leaveoneout' specifies whether the leave-one-out rule  
   should be applied when calculating the fitted intensities. 

 * crosspaircounts  
   Results may change slightly due to a change in handling numerical   
   rounding effects.

 * Fest, Gest  
   New argument 'domain' supports bootstrap methods.

 * plot.fv  
   New argument 'mathfont' determines the font (e.g. plain, italic, bold)  
   for mathematical expressions on the axes and in the legend.  
   Defaults to italic.

 * scanpp   
   Upgraded to handle multiple columns of mark data.

 * circumradius  
   The function 'circumradius' is now generic, with methods  
   for the classes 'owin' and 'linnet'.

 * edge.Trans  
   New argument 'give.rmax' 

 * fvnames, plot.fv  
   The symbol '.a' is now recognised. It stands for 'all function values'.

 * as.function.fv  
   Argument 'extrapolate' can have length 1 or 2.

 * varblock  
   New argument 'confidence' determines the confidence level.

 * $<-.fv  
   This can now be used to add an extra column to an 'fv' object  
   (previously it refused).

 * minnndist, maxnndist  
   New argument 'positive'. If TRUE, coincident points are ignored:  
   the nearest-neighbour distance of a point is the distance to the  
   nearest point that does not coincide with the current point.

 * plot.fv  
   Improved handling of 'shade' argument.

 * Kmeasure  
   Now passes '...' arguments to as.mask()

 * Ksector  
   Now allows start < 0.    
   New arguments 'units' and 'domain'.

 * pairorient  
   New arguments 'units' and 'domain'.

 * eroded.areas  
   New argument 'subset'

 * disc  
   New argument 'delta' 

 * plot.plotppm  
   New argument 'pppargs'

 * harmonise.fv, harmonise.im  
   These are now methods for the new generic 'harmonise'

 * Fest, Gest  
   These functions now also compute the theoretical value of hazard  
   for a Poisson process, if correction = "km".

 * with.fv  
   Improved mathematical labels.

 * Gfox, Jfox  
   Improved mathematical labels.

 * area.owin  
   This function is now a method for the new generic 'area'

 * edges  
   Default for argument 'check' changed to FALSE.

### BUG FIXES

 1. varblock  
    Calculations were incorrect if more than one column of   
    edge corrections was computed.   
    [Bug introduced in spatstat 1.21-1, november 2010.]  
    Fixed.

 2. varblock  
    Crashed if one of the quadrats contained no data points.  
    Fixed.

 3. lohboot  
    Interval was calculated wrongly when global=TRUE and fun="Lest" or "Linhom".  
    Fixed.

 4. nnmark  
    Crashed when at="points" if there was only a single column of marks.  
    [Spotted by Shane Frank.]  
    Fixed.

 5. plot.msr  
    Some elements of the plot were omitted or cut off.  
    Fixed.

 6. plot.msr  
    Did not work with 'equal.scales=TRUE'.  
    Fixed.

 7. plot.msr, augment.msr  
    Crashed if every data point was duplicated.  
    Fixed.

 8. as.im.owin  
    Crashed if X was a 1 x 1 pixel array.  
    Fixed.

 9. owin  
    Coordinates of polygon data were altered slightly when fix=TRUE.   
    [Spotted by Carl Witthoft.]  
    Fixed.

10. objects of class 'fv'  
    Assigning a new value to names(x) or colnames(x) or dimnames(x)  
    would cause the internal data format to become corrupted.  
    Fixed.

11. to.grey, complementarycolour  
    Did not work properly on 'colourmap' objects.  
    Fixed.

12. Kest  
    Ignored argument 'var.approx' if the window was a rectangle.  
    Fixed.

13. rmh.ppm, rmhmodel.ppm  
    Ignored the argument 'new.coef'.  
    [Spotted by Sebastian Schutte]  
    Fixed.

14. as.function.fv  
    The meanings of 'extrapolate=TRUE' and 'extrapolate=FALSE' were swapped.  
    Fixed.

15. varblock  
    Handled the case 'fun=Lest' incorrectly.  
    Fixed.

16. [.fv  
    Sometimes garbled the internal data format, causing plot.fv to crash.  
    Fixed.

17. range.fv  
    Sometimes returned NA even when na.rm=TRUE.  
    Fixed.

18. Fest  
    Argument 'eps' was not interpreted correctly.  
    Fixed.

19. plot.fv  
    Argument 'lwd' was not passed to legend()

20. flipxy.owin  
    Sometimes deleted the name of the unit of length.  
    Fixed.

Release notes are available in raw text format [here](spatstat-1.39-0.txt).
