---
title: spatstat 1.38-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES 

## spatstat 1.38-0

**15 august 2014**
	
   We thank Malissa Baddeley, Colin Beale, Oscar Garcia, Daniel Esser, 
   David Ford, Eric Gilleland, Andrew Hardegen, Philipp Hunziker, 
   Abdollah Jalilian, Tom Lawrence, Lore De Middeleer, Robin Milne, 
   Mike Porter, Suman Rakshit, Pablo Ramon, Jason Rudokas, 
   Christopher Ryan, Dominic Schuhmacher, Medha Uppala 
   and Rasmus Waagepetersen for contributions.

## OVERVIEW

 * spatstat now Requires the package 'goftest' and Suggests package 'Matrix'.
 * New dataset: 'sporophores'.
 * Palm likelihood method for fitting cluster processes and Cox processes.
 * Quasi-likelihood and weighted composite likelihood methods
      for estimating trend in cluster processes and Cox processes.
 * Further extensions to model formulas in ppm and kppm.
 * Faster variance calculations for ppm objects.
 * One-sided tests and one-sided envelopes of summary functions.
 * Cramer-Von Mises and Anderson-Darling tests of spatial distribution.
 * Cressie-Read test statistic in quadrat counting tests.
 * Spatial cumulative distribution functions.
 * Faster algorithm for point pattern matching.
 * Improvements to plots.
 * Increased support for envelopes.
 * New generic functions 'Window', 'Frame' and 'domain'.
 * Directional K-function and directional distribution.
 * Raster calculations accelerated.
 * Summary functions accelerated.
 * Many improvements and bug fixes.
 * Version nickname: 'Wicked Plot'

## NEW DATASETS

 * sporophores  
   Spatial pattern of three species of mycorrhizal fungi around a tree.  
   [Contributed by E. David Ford.]  

## NEW FUNCTIONS

 * improve.kppm  
      Re-estimate the trend in a kppm (cluster or Cox) model
      using quasi-likelihood or weighted first-order composite likelihood.  
      [Contributed by Abdollah Jalilian and Rasmus Waagepetersen.]  

 * Window, Window<-  
      Generic functions to extract and change the window of a spatial object
      in two dimensions. Methods for ppp, psp, im, and many others.  

 * Frame, Frame<-  
      Generic functions to extract and change the containing rectangle ('frame')
      of a spatial object in two dimensions.   

 * domain  
      Generic function to extract the spatial domain of a spatial object
      in any number of dimensions.   

 * Ksector  
      Directional version of the K-function.  

 * pairorient  
      Point pair orientation distribution.  

 * spatialcdf  
      Compute the spatial cumulative distribution of a spatial covariate,
      optionally using spatially-varying weights.  

 * cdf.test   
      [Supersedes 'kstest'.]  
      Test of goodness-of-fit of a Poisson point process model.  
      The observed and predicted distributions of the values of a 
      spatial covariate are compared using either the
      Kolmogorov-Smirnov, Cramer-Von Mises or Anderson-Darling test.  

 * berman.test  
      Replaces 'bermantest'.  

 * harmonise.fv  
      Make several functions compatible.  

 * simulate.lppm  
      Simulate a fitted point process model on a linear network.  

 * subset.ppp, subset.lpp, subset.pp3, subset.ppx  
      Methods for 'subset', for point patterns.  

 * closepairs.pp3, crosspairs.pp3  
      Low-level functions to find all close pairs of points in three dimensions  

 * volume.linnet  
      Method for the generic 'volume'. Returns the length of the linear network.  

 * padimage  
      Pad the border of a pixel image.  
 
 * as.layered  
      Convert spatial data to a layered object.  

 * panel.contour, panel.image, panel.histogram  
      Panel functions for 'pairs' plots.  

 * range.fv, min.fv, max.fv  
      Range, minimum and maximum of function values.  

