---
title: spatstat 1.45-2 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.45-2

### 9 May 2016

   We thank Ottmar Cronie, Virginia Morera Pujol,
   Sven Wagner and Marie-Colette van Lieshout for contributions.

### OVERVIEW

 * Recursive-partition point process models.

 * Minkowski sum, morphological dilation and erosion with any shape.

 * Important bug fix in spatial CDF tests.

 * More bug fixes for replicated patterns.

 * Simulate a model fitted to replicated point patterns.

 * Inhomogeneous multitype F and G functions.

 * Summary functions recognise correction="all"

 * Leverage and influence code handles bigger datasets.

 * More support for pixel images.

 * Improved progress reports.

 * New dataset 'redwood3'

 * spatstat now Depends on the package 'rpart'

 * Version nickname: 'Caretaker Mode'

### NEW FUNCTIONS

 * as.im.data.frame
   Build a pixel image from a data frame of coordinates and pixel values.

 * covering
   Cover a window using discs of a given radius.

 * dilationAny, erosionAny, %(-)%
   Morphological dilation and erosion by any shape.

 * FmultiInhom, GmultiInhom
   Inhomogeneous multitype/marked versions of the summary functions Fest, Gest.

 * kernel.moment
   Moment or incomplete moment of smoothing kernel.

 * MinkowskiSum, %(+)%
   Minkowski sum of two windows: A %(+)% B, or MinkowskiSum(A,B)

 * nobjects
   New generic function for counting the number of 'things' in a dataset.
   There are methods for ppp, ppx, psp, tess.

 * parameters.interact, parameters.fii
   Extract parameters from interpoint interactions.
   [These existing functions are now documented.]

 * ppmInfluence
   Calculate leverage.ppm, influence.ppm and dfbetas.ppm efficiently.

 * rppm, plot.rppm, predict.rppm, prune.rppm
   Recursive-partition point process models

 * simulate.mppm
   Simulate a point process model fitted to replicated point patterns.

 * update.interact
   Update the parameters of an interpoint interaction.
   [This existing function is now documented.]

 * where.max, where.min
   Find the spatial location(s) where a pixel image achieves its
   maximum or minimum value.

### SIGNIFICANT USER-VISIBLE CHANGES

 * cdf.test.mppm
   Now handles Gibbs models.
   Now recognises covariate="x" or "y".

 * leverage.ppm, influence.ppm, dfbetas.ppm
   For Gibbs models, memory usage has been dramatically reduced, 
   so the code can handle larger datasets and finer quadrature schemes.

 * plot.im
   Now handles complex-valued images.

 * connected.im
   Now handles a logical-valued image properly.

 * qqplot.ppm
   Argument 'expr' can now be a list of point patterns,
   or an envelope object containing a list of point patterns.

 * as.layered
   Default method now handles a (vanilla) list of spatial objects.

 * summary functions
   The argument 'correction="all"' is now recognised: it selects
   all the available options. 
        This applies to Fest, F3est, Gest, Gcross, Gdot, Gmulti, G3est, Gfox,
    	Gcom, Gres, Hest, Jest, Jmulti, Jcross, Jdot, Jfox,
	Kest, Kinhom, Kmulti, Kcross, Kdot, Kcom, Kres, 
	Kmulti.inhom, Kcross.inhom, Kdot.inhom, Kscaled, Ksector, Kmark, 
	K3est, Lscaled, markcorr, markcrosscorr,
	nnorient, pairorient, pcfinhom, pcfcross.inhom, pcfcross, pcf, Tstat.

 * clarkevans
   The argument 'correction="all"' is now recognised: it selects
   all the available options. [This is also the default.]

 * predict.mppm
   The argument 'type="all"' is now recognised: it selects
   all the available options. [This is also the default.]

 * plot.kppm
   The argument 'what="all"' is now recognised: it selects
   all the available options. [This is also the default.]

 * connected.im, connected.owin
   Arguments '...' now determine pixel resolution.

 * anova.mppm
   New argument 'fine'

 * as.owin.data.frame
   New argument 'step'

 * discs
   Now accepts a single numeric value for 'radii'.

 * plot.ppp, plot.profilepl, plot.quadratcount, plot.quadrattest, plot.tess
   Now recognise graphics parameters for text, such as 'family' and 'srt'

 * as.function.tess
   New argument 'values' specifies the function values.

 * cdf.test
   Calculations are more robust against numerical rounding effects.

 * progressreport
   Behaviour improved. New arguments 'tick', 'showtime'.

 * simulate.ppm
   New argument 'verbose'

 * compileK, compilepcf
   These internal functions are now documented.

### BUG FIXES

 * cdf.test.ppm
   Calculation of p-values was incorrect for Gibbs models: 
   1-p was computed instead of p.
   [Spotted by Sven Wagner.]
   Fixed.

 * subfits
   The interaction coefficients of the submodels were incorrect
   for Gibbs models with a multitype interaction (MultiStrauss, etc).
   [Spotted by Sven Wagner.]
   Fixed.

 * subfits
   Crashed when a Gibbs model included factor-valued spatial covariates
   and not all levels of the factor were present in each row of the data.
   [Spotted by Sven Wagner.]
   Fixed.

 * subfits
   For Gibbs models with a multitype interaction (MultiStrauss, etc),
   computation of the conditional intensity caused an error.
   [Spotted by Sven Wagner.]
   Fixed.

 * diagnose.ppm
   Crashed if what="smooth", when the original window was a rectangle.
   [Spotted by Virginia Morera Pujol.]
   Fixed.

 * mppm
   The x and y coordinates were not permitted in the 
   random-effects formula 'random'.
   [Spotted by Sven Wagner.]
   Fixed.

 * vcov.ppm
   The result had no 'dimnames', if the model was fitted using method="ho".
   Fixed.
