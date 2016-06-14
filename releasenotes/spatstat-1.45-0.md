---
title: spatstat 1.45-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.45-0

### 10 March 2016

   We thank Monsuru Adepeju, Mario D'Antuono, Markus Herrmann, 
   Paul Hewson, Kassel Hingee, Greg McSwiggan, Suman Rakshit and 
   Sven Wagner for contributions.

### OVERVIEW

 * Important bug fix in leverage/influence diagnostics for Gibbs models.

 * Numerous bug fixes in code for replicated point patterns.

 * Surgery on linear networks.

 * Tessellations on a linear network.

 * Laslett's Transform.

 * Colour maps for point patterns with continuous marks are easier to define.

 * Pair correlation function estimates can be pooled.

 * Stipulate a particular version of a package.

 * Fixed namespace problems arising when spatstat is not loaded.

 * Bug fixes and performance improvements.

 * spatstat now contains 100,000 lines of R code. 

 * Version Nickname: 'One Lakh'

### NEW FUNCTIONS

 * laslett
   Laslett's Transform.
   [Thanks to Kassel Hingee]

 * lintess
   Tessellation on a linear network.

 * divide.linnet 
   Divide a linear network into pieces demarcated by a point pattern.

 * insertVertices
   Insert new vertices in a linear network.

 * thinNetwork
   Remove vertices and/or segments from a linear network etc

 * connected.linnet
   Find connected components of a linear network.

 * nvertices, nvertices.linnet, nvertices.owin
   Count the number of vertices in a linear network 
   or vertices of the boundary of a window.

 * as.data.frame.linim, as.data.frame.linfun
   Extract a data frame of spatial locations and function values
   from an object of class 'linim' or 'linfun'.

 * as.linfun, as.linfun.linim, as.linfun.lintess
   Convert other kinds of data to a 'linfun' object.

 * requireversion
   Require a particular version of a package
   (for use in stand-alone R scripts).