## IMPROVEMENTS/ENHANCEMENTS

 * ppm.formula  
   The left hand side of the formula can now be the name of 
   an object in the list 'data', or an expression involving such objects.  

 * ppm  
   The right hand side of the formula can now include 
   the symbol '.' representing all covariates in the list 'data'.  

 * ppm  
   New argument 'subset' makes it possible to fit the model
   in a subset of the spatial domain defined by an expression.  

 * kppm  
   New option: method="palm", will fit the model by maximising Palm likelihood.  

 * pppdist  
   Substantially accelerated.   
   New argument 'auction' controls choice of algorithm.  

 * rhohat  
   New arguments 'weights' and 'horvitz' for weighted calculations.  

 * persp.im  
   Surface heights and colours can now be controlled by different images.  
   Option to draw a grey apron around the sides of the perspective plot.   
   Return value has a new attribute 'expand'.  

 * plot.listof  
   New arguments 'halign' and 'valign' give improved control
   over the alignment of panels.  

 * plot.listof  
   If all components of the list are objects of class 'fv' 
   representing functions, then if equal.scales=TRUE, these
   functions will all be plotted with the same axes 
   (i.e. the same xlim and the same ylim).  

 * envelope  
   The argument 'transform' is now processed by 'with.fv'
   giving more options, such as 'transform=expression(. - r)'  

 * envelope, dclf.test, mad.test  
   One-sided tests and one-sided envelopes can now be produced, 
   by specifying the argument 'alternative'.  

 * dclf.test, mad.test  
   A pointwise test at fixed distance 'r' can now be performed
   by setting rinterval = c(r,r).  

 * envelope  
   New arguments 'fix.n' and 'fix.marks' for envelope.ppp and envelope.ppm
   make it easy to generate simulated patterns conditional on the
   total number of points, or on the number of points of each type.  

 * quadrat.test  
   Can now calculate the Cressie-Read test statistic
   instead of the Pearson X2 statistic.  

 * Kres, Gres, Kcom, Gcom, psst, psstA, psstG  
   New argument 'model' makes it easier to generate simulation envelopes
   of the residual summary functions.  

 * layered, plot.layered  
   The layer plot arguments can include the argument '.plot'
   specifying a function to perform the plotting instead of the
   generic 'plot'.  

 * deriv.fv  
   New arguments make it possible to differentiate a periodic function.  

 * ppm  
   Argument 'data' or 'covariates' can now include entries
   which are not spatial covariates, provided they do not appear 
   in the model formula.  

 * closepairs, crosspairs  
   These functions are now generic, with methods for 'ppp' and 'pp3'  

 * rLGCP  
   Updated to conform to new usage of RandomFields package.  
   Argument syntax has changed.  
   Now allows control over pixel resolution.  

 * bw.diggle  
   New arguments 'correction' and 'hmax' for controlling the calculation.  

 * predict.lppm  
   New argument 'new.coef' for computing predictions with a 
   different vector of model coefficients.  

 * predict.ppm  
   If 'locations' is a pixel image, its pixels determine the
   spatial locations for prediction.  

 * cut.ppp  
   Argument 'z' can now be a window.  

 * split.ppp  
   Argument 'f' can now be a window.  

 * print.ppm, summary.ppm, coef.summary.ppm  
   The table of parameter estimates, standard errors and confidence intervals
   now also includes the value of the (signed square root) Wald test statistic.  

 * plot.im  
   Now automatically detects problems in some Windows graphics displays
   and tries to avoid them.  

 * plot.im  
   The position of axis tick marks alongside the colour ribbon
   can now be controlled using the parameter 'at' in the argument 'ribargs'.  

 * plot.ppp  
   Can now plot numeric marks using characters chosen by 'pch' or 'chars'
   with size determined by mark value.  

 * plot.ppp  
   New argument 'meansize' for controlling mark scale.  

 * hsvim, rgbim  
   New argument 'autoscale' causes automatic scaling of colour channel values.  

 * plot.ppp  
   If type='n', a legend is now displayed when x is a marked point pattern.  

 * whist  
   Accelerated by a factor of 5.  

 * Fest, Jest  
   Accelerated by a factor of 2 to 3.  

 * fryplot  
   Accelerated.  
   Now displays a legend if the point pattern is marked.  
   Now handles numerical marks nicely.  
   New argument 'axes'.  

 * frypoints  
   Accelerated.  
   New arguments 'to', 'from' and 'dmax'.  

 * duplicated.ppp  
   New option: rule = 'unmark'  

 * rjitter  
   Argument 'radius' now has a default.  

 * Smooth.msr  
   New argument 'drop'  

 * LambertW  
   Now handles NA and infinite values.  

 * update.ppm  
   Now handles formulae with a left-hand side.  
  
 * raster.x, raster.y, raster.xy  
   These functions can now handle images, as well as masks.  

 * Smooth.ppp  
   If the mark values are exactly constant, the resulting smoothed values
   are now exactly constant.  

 * eval.im, eval.fv, eval.fasp  
   Argument 'envir' can now be a list, instead of an environment.  

 * plot.ppp  
   The printout (of the resulting symbol map object)
   now displays the numerical value of the mark scale.  

 * with.fv  
   Improved mathematical labels.  

 * plot.fv  
   Improved mathematical labels on x axis.  

 * ppm  
   Improved error messages.  

 * vcov.ppm  
   Computations greatly accelerated for Hybrid interactions
   and for Area-interaction models.  

 * vcov.kppm  
   Computations greatly accelerated (when fast=TRUE)     

 * interp.im  
   Argument 'x' can now be a point pattern.  

 * pool.envelope  
   Improved handling of text information.  

 * miplot  
   Improved layout.  

 * print.summary.ppp  
   Improved layout.   
   Now respects spatstat.options('terse')  

 * print.profilepl  
   Improved layout.   
   Now respects spatstat.options('terse')  

 * anova.ppm  
   Now respects spatstat.options('terse')  

 * print.fv, print.envelope  
   Now respect spatstat.options('terse') and options('width')  
   
 * summary.envelope  
   Now respects options('width')  
   
 * kstest, bermantest  
   These functions will soon be Deprecated.  
   They are retained only for backward compatibility.  

