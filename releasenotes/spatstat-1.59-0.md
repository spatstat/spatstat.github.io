---
title: spatstat 1.59-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.59-0

### 22 March 2019

   We thank Lucia Cobo Sanchez, Tilman Davies, Maximilian Hesselbarth,
   Kassel Hingee, Mehdi Moradi, Suman Rakshit, Jan Sulavik
   and Luke Yates for contributions.

### OVERVIEW

 * Extensions to adaptive intensity estimators.

 * 'Dartboard' tessellation using polar coordinates.

 * Performance improvements.

 * Minor improvements and bug fixes.

 * Version nickname: "J'ai omis les oeufs de caille"

### NEW FUNCTIONS

 * polartess  
    Tessellation using polar coordinates.

 * bw.abram  
    Variable bandwidths for adaptive smoothing, using Abramson's Rule.

 * densityAdaptiveKernel  
    Calculates adaptive estimate of point process intensity  
    using variable-bandwidth kernel estimation.

 * densityVoronoi, densityVoronoi.ppp  
    Calculates adaptive estimate of point process intensity  
    using tessellation methods. This is an extension of the  
    old function adaptive.density.

 * densityVoronoi.lpp  
    Voronoi or smoothed Voronoi estimator of intensity  
    for point pattern on a linear network.

 * coords.quad  
    New method for 'coords', to extract the coordinates of the points  
    in a quadrature scheme.

 * lineartileindex  
    Low-level function to classify points on a linear network  
    according to which tile of a tessellation they fall inside.

### SIGNIFICANT USER-VISIBLE CHANGES

 * latest.news  
    Now prints news documentation for the current major version, by default.  
    New argument 'major'.

 * quantess  
    The covariate Z can now be "rad" or "ang" representing polar coordinates.  
    New argument 'origin' specifies the origin of polar coordinates.  
    New argument 'eps' controls accuracy of calculation.

 * envelope  
    The argument 'simulate' can now be a function (such as 'rlabel').  
    The function will be applied repeatedly to the original data Y,  
    and should yield point patterns of the same kind.

 * adaptive.density  
    This function can now perform adaptive estimation by two methods: either  
    tessellation-based methods or variable-bandwidth kernel estimation.  
    The calculations are performed by either 'densityVoronoi' or  
    'densityAdaptiveKernel'.

 * densityVoronoi  
    This performs the calculations of the old function 'adaptive.density'.  
    New argument 'fixed' specifies the subsampling.  
    New argument 'method' allows a choice between the original algorithm  
    and the recently described 'smoothed Voronoi' estimator.  
    Default value of 'f' changed to 'f=1'.

 * pcf.ppp  
    Now accepts correction="none".

 * pairorient  
    Default edge corrections now include 'bord.modif'.

 * funxy  
    Functions of class 'funxy' can now be applied to quadrature schemes.

 * lohboot  
    Computation accelerated when the window is a rectangle.

 * nncorr, nnmean, nnvario  
    New argument 'na.action'.

 * pp3  
    New argument 'marks'.

 * clusterfit  
    New argument 'verbose'.

 * beachcolours, beachcolourmap  
    Improved positioning of the yellow colour band.

 * linearK, linearpcf, linearKdot, linearKcross, linearpcfcross, linearpcfdot  
    Computation accelerated for networks which are not connected.

 * as.linnet.psp  
    Computation accelerated.

 * as.linfun.lintess  
    Computation accelerated.

 * selfcut.psp  
    Computation accelerated.  
    The result now has an attribute "camefrom"  
    indicating the provenance of each segment in the result.

 * bw.stoyan  
    The rule has been modified so that, if the pattern is empty,  
    it is now treated as if it contained 1 point,  
    so that a finite bandwidth value is returned.

 * rebound.owin  
    Now preserves unitnames of the objects.

 * rescale.owin, rescale.ppp, rescale.psp  
    The geometrical type of the window is now preserved in all cases  
    (previously if the window was polygonal but was equivalent to a rectangle,  
    the rescaled window was a rectangle).

 * shift.im, shift.owin, shift.ppp, shift.psp  
    More options for the argument 'origin'.

 * nnwhich.ppp, nnwhich.default  
    Accelerated, in the case k > 1.

 * is.subset.owin  
    Improved robustness against numerical error.

 * plot.im  
    Improved behaviour when the pixel values are almost constant.

 * Finhom, Ginhom, Jinhom  
    A warning is issued if bias is likely to occur because of undersmoothing.  
    New arguments 'warn.bias' and 'savelambda'.

 * plot.colourmap  
    Now handles a colourmap defined on an interval of length zero.

 * ewcdf  
    Computation accelerated.  
    New arguments 'normalise' and 'adjust'.  
    The result does not inherit class 'ecdf' if normalise=FALSE.

 * spatialcdf  
    Computation accelerated.  
    The result does not inherit class 'ecdf' if normalise=FALSE.

 * effectfun  
    New argument 'nvalues'.

 * parres  
    The argument 'covariate' may be omitted if the model involves  
    only one covariate.

 * alltypes  
    If 'envelope=TRUE' and the envelope computation reaches the  
    maximum permitted number of errors (maxnerr) in evaluating  
    the summary function for the simulated patterns, then instead  
    of triggering a fatal error, the envelope limits will be set to NA.

 * simulate.kppm  
    Additional arguments '...' are now passed to  
    the function that performs the simulation.

