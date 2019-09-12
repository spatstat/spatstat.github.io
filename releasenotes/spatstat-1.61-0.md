---
title: spatstat 1.61-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.61-0

### 12 September 2019

   We thank Jordan Brown, Tilman Davies and Greg McSwiggan for contributions.

### OVERVIEW

 * Fast kernel estimation on a linear network using 2D kernels.

 * Nonparametric maximum likelihood estimation of 'rho'.

 * Extension of Scott's rule for bandwidth selection.

 * Cross-validated bandwidth selection on a linear network.

 * More support for character-valued images.

 * Random thinning of clumps.

 * Bug fixes and minor improvements.

 * Nickname: 'Puppy zoomies'

### NEW FUNCTIONS

 * densityQuick.lpp  
    Fast kernel estimator of point process intensity on a network  
    using 2D smoothing kernel.

 * bw.scott.iso  
    Isotropic version of Scott's rule (for point patterns in any dimension).

 * data.lppm  
    Extract the original data point pattern from a fitted model of class 'lppm'.

 * rthinclumps  
    Divide a spatial region into clumps and randomly delete some of them.

 * dimnames.hyperframe, dimnames<-.hyperframe  
    Methods for extracting and changing the 'dimnames' of a hyperframe.

### SIGNIFICANT USER-VISIBLE CHANGES

 * rhohat  
    Estimation by nonparametric maximum likelihood is now supported,  
    assuming the intensity is a monotone function of the covariate.  
    New options: smoother="increasing" and smoother="decreasing".

 * density.lpp  
    New argument 'distance' offers a choice of different kernel methods.

 * bw.scott  
    Now handles point patterns of any dimension.  
    New arguments 'isotropic' and 'd'.

 * bw.ppl  
    New argument 'shortcut' allows faster computation.  
    Additional arguments '...' are now passed to density.ppp.

 * [<-.im  
    New argument 'drop' controls behaviour when indices are missing  
    as in 'x[] <- value'

 * mppm  
    Now supports 'self-starting' interactions.

 * as.im  
    New argument 'stringsAsFactors' is recognised by many methods.  
    It enables the creation of character-string-valued images.

 * plot.im  
    Axes are now prevented from extending outside the image rectangle.

 * plot.im  
    New argument 'zap'.

 * blur  
    New argument 'kernel'.

 * Smooth.im  
    New argument 'kernel'.

 * quadrat.test  
    New argument 'df.est'.

 * edge.Ripley  
    Numerical stability has been improved on some platforms.  
    Results may have changed in marginal cases (e.g. where the circle  
    of radius r centred at X is tangent to an edge of the polygonal window). 

 * rownames, rownames<-, colnames, colnames<-  
    These operations now work for hyperframes.

 * quadrat.test  
    Improved labelling of test when argument 'CR' is given.

 * plot.pppmatching  
    This existing function now has a help file.  
    New argument 'adjust'.

 * solist, is.sob, lintess  
    Objects of class 'lintess' are now recognised as 2D spatial objects  
    for the purposes of solist() and is.sob().

 * as.linfun.lintess  
    Functions created by as.linfun.lintess() now generate better output  
    when the function is printed.

### BUG FIXES

 1. densityVoronoi.lpp  
     Did not correctly handle patterns containing duplicated points.  
     Fixed.

 2. quadrat.test  
     Argument 'CR' was ignored when method="MonteCarlo".  
     Fixed.

 3. localKcross.inhom, localLcross.inhom  
     Argument lambdaX was ignored.  
     Fixed.

 4. "[.linim"  
     Factor values were erroneously converted to integers, in some cases.  
     Fixed.

 5. "[<-.hyperframe"  
     Did not handle some classes of objects correctly.  
     Fixed.

 6. effectfun  
     In a multitype point process model, effectfun() ignored any  
     user-specified value of 'marks'.  
     Fixed.

 7. as.linim.linfun  
     Additional arguments (other than spatial coordinates) were ignored.  
     Fixed.

 8. plot.solist  
     Display output was mangled if one entry in the list was  
     an object that would normally generate multiple panels of graphics,  
     such as an 'lpp' or 'tess' object with multiple columns of marks,  
     or a marked 'msr', 'leverage.ppm' or 'influence.ppm' object.  
     Fixed.

 9. plot.lpp  
     Return value was mangled when x had multiple columns of marks.  
     Fixed.

10. colourtable  
     Crashed in some cases when 'breaks' was given.  
     Fixed.

11. rLGCP  
     Crashed if 'win' was not a rectangle and 'mu' was not a constant.  
     Fixed.

12. intersect.tess  
     Crashed if 'Y' was a window object and 'keepmarks=TRUE'.  
     Fixed.

13. envelope.lppm  
     Crashed if argument 'simulate' was given.  
     Fixed.

14. unstack.solist  
     Did not correctly handle objects of class 'lintess'.

15. unstack.solist  
     Did not correctly handle objects of class 'tess' if they had multiple  
     columns of marks.

16. plot.pppmatching  
     Issued spurious warnings about unrecognised plot arguments.  
     Fixed.

17. plot.lintess  
     Issued spurious warnings about unrecognised plot arguments.  
     Fixed.

18. shift.lpp, rotate.lpp  
     Issued spurious warnings if argument 'origin' was given.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.61-0.txt).
