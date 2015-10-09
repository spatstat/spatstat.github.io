---
title: spatstat 1.43-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.43-0

### 07 October 2015

   We thank Leanne Bischof, Christophe Biscio, Belarmain Fandohan,
   Andrew Hardegen, Frederic Lavancier, Tom Lawrence, Martin Maechler,
   Greg McSwiggan, Robin Milne, Gopalan Nair, Tuomas Rajala,
   Suman Rakshit, Ben Ramage, Francois Semecurbe and Ida-Maria Sintorn
   for contributions.

### OVERVIEW

 * spatstat now depends on the package 'nlme'.

 * spatstat now depends on R 3.2.2 or later.

 * Simulation algorithms have been accelerated; simulation outcomes   
   are *not* identical to those obtained from previous versions of spatstat. 

 * Determinantal point process models.

 * Random-effects and mixed-effects models for replicated patterns.

 * Dao-Genton test, and corresponding simulation envelopes.

 * Simulated annealing and simulated tempering.

 * spatstat colour tools now handle transparent colours.

 * Improvements to "[" and subset() methods

 * Extensions to kernel smoothing on a linear network.

 * Support for one-dimensional smoothing kernels.

 * Bug fix in Metropolis-Hastings simulation.

 * Mark correlation function may include weights.

 * Cross-correlation version of the mark correlation function.

 * Variance calculations for replicated patterns.

 * Penttinen pairwise interaction model.

 * Contour plots with colours determined by a colour map.

 * New dataset: Australian states and territories.

 * More support for multi-dimensional point patterns.

 * Minor improvements and bug fixes.

 * Version nickname: "Mixed Effects"

### NEW DATASET

 * austates  
   The states and large mainland territories of Australia  
   represented as polygonal regions forming a tessellation.

### NEW FUNCTIONS

 * dppm  
   Fit a determinantal point process model to point pattern data.

 * fitted.dppm, predict.dppm, intensity.dppm  
   Predict a fitted dppm object.

 * logLik.dppm, AIC.dppm, extractAIC.dppm, nobs.dppm  
   Likelihood and AIC for determinantal point process models  
   (enabling the use of 'step')

 * coef.dppm, formula.dppm, print.dppm, terms.dppm, labels.dppm,  
   model.frame.dppm, model.matrix.dppm, model.images.dppm,  
   is.stationary.dppm, reach.dppm, unitname.dppm, unitname<-.dppm, Window.dppm  
    Various methods for dppm objects.

 * parameters.dppm  
   Extract meaningful list of model parameters

 * objsurf.dppm  
   Objective function surface of a dppm object

 * residuals.dppm  
   Residual measure for a dppm object.

 * dppBessel, dppCauchy, dppGauss, dppMatern,	dppPowerExp  
   Determinantal Point Process models.

 * update.dppmodel              
   Set parameter values in a dpp model.

 * is.stationary.dppmodel, print.dppmodel, reach.dppmodel, valid.dppmodel      
   Basic information about a dpp model

 * rdpp, simulate.dppmodel		   
   Simulation of a dpp model.

 * intensity.dppmodel, Kmodel.dppmodel, pcfmodel.dppmodel  
   Moments of a dpp model

 * dim.dppmodel, dppapproxkernel, dppapproxpcf, dppeigen, dppfamily,  
   dppkernel, dppparbounds, dppspecdenrange, dppspecden  
   Helper functions for dpp models.

 * dclf.sigtrace, mad.sigtrace, mctest.sigtrace  
   Significance trace of Monte Carlo test

 * dg.test  
   Dao-Genton adjusted Monte Carlo goodness-of-fit test.

 * dg.envelope  
   Simulation envelopes corresponding to Dao-Genton test.

 * dg.sigtrace  
   Significance trace for Dao-Genton test

 * dg.progress  
   Progress plot for Dao-Genton test

 * markcrosscorr  
   Mark cross-correlation function for point patterns with  
   several columns of marks

 * fixef.mppm, ranef.mppm  
   Extract fixed effects and random effects from a point process model  
   fitted to replicated point patterns.

 * rtemper  
   Simulated annealing or simulated tempering.

 * to.opaque, to.transparent  
   Change transparency value in colours

 * rgb2hsva  
   Convert RGB to HSV data, like rgb2hsv, but preserving transparency.

 * superimpose.ppplist, superimpose.splitppp  
   New methods for 'superimpose' for lists of point patterns.

 * dkernel, pkernel, qkernel, rkernel  
   Probability density, cumulative probability, quantiles  
   and random generation from distributions used in basic one-dimensional  
   kernel smoothing.

 * kernel.factor  
   Auxiliary calculations for one-dimensional kernel smoothing.

 * PPversion, QQversion  
   Transformation of a summary function to its P-P or Q-Q counterpart.

 * spatdim  
   Spatial dimension of any object in the spatstat package.

 * as.boxx  
   Convert data to a multi-dimensional box.

 * intensity.ppx  
   Method for 'intensity' for multi-dimensional space-time point patterns.

 * fourierbasis  
   Evaluate Fourier basis functions in any number of dimensions.

 * valid  
   New generic function, with methods valid.ppm, valid.lppm, valid.dppmodel

 * emend, emend.ppm, emend.lppm  
   New generic function with methods for ppm and lppm.  
   emend.ppm is equivalent to project.ppm

 * Penttinen  
   New pairwise interaction model.

 * quantile.density  
   Calculates quantiles from kernel density estimates.

 * CDF.density  
   Calculates cumulative distribution function from kernel density estimates.