### BUG FIXES

 1. spatialcdf  
     The argument 'weights' was ignored in some cases.  
     Fixed.

 2. ppp  
     Points inside the window were erroneously rejected as lying outside  
     the window, if the window was a polygon equivalent to a rectangle  
     with sides longer than 10^6 units.  
     Fixed.

 3. inside.owin  
     All results were FALSE if the window was  
     a polygon equivalent to a rectangle  
     with sides longer than 10^6 units.  
     Fixed.

 4. sumouter  
     Result was incorrect (all entries were zero)  
     if 'w' was missing and 'y' was given.  
     Fixed.

 5. extractbranch.lpp  
     Point pattern coordinates were sometimes erroneously set to NA.  
     Fixed.

 6. beachcolours, beachcolourmap  
     The number of colours was not always equal to 'ncolours'.  
     [Spotted by Tilman Davies.]  
     Fixed.

 7. is.subset.owin  
     Sometimes gave the wrong answer for polygonal windows  
     due to numerical rounding error.  
     Fixed.

 8. update.kppm  
     Crashed if the updating information was a point pattern  
     and the original model call did not include a formula.  
     Spotted by Luke Yates.  
     Fixed.

 9. incircle, inpoint  
     Crashed if the window was extremely thin.  
     Fixed.

10. effectfun  
     Crashed in some obscure cases.  
     Fixed.

11. closepairs.pp3  
     Crashed if distinct=FALSE and what="all".  
     Fixed.

12. update.ippm  
     Crashed if the model was fitted using method="logi".  
     Fixed.

13. plot.msr  
     Crashed sometimes if x was multitype and multiplot=FALSE.  
     Fixed.

14. anova.mppm  
     Crashed if applied to a single model, unless the current environment  
     was the global environment.  
     Fixed.

15. lurking.mppm  
     If 'covariate' was a list of images, the code crashed sometimes  
     with message 'Fisher information is singular'.  
     Fixed.

16. im  
     Crashed if 'mat' was a 1-dimensional table (class 'table').  
     Fixed.

17. dirichlet  
     Crashed if the pattern was empty or contained only 1 point.  
     Fixed.

18. rjitter  
     Crashed if the pattern contained 0 or 1 points and  
     the argument 'radius' was not specified.  
     Fixed.

19. quantess.owin  
     Crashed if Z was a function(x,y).  
     Fixed.

20. quadrat.test  
     The p-value was NA if one of the observed counts was zero,  
     for the Cressie-Read tests with CR not equal to 1 or -1.  
     Fixed.

21. quadratcount.ppp  
     Sometimes issued an incorrect warning that data points were  
     outside the tessellation, when 'tess' was a tessellation  
     represented by a pixel image.  
     Fixed.

22. as.linim.linfun  
     Factor-valued functions were converted to integer-valued images.  
     Spotted by Suman Rakshit.  
     Fixed.

23. plot.linfun  
     Did not display factor-valued functions correctly.  
     Spotted by Suman Rakshit.  
     Fixed.

24. dclf.test, mad.test  
     Crashed, in rare cases, when applied to an 'envelope' object.  
     Spotted by Jan Sulavik.  
     Fixed.

25. plot.spatialcdf, plot.ewcdf  
     A horizontal line was plotted at height 1, even if the CDF was unnormalised.  
     Fixed.

26. plot.tess  
     The names of the tiles were sometimes re-ordered in the legend.  
     Fixed.

27. rThomas, rMatClust, rCauchy, rVarGamma  
     If the simulation window was not a rectangle,  
     the attribute 'Lambda' was a numeric vector, rather than a pixel image.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.59-0.txt).
