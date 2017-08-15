---
title: spatstat 1.52-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.52-0

### 10 August 2017

   We thank Nicholas Read, Abdollah Jalilian, Suman Rakshit,
   Dominic Schuhmacher and Rasmus Waagepetersen for contributions.

### OVERVIEW

 * Important bug fixes.

 * Now handles disconnected linear networks.

 * Effect function is now available for all types of fitted model.

 * A model can be fitted or re-fitted to a sub-region of data.

 * More support for measures.

 * 'Pool' operations improved.

 * Geometric-mean smoothing.

 * Changed algorithm defaults in ippm.

 * Version nickname: "Rudimentary Lathe"

### NEW FUNCTIONS

 * as.data.frame.envelope  
    Extract function data from an envelope object,  
    including the functions for the simulated data ('simfuns')  
    if they were saved.

 * is.connected, is.connected.default, is.connected.linnet  
    Determines whether a spatial object consists of  
    one topologically connected piece, or several pieces.

 * is.connected.ppp  
    Determines whether a point pattern is connected after  
    all pairs of points closer than distance R are joined.

 * hist.funxy  
    Histogram of values of a spatial function.

 * model.matrix.ippm  
    Method for 'model.matrix' which allows computation of  
    regular and irregular score components.

 * harmonise.msr  
    Convert several measures (objects of class 'msr')  
    to a common quadrature scheme.

