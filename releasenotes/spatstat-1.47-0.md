---
title: spatstat 1.47-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.47-0

### 12 October 2016

   We thank Marcel Austenfeld, Guy Bayegnak, Tilman Davies, Cenk Icos,
   Jorge Mateu, Frederico Mestre, Mehdi Moradi, Virginia Morera Pujol,
   Suman Rakshit and Sven Wagner for contributions.

### OVERVIEW

 * Non-Gaussian smoothing kernels.

 * Important bug fix in linearK, linearpcf

 * Changed internal format of linnet and lpp objects.

 * Faster computation in linear networks.

 * Bias correction techniques.

 * Bounding circle of a spatial object.

 * Minkowski sum also applicable to point patterns and line segment patterns.

 * Option to plot marked points as arrows.

 * Kernel smoothing accelerated.

 * Workaround for bug in some graphics drivers affecting image orientation.

 * Bug fixes and improvements.

 * Version nickname: 'Responsible Gambler'

### NEW FUNCTIONS

 * anyNA.im  
    Method for 'anyNA' for pixel images.

 * bc  
    Bias correction (Newton-Raphson) for fitted model parameters.   
    See also 'rex'.

 * boundingcircle, boundingcentre  
    Find the smallest circle enclosing a window or point pattern.

 * "[.linim"  
    Subset operator for pixel images on a linear network.

 * mean.linim, median.linim, quantile.linim  
    The mean, median, or quantiles of pixel values in a   
    pixel image on a linear network.

 * rex  
    Richardson extrapolation for numerical integrals and   
    statistical model parameter estimates. 

 * weighted.median, weighted.quantile  
    Median or quantile of numerical data with associated weights.

### SIGNIFICANT USER-VISIBLE CHANGES

 * linear networks  
    The internal format of a 'linnet' (linear network) object  
    has been changed. Existing datasets of class 'linnet' and 'lpp'  
    are still supported. However, computation will be faster if they  
    are converted to the new format. To convert a linnet object L  
    to the new format, use L <- as.linnet(L). To convert an lpp object X   
    to the new format, use X <- as.lpp(X).

 * density.ppp, Smooth.ppp  
    New argument 'kernel' allows the user to specify the smoothing kernel.

 * density.ppp, Smooth.ppp  
    Argument 'weights' can now be a pixel image.

 * MinkowskiSum, %(+)%  
    Now accepts arguments which are point patterns or line segment patterns  
    as well as windows.

 * sumouter  
    New argument 'y' allows computation of asymmetric outer products.

 * linearKinhom, linearpcfinhom  
    New argument 'normpower'.

 * rmh.default, rmh.ppm  
    New arguments 'nsim', 'saveinfo'.

 * symbolmap, plot.ppp, plot.lpp  
    New option: shape="arrows" 

 * rcellnumber  
    New argument 'mu'.

 * lengths.psp  
    New argument 'squared'.

 * plot.linfun  
    Now passes arguments to the function being plotted.

 * as.linnet.psp  
    If the line segment pattern has marks, then the resulting linear network  
    also carries these marks in the $lines component.

 * summary.owin, summary.im  
    The fraction of frame area that is occupied by the window/image  
    is now reported.

 * density.ppp, Smooth.ppp  
    Computation accelerated by about 15%   
    in the case where at='points' and kernel='gaussian'.

 * linearK, linearpcf  
    Accelerated by about 40%.

 * pixellate.ppp  
    Accelerated in the case where weights are given

 * density.ppp  
    Accelerated in the cases where weights are given or 'diggle=TRUE'

 * dilation.ppp  
    Improved geometrical accuracy.  
    Now accepts arguments to control resolution of polygonal approximation.

 * discs  
    New argument 'npoly'.   
    Accelerated in some cases. 

 * plot.pp3  
    New arguments 'box.front', 'box.back' control plotting of the box.

 * grow.rectangle  
    New argument 'fraction'.

 * nnfun.lpp  
    New argument 'k'.

 * bw.ppl  
    New argument 'sigma'.

 * lppm  
    New argument 'random' controls placement of dummy points.

 * rhohat.lpp  
    New argument 'random' controls placement of dummy points.

 * quadrat.test.ppm  
    Accelerated in the case where the original window is a rectangle.

 * kppm, mincontrast, cauchy.estpcf, lgcp.estpcf, matclust.estpcf,  
    thomas.estpcf, vargamma.estpcf  
    A warning about infinite values of the summary function   
    no longer occurs when the default settings are used.

 * circumradius  
    This function is now deprecated, in favour of 'boundingradius'

 * print.quad  
    More information is printed.

### BUG FIXES

 1. linearK, linearpcf, and relatives:  
     These functions were sometimes greatly underestimated  
     when the network had segments shorter than 10 coordinate units.  
     [Bug introduced in spatstat 1.44-0, december 2015.]  
     Fixed.

 2. integral.linim, integral.linfun  
     Results were slightly inaccurate because of a bias in the  
     distribution of sample points.  
     [Bug introduced in spatstat 1.41-0, february 2015.]  
     Fixed.

 3. intensity.ppm  
     Result was incorrect for Gibbs models if the model was *exactly*   
     equivalent to a Poisson process (i.e. if all interaction  
     coefficients were exactly zero).  
     [Bug introduced in spatstat 1.28-1, june 2012.]  
     Fixed.

 4. rSSI  
     Sometimes terminated prematurely.  
     [Spotted by Frederico Mestre.]  
     Fixed.

 5. perspPoints  
     Crashed if the image Z contained NA   
     (i.e. if Z was only defined on a subset of the bounding frame).  
     Spotted by Guy Bayegnak.  
     Fixed.

 6. plot.ppp, plot.lpp  
     Crashed if the argument 'shape' was given.  
     Fixed.

 7. plot.kppm  
     Crashed if the model was not fitted by minimum contrast.  
     Fixed.

 8. superimpose  
     Crashed if the argument was a 'solist' containing line segment patterns.  
     Fixed.

 9. Jest  
     Crashed sometimes, depending on the shape of the observation window.  
     [Spotted by Cenk Icos.]  
     Fixed.

10. plot.studpermutest  
     Crashed when the summary statistic was a multitype pair correlation   
     function or multitype K function. [Spotted by Sven Wagner.]  
     Fixed.

11. pool.anylist  
     Crashed with a message about buffer size,  
     if the list was longer than about 100 items.  
     Fixed.

12. diagnose.ppm, plot.diagppm  
     Crashed in some cases when cumulative=FALSE.  
     Fixed.

13. leverage.ppm, influence.ppm, dfbetas.ppm  
     Crashed sometimes with a message about wrong replacement length.  
     [Spotted by Virginia Morera Pujol.]  
     Fixed.

14. as.linnet.psp  
     Crashed with marked segment patterns, if any segments were very short.  
     [Spotted by Suman Rakshit.]  
     Fixed.

15. stieltjes  
     Returned NA if some values of f were not finite.  
     Fixed.

16. plot.symbolmap  
     If a new plot window was initialised, it was sometimes too small  
     to contain the geometric figures (circles, squares etc) in the symbol map.  
     Fixed.

17. plot.ppp, plot.im  
     Ignored xlim, ylim.   
     Fixed.

18. rhohat.lpp  
     Ignored nd, eps.  
     Fixed.

19. nnfun.lpp  
     Print method gave incorrect information about the point pattern.  
     Fixed.

20. "[.fv"  
     The default plot formula was not updated.  
     Fixed.

21. fitted.ppm  
     The result was sometimes a 1-dimensional array rather than a numeric vector.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.47-0.txt).