### SIGNIFICANT USER-VISIBLE CHANGES

 * simulation  
   Several basic simulation algorithms have been accelerated.  
   Consequently, simulation outcomes are not identical to   
   those obtained with previous versions of spatstat, even when the  
   same random seed is used. To ensure compatibility with previous  
   versions of spatstat, revert to the slower code by setting  
   spatstat.options(fastthin=FALSE, fastpois=FALSE).

 * mppm  
   Now handles models with a random effect component.  
   New argument 'random' is a formula specifying the random effect.

 * vcov.mppm  
   Now handles models with Gibbs interactions.

 * [.ppp  
   New argument 'clip' determines whether the window is clipped.

 * [.ppp  
   The previously-unused argument 'drop' now determines whether   
   to remove unused levels of a factor.

 * [.pp3, [.lpp, [.ppx, subset.ppp, subset.pp3, subset.lpp, subset.ppx  
   These methods now have an argument 'drop' which determines  
   whether to remove unused levels of a factor.

 * density.lpp  
   Now supports both the 'equal-split continuous' and   
   'equal-split discontinuous' smoothers. New argument 'continuous'   
   determines the choice of smoother.

 * envelope  
   New argument 'scale' allows global envelopes to have   
   width proportional to a specified function of r,  
   rather than constant width.

 * dclf.test, mad.test, dclf.progress, mad.progress, mctest.progress  
   New argument 'scale' allows summary function values to be rescaled  
   before the comparison is performed.

 * dclf.test, mad.test  
   New argument 'interpolate' supports interpolation of p-value.

 * dclf.progress, mad.progress, mctest.progress  
   New argument 'interpolate' supports interpolation of critical value of test.

 * simulate.ppm  
   New argument 'w' controls the window of the simulated patterns.

 * default.rmhcontrol, default.rmhexpand  
   New argument 'w'.

 * markcorr  
   New argument 'weights' allows computation of the weighted version  
   of the mark correlation function.

 * density.lpp  
   New argument 'kernel' specifies the smoothing kernel.  
   Any of the standard one-dimensional smoothing kernels can be used.

 * contour.im  
   New argument 'col' specifies the colour of the contour lines.  
   If 'col' is a colour map, then the contours are drawn in different colours.

 * plot.ppp  
   The default colour for the points is now a transparent grey,  
   if this is supported by the plot device.

 * rgbim, hsvim  
   New argument 'A' controls the alpha (transparency) channel.

 * rgb2hex, col2hex, paletteindex, is.colour, samecolour,  
   complementarycolour, is.grey, to.grey  
   These colour tools now handle transparent colours.

 * rgb2hex  
   New argument 'maxColorValue'

 * to.grey  
   New argument 'transparent'.

 * progressreport  
   New argument 'state'  
   New option: style="tk"

 * rLGCP  
   This function no longer requires the package 'RandomFields'  
   to be loaded explicitly. 

 * kppm  
   Fitting a model with clusters="LGCP" no longer requires the  
   package 'RandomFields' to be loaded explicitly.

 * rpoispp  
   Accelerated, when 'lambda' is a pixel image.

 * rthin  
   Accelerated, when 'P' is a single number.

 * spatstat.options  
   New options 'fastthin' and 'fastpois' enable fast simulation algorithms.  
   Set these options to FALSE to reproduce results obtained with  
   previous versions of spatstat.

 * split.ppp  
   The splitting variable 'f' can now be a logical vector.

 * collapse.fv  
   This is now treated as a method for the 'nlme' generic 'collapse'.  
   Its syntax has been adjusted slightly.

 * diagnose.ppm, plot.diagppm  
   New arguments col.neg, col.smooth control the colour maps.

 * valid.ppm  
   This is now a method for the generic function 'valid'.

 * ppm.ppp, ppm.quad  
   New argument 'emend', equivalent to 'project'.

 * "[<-.im"  
   Accepts an array for 'value'.

 * as.im.function  
   New argument 'strict'.

 * bw.ppl  
   New argument 'weights'.

 * plot.mppm  
   New argument 'se'.

 * dclf.test, mad.test  
   Formal arguments 'use.theo' and 'internal' have been removed.

 * predict.kppm, residuals.kppm  
   Now issues a warning when the calculation ignores the   
   cluster/Cox component and treats the model as if it were Poisson.  
   (This currently happens in predict.kppm when se=TRUE or interval != "none",  
   and in residuals.kppm when type != "raw").

### BUG FIXES

 1. lpp  
    Crashed if X was a 4-column matrix.  
    Fixed.

 2. plot.fv  
    Crashed with some graphics devices, if legend=TRUE.  
    Fixed.

 3. effectfun  
    Crashed if 'covname' was missing.  
    Fixed.

 4. rVarGamma, rMatClust, rThomas, rCauchy, rNeymanScott  
    Crashed if 'kappa' was a function or image instead of a single number.  
    [Spotted by Ben Ramage.]  
    Fixed.

 5. plot.mppm  
    Crashed with a message about "figure margins too large"  
    unless the argument se=FALSE was given explicitly.  
    Fixed.

 6. opening.owin, closing.owin  
    Crashed sometimes, with a message about a rectangle not containing a window.  
    Fixed.

 7. persp.im  
    Crashed if all pixel values were equal to zero (unless zlim was given).  
    Fixed.

 8. predict.ppm  
    Crashed sometimes if the model was fitted with use.gam=TRUE.

 9. as.linim.linfun  
    Generated an error ('L must be a linear network')  
    if extra arguments were given.

10. as.function.fv  
    Generated an error when executed in the 'covr' package.  
    Fixed.

11. rmh, simulate.ppm  
    Results were incorrect for inhomogeneous multitype models  
    simulated with fixall=TRUE (i.e. prescribing a fixed number of  
    points of each type) if the model was segregated   
    (i.e. if different types of points had different first order trend).  
    Fixed.

12. dclf.progress, mad.progress  
    Ignored the argument 'alternative'.   
    Fixed.

13. $<-.hyperframe, [<-.hyperframe  
    Result was garbled if 'value' was a hyperframe with one column.

14. rmh.ppm  
    Argument 'w' was ignored in some cases.  
    Fixed.

15. Hest  
    There was an artefact at r=0 when conditional=TRUE.  
    Fixed.

16. [.msr  
    The result of M[W] where W is a window  
    was a measure with window W, instead of intersect.owin(W, Window(M)).  
    Fixed.

17. pool.envelope  
    Did not always respect the value of 'use.theory'.  
    Fixed.

18. envelope, pool.envelope  
    If 'ginterval' was given, the results were in a slightly incorrect format.  
    Fixed.

19. pool.envelope  
    Did not check for compatible values of 'ginterval'.  
    Fixed.

Release notes are available in raw text format [here](spatstat-1.43-0.txt).
