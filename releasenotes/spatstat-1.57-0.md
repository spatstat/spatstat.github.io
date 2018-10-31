---
title: spatstat 1.57-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.57-0

### 30 October 2018

   We thank Corey Anderson, Ryan Arellano, Hadrien Commenges,
   Ottmar Cronie, Tilman Davies, Maximilian Hesselbarth, Kassel Hingee,
   Tomas Lazauskas, Marie-Colette van Lieshout, Rasmus Waagepetersen
   and 'daitakahashi' for contributions.

### OVERVIEW

 * Cronie-van Lieshout bandwidth selection.

 * Smoothing functions handle non-Gaussian kernels.

 * Infinite smoothing bandwidths permitted.

 * Positive confidence limits for rhohat.

 * Improved bivariate interpolation.

 * subset() method for line segment patterns.

 * Important bug fixes in rthin and density.ppp

 * Minor bug fixes and improvements.

 * Version nickname: 'Zombie apocalypse'

### NEW FUNCTIONS

 * bw.CvL  
    Cronie-Van Lieshout bandwidth selection for density estimation.  
    [Contributed by Ottmar Cronie and Marie-Colette van Lieshout.]

 * subset.psp  
    Method for 'subset' for line segment patterns.

### SIGNIFICANT USER-VISIBLE CHANGES

 * densityfun.ppp, Smoothfun.ppp, Smooth.ppp  
    These commands now handle non-Gaussian kernels.

 * density.ppp, relrisk.ppp, Smooth.ppp, densityfun.ppp, Smoothfun.ppp  
    Argument 'sigma' can be infinite.

 * interp.im  
    New argument 'bilinear' specifies the choice of interpolation rule.

 * rhohat  
    Methods for rhohat have a new argument 'positiveCI'  
    specifying whether confidence limits should be positive.

 * plot.colourmap  
    New argument 'increasing' specifies whether the colours are  
    displayed in order left-to-right/bottom-to-top.  
    Changed default behaviour for discrete colour maps when vertical=FALSE.

 * split.ppx  
    Argument 'f' can be a logical vector.

 * relrisk.ppp  
    If se=TRUE and at="pixels", the result belongs to class 'solist'.

 * imcov, setcov, convolve.im  
    The name of the unit of length is preserved.

 * density.ppp  
    Slightly accelerated for non-Gaussian kernels.

 * bw.scott  
    The two bandwidth values in the result  
    now have names ('sigma.x' and 'sigma.y').

 * pairdist.default  
    Now checks whether the data are valid 2-dimensional coordinates.

 * pixellate.ppp  
    New argument 'savemap'

 * rtemper  
    New argument 'track'.  
    Code runs slightly faster.

 * eval.im, eval.linim  
    New argument 'warn'.

 * Kres, Kcom, Gcom, psstG  
    If any of the calculated weights for the summary function  
    are infinite or NA, they are reset to zero, with a warning,  
    instead of a fatal error.

### BUG FIXES

 1. rthin  
     If P was close to 1, the result was sometimes an empty point pattern  
     when it should have been identical to X.  
     [Spotted by Maximilian Hesselbarth.]  
     Fixed.

 2. density.ppp  
     Standard error calculations were incorrect  
     when sigma was a single numeric value.  
     The output was equal to 'sqrt(sigma)' times the correct answer.  
     Fixed.

 3. density.ppp  
     Result was incorrect for non-Gaussian kernels when  
     at="points" and leaveoneout=FALSE.  
     Fixed.

 4. density.ppp  
     Did not pass additional arguments "..." to a user-supplied  
     kernel function, in some cases.  
     Fixed.

 5. as.im.function, as.im.funxy  
     If the function values were factor values and the window was  
     not a rectangle, the result was an image with all pixel values NA.  
     [Spotted by Corey Anderson.]  
     Fixed.

 6. plot.funxy  
     If the function values were factor values and the window was  
     not a rectangle, the plot was empty.  
     [Spotted by Corey Anderson.]  
     Fixed.

 7. nnorient  
     Crashed if the border correction did not retain any data points.  
     [Spotted by Tomas Lazauskas.]  
     Fixed.

 8. linim  
     Crashed in some cases with a message about unitnames.  
     Fixed.

 9. density.lpp  
     Default value of 'dx' was sometimes incorrect.  
     Fixed.

10. rMatClust, rThomas, rCauchy, rVarGamma  
     Issued a spurious warning about bandwidth selection  
     when saveLambda=TRUE.  
     Fixed.

11. density.ppp  
     Issued a spurious warning about bandwidth selection  
     when 'kernel' was a user-supplied function.  
     Fixed.

12. clusterfield.function  
     Issued a spurious warning about bandwidth selection.  
     Fixed.

13. relrisk.ppp  
    Issued a spurious warning if the argument 'case' or 'control'  
    was given, for a bivariate point pattern.  
    Fixed.

14. superimpose.ppp  
    If 'W' was a character string or function, the behaviour was  
    not exactly as described in the help file.   
    Fixed.

15. plot.psp  
    If the marks were factor values, the colour map was displayed upside down.  
    Fixed.

16. eval.fv  
    If one of the 'fv' objects included ratio information (class 'rat')  
    then this was erroneously retained, in some cases.  
    Fixed.

17. linearKcross  
    Crashed (with a message about a missing value of 'correction')  
    if there were no pairs of points to count.  
    Fixed.

18. envelope.lpp  
    Crashed (randomly) when fix.n=TRUE and fix.marks=TRUE.  
    Fixed.

Release notes are available in raw text format [here](spatstat-1.57-0.txt).