### SIGNIFICANT USER-VISIBLE CHANGES

 * [.linnet, [.lpp
   New argument 'snip' determines what to do with segments of the network
   that cross the boundary of the window. 
   Default behaviour has changed.

 * pcfinhom
   Default behaviour is changed when 'lambda' is a fitted model.
   The default is now to re-fit the model to the data before computing pcf.
   New arguments 'update' and 'leaveoneout' control this.

 * envelope methods
   New argument 'funYargs' contains arguments to the summary function
   when applied to the data pattern only.

 * plot.ppp, plot.lpp
   For a point pattern with continuous marks ('real numbers')
   the colour arguments 'cols', 'fg', 'bg' can now be vectors of 
   colour values, and will be used to determine the default colour map
   for the marks.

 * symbolmap
   Now accepts a vector of colour values for the arguments 'col', 'cols',
   'fg', 'bg' if argument 'range' is given.

 * closepairs.ppp, closepairs.pp3
   New arguments 'distinct' and 'neat' allow more options.

 * closepairs.ppp, closepairs.pp3
   Argument 'ordered' has been replaced by 'twice'
   (but 'ordered' is still accepted, with a warning).

 * closepairs.ppp, closepairs.pp3
   Performance improved (computation time and memory requirements reduced.)
   This should improve the performance of many functions in spatstat.

 * Geyer
   The saturation parameter 'sat' can now be less than 1.

 * lpp, as.lpp
   These functions now handle the case where 'seg' and 'tp' are given
   but 'x' and 'y' are missing.

 * linnet
   If the argument 'edges' is given, then this argument now determines the
   ordering of the sequence of line segments. For example, the i-th row
   of 'edges' specifies the i-th line segment in as.psp(L).

 * funxy, distfun
   The functions created by funxy and distfun have arguments (x,y).
   The user may now give a ppp or lpp object for the argument 'x',
   instead of giving two coordinate vectors 'x' and 'y'.

 * crossing.psp
   New argument 'details' gives more information about the intersections
   between the segments.

 * subset.ppp, subset.lpp, subset.pp3, subset.ppx
   The argument 'subset' can now be any argument acceptable to the "[" method.
    
 * density.lpp
   New argument 'weights'.

 * pcf.ppp
   New argument 'ratio' allows several estimates of pcf to be pooled.

 * summary.ppm
   New argument 'fine' selects the algorithm for variance estimation.

 * texturemap
   Argument 'textures' can be missing or NULL.

 * plot.lpp
   New argument 'show.network'

 * linnet
   New argument 'warn'

 * mppm
   Performs more checks for consistency of the input data.
    
 * mppm
   New arguments 'gcontrol' and 'reltol.pql' control the fitting algorithm.

 * edge.Trans
   New argument 'gW' for efficiency.

 * pool.fv
   The default plot of the pooled function no longer includes 
   the variance curves.

 * clickpoly
   The polygon is now drawn progressively as the user clicks new vertices.
    
 * Kest 
   Accelerated computation (for translation and rigid corrections)
   when window is an irregular shape.

 * vcov.ppm, leverage.ppm, influence.ppm, dfbetas.ppm
   Performance slightly improved, for Gibbs models.

 * Internal code
   Performance slightly improved.

 * Fest, Hest
   Additional checks for errors in input data.

### BUG FIXES

 * leverage.ppm, influence.ppm, parres.ppm, addvar.ppm
   Calculations were completely incorrect for Gibbs models, 
   due to a coding error. 
   Fixed.

 * update.kppm
   If the call to 'update' did not include a formula argument
   or a point pattern argument, then all arguments were ignored. 
   Example: update(fit, improve.type="quasi") was identical to 'fit'.
   Fixed.

 * diagnose.ppm
   When applied to a model obtained from subfits(), 
   in the default case (oldstyle=FALSE) 
   the variance calculations were incorrect.
   Consequently the dotted lines representing significance bands were 
   incorrect. An error or warning about negative variances occurred sometimes.
   However, calculations with oldstyle=TRUE were correct.
   The default has now been changed to oldstyle=TRUE for such models.

 * [.lpp
   The local coordinate 'seg' was completely incorrect,
   when 'i' was a window.
   Fixed.

 * leverage.ppm, influence.ppm, parres.ppm, addvar.ppm
   Crashed for Gibbs models in which the coefficient vector had length 1,
   such as the stationary Hardcore model.
   Fixed.

 * subfits
   Crashed if the model included factor-valued spatial covariates.
   [Spotted by Sven Wagner]
   Fixed.

 * subfits
   If the model included factor-valued spatial covariates, and if
   not all levels of the factor were present in each row of the data,
   the resulting objects were malformed and caused errors in other code.
   [Spotted by Sven Wagner]
   Fixed.

 * subfits
   Crashed with some random-effects formulas.
   [Spotted by Sven Wagner]
   Fixed.

 * improve.kppm
   An error message about a missing object 'gminus1' occurred
   when vcov=TRUE, fast.vcov=FALSE and type="clik1" or "wclik1".
   Fixed.

 * plot.profilepl
   Failed with a message about a missing object 'finite'.
   Fixed.

 * selfcut.psp
   Gave an error if marks(A) was a vector rather than a data frame.
   [Spotted by Paul Hewson.]
   Fixed.

 * suffstat
   Gave an error for point process models with Geyer interaction.
   Fixed.

 * nncross.lpp, distfun.lpp
   Crashed with obscure errors if Y consisted of a single point.
   Fixed.

 * scan.test, scanmeasure
   Crashed sometimes with an error message from 'grow.mask'.
   Fixed.

 * dppm
   Crashed sometimes with a message that the point pattern could not be found.
   [Scoping bug.]
   Fixed.

 * mppm, profilepl
   Crashed, with a message about 'SpatstatVersion',
   if the 'spatstat' package was neither loaded nor attached.
   [Spotted by Markus Herrmann.]
   Fixed.

 * qqplot.ppm
   Crashed sometimes when applied to a model obtained from subfits().
   Fixed.

 * anova.mppm
   Crashed sometimes with a message about mismatched coefficients.
   [Spotted by Sven Wagner.]
   Fixed.

 * anova.mppm
   Crashed sometimes with a message about unrecognised option 'type="score"'.
   [Spotted by Sven Wagner.]
   Fixed.

 * split.ppx
   Crashed if 'f' was not a factor.
   Fixed.

 * idw
   The result was a pixel image defined in the rectangle Frame(X)
   instead of Window(X). 
   Fixed.

 * ppm
   Parameter estimates were slightly inaccurate 
   when the model included the Geyer() interaction 
   and the "isotropic" edge correction was used.
   Fixed. 

 * [.ppx
   Crashed if the number of points selected was less than 2.
   Fixed.

 * linnet
   Crashed if there were no line segments at all.
   Fixed.

 * kppm, improve.kppm
   Crashed if the model was stationary and improve.type != "none".
   Fixed.

 * as.linim.default
   Did not correctly handle factor-valued data.
   Fixed.

 * texturemap
   Crashed if no graphical arguments were specified.
   Fixed.

 * vcov.mppm
   Ignored "..." arguments.
   Fixed.

 * Kest
   If ratio=TRUE and correction=c('border', 'none') 
   the result did not contain ratio information.
   Fixed.
   
 * plot.ppp, plot.lpp
   Arguments 'chars' and 'cols' were ignored in some cases.
   Fixed.

 * ppm
   Ignored argument 'emend'.
   Fixed.

 * plot.dppm
   Gave warnings about unrecognised argument 'objectname'.
   Fixed.

 * overlap.owin
   Sometimes returned a very small negative value, 
   when the correct answer was 0.
   Fixed.