## BUGS

   01. vcov.ppm  
   Sometimes gave wrong answers for Poisson models fitted by method='logi'.
   Fixed.

   02. unnormdensity  
   If weights were missing, the density was normalised,
   contrary to the documentation.
   Fixed.

   03. logLik.ppm, anova.ppm, AIC  
   For models fitted by 'ippm', the number of degrees of freedom was incorrect.
   Fixed.

   04. im.apply  
   Pixels outside the window were not assigned the value NA as they should.
   Fixed.

   05. pixellate.owin  
   Crashed, unpredictably, if the pixel raster had unequal numbers
   of rows and columns.
   [Spotted by Rasmus Waagepetersen.]
   Fixed.

   06. vcov.ppm  
   Crashed for pairwise interaction models fitted by method="logi".
   Fixed.

   07. predict.ppm  
   Crashed for models fitted by method="logi"
   if the model included external covariates.
   Fixed.

   08. predict.ppm  
   Crashed if the argument 'covariates' or 'data' in the original call to 'ppm'
   included entries that were not spatial covariates. [These entries were
   ignored by ppm but caused predict.ppm to crash.]
   Fixed.

   09. simulate.kppm, rNeymanScott, rThomas, rMatClust  
   Crashed randomly when simulating an inhomogeneous model.
   [Spotted by Philipp Hunziker.]
   Fixed.
   
   10. bw.diggle  
   In some extreme cases, generated an error message
   about `NaN values in Foreign function call.'
   [Spotted by Colin Beale.]
   Fixed.

   11. textureplot  
   Crashed if 'spacing' was too large.
   Fixed.

   12. superimpose.psp  
   Crashed if the result was empty.
   Fixed.

   13. istat  
   Crashed with an error message about 'vars'.
   Fixed.

   14. dirichlet, delaunay, delaunay.distance  
   Crashed in rare cases due to a problem in package 'deldir'. 
   [Spotted by Pierre Legendre.]
   Fixed.

   15. rgbim, hsvim  
   Crashed if any argument was constant.
   Fixed.

   16. scaletointerval  
   Crashed if x was constant.
   Fixed.

   17. linnet, [.linnet  
   Crashed if the result contained only a single vertex.
   [Spotted by Daniel Esser.]
   Fixed.

   18. plot.fv  
   If some of the function values were NA,
   they were replaced by fictitious values
   (by linearly interpolating).
   Fixed.

   19. crossdist.ppp  
   Ignored argument 'squared' if periodic=FALSE.
   [Spotted by Mike Porter.]
   Fixed.

   20. marks<-.ppp  
   Ignored argument 'drop'.
   [Spotted by Oscar Garcia.]
   Fixed.
 
   21. update.ppm  
   Sometimes did not respect the argument 'use.internal'.
   Fixed.

   22. plot.rhohat  
   Did not respect the argument 'limitsonly'.
   Fixed.

   23. contour.im  
   Argument 'axes' defaulted to TRUE, but FALSE was intended.
   Fixed.

   24. print.hyperframe, as.data.frame.hyperframe  
   Column names were mangled if the hyperframe had a single row.
   Fixed.

   25. as.psp.data.frame  
   Generated a warning about partially-matched names in a data frame.
   [Spotted by Eric Gilleland.]
   Fixed.

   26. plot.leverage.ppm  
   Generated a warning from 'contour.default'
   if the leverage function was constant.
   Fixed.

   27. plot.diagppm  
   Issued warnings about unrecognised graphics parameters.
   Fixed.

   28. update.symbolmap  
   Discarded information about the range of input values.
   Fixed.

   29. plot.fv  
   Label for y axis was garbled, if argument 'shade' was given.
   Fixed.

   30. plot.ppp  
   The legend was sometimes plotted when it should not have been 
   (e.g. when add=TRUE).
   Fixed.

   31. plot.listof, plot.im  
   In an array of plots, containing both images and other spatial objects,
   the titles of the panels were not correctly aligned.
   Fixed.

   32. plot.tess, plot.quadratcount  
   Ignored arguments like 'cex.main'.
   Fixed.

   33. iplot  
   Navigation buttons (Left, Right, Up, Down, Zoom In, Zoom Out)
   did not immediately refresh the plot.
   Fixed.

   34. iplot.layered  
   Reported an error 'invalid argument type' if all layers were deselected.
   Fixed.