### SIGNIFICANT USER-VISIBLE CHANGES

 * Smooth.ppp  
    New argument 'geometric' supports geometric-mean smoothing.

 * Kinhom  
    New argument 'ratio'.

 * linearKinhom, linearpcfinhom  
    Changed default behaviour when 'lambda' is a fitted model.  
    New arguments 'update' and 'leaveoneout'.

 * linearK, linearKinhom, linearpcf, linearpcfinhom, compilepcf  
    Ratio calculations are now supported.  
    New argument 'ratio'.

 * effectfun  
    Now works for 'ppm', 'kppm', 'lppm', 'dppm', 'rppm' and 'profilepl' objects.

 * ppm, kppm  
    The argument 'subset' can now be a window (class 'owin')  
    specifying the subset of data to which the model should be fitted.

 * fitted.lppm  
    New argument 'leaveoneout' allows leave-one-out computation of fitted value.

 * pool.rat  
    New arguments 'relabel' and 'variance'.

 * density.lpp  
    The return value is a pixel image of class 'linim' in all cases.

 * plot.linim, plot.linfun  
    A scale bar is now plotted when style="width".  
    New argument 'legend'.

 * ippm  
    Default values for the parameters of the optimisation algorithm (nlm.args)  
    have changed.

 * ippm  
    The internal format of the result has been extended slightly.

 * bind.fv  
    New argument 'clip'.

 * as.im.distfun  
    New argument 'approx' specifies the choice of algorithm.

 * "[.psp"  
    New argument 'fragments' specifies whether to keep fragments of  
    line segments that are cut by the new window, or only to retain  
    segments that lie entirely inside the window.

 * predict.rhohat  
    New argument 'what' determines which value should be calculated:  
    the function estimate, the upper/lower confidence limits, or the  
    standard error.

 * pool.fv  
    New arguments 'relabel' and 'variance'

 * pool.rat  
    New argument 'weights'.

 * plot.msr  
    New argument 'massthresh'.

 * Ops.msr  
    Calculations like A+B can now be performed even when the measures A and B  
    are not defined on the same quadrature scheme.

 * density.ppp  
    New argument 'verbose'.

 * bw.pcf  
    New argument 'verbose'.

 * hist.im  
    New argument 'xname'.

 * [.leverage.ppm  
    New argument 'update'.

 * [.layered  
    Additional arguments '...' are now passed to other methods.

 * logLik.ppm  
    The warning about pseudolikelihood ('log likelihood not available')  
    is given only once, and is not repeated in subsequent calls,  
    within a spatstat session.

 * kppm  
    Refuses to fit a log-Gaussian Cox model with anisotropic covariance.

 * plot.linim, plot.linfun  
    The return value has a different format.  
    Arguments have been renamed and reorganised.

 * density.lpp  
    New argument 'old'.

 * ippm  
    Accelerated.

 * Smooth.ppp  
    Now exits gracefully if any mark values are NA, NaN or Inf.

 * timeTaken  
    Now exits gracefully if there is no timing information.

 * nbfires  
    The unit of length for the coordinates is now specified in this dataset.

### BUG FIXES

 1. bw.pcf  
     Results were totally incorrect due to a typo.  
     [Spotted by Abdollah Jalilian and Rasmus Waagepetersen.]  
     Fixed.

 2. predict.rho2hat  
     Results were incorrect for a rho2hat object computed from a point pattern.  
     Fixed.

 3. density.ppp  
     If the smoothing bandwidth was very small (e.g.\ smaller than pixel width),  
     results were inaccurate if the default resolution was used,  
     and completely wrong if another resolution was specified.  
     [Spotted by Dominic Schuhmacher.]  
     Fixed.

 4. linearK, linearKinhom, linearpcf, linearpcfinhom, linearKcross,  
     linearKdot, linearpcfcross, linearpcfdot, linearKcross.inhom,  
     linearKdot.inhom, linearpcfcross.inhom, linearpcfdot.inhom  
     Crashed if the network was disconnected.  
     Fixed.

 5. crossdist.lpp  
     Crashed if the network was disconnected.  
     Fixed.

 6. countends  
     Crashed if the network was disconnected.  
     Fixed.

 7. model.images.ppm  
     Crashed for models fitted using 'covfunargs'.  
     Fixed.

 8. model.matrix.ppm  
     Crashed for models fitted using 'covfunargs',  
     if argument 'Q' was given.  
     Fixed.

 9. polynom  
     Expansion of some polynomials caused an error message  
     about 'invalid model formula'.  
     Fixed.

10. plot.ppp  
     The argument 'type="n"' did not suppress plotting of the legend,  
     for marked point patterns.  
     Fixed.

11. plot.psp  
     Ignored 'show.all' when 'add=TRUE'.  
     Fixed.

12. intensity.ppm  
     Result had incorrect 'names' attribute in some cases.  
     Fixed.

13. marks<-.ppx  
     The assignment marks(X) <- a, where 'a' is a single atomic value,  
     caused an error if 'X' contained zero points.  
     Fixed

14. model.depends  
     Crashed when applied to regression models fitted by 'gam',  
     or point process models fitted by 'ppm' with 'use.gam=TRUE'.  
     Fixed.

15. pool.fv  
     Crashed sometimes, if the arguments did not have the same set of  
     column names.  
     Fixed.

16. pool.rat  
     Crashed with an error message from 'fmt'  
     if there were more than 20 objects to be pooled.  
     Fixed.

17. linearK  
     The 'theo' column was missing if npoints(X) < 2 and correction="Ang".  
     Fixed.

18. model.matrix.ppm  
     Result was malformed if the model was fitted with 'use.gam=TRUE'.  
     Fixed.

19. effectfun  
     Crashed if 'covname' was omitted,  
     if the model was fitted with 'use.gam=TRUE'.  
     Fixed.

20. nncross.lpp  
     Result had incorrect format if Y was empty, in some cases.  
     Fixed.

21. linearKinhom  
     Plot label for y axis was incorrect.  
     [Spotted by Suman Rakshit.]  
     Fixed.

22. plot.solist  
     If the entries were 'linim' objects, they were plotted using image()  
     so arguments like 'style="w"' were ignored.  
     Fixed.

23. as.ppp.data.frame  
     Crashed if X was an object of class 'tbl_df' from the dplyr package.  
     Fixed.

24. plot.lpp  
     Crashed if there were multiple columns of marks.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.52-0.txt).
