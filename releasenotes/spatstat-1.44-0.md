---
title: spatstat 1.44-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.44-0

### 22 December 2015

   We thank Jonas Geldmann, Andrew Hardegen, Kassel Hingee,
   Tom Lawrence, Robin Milne, Gopalan Nair, Suman Rakshit, Peijian Shi
   and Rasmus Waagepetersen for contributions.

### OVERVIEW

 * More support for multidimensional point patterns and point processes.

 * More options for envelopes and related Monte Carlo tests.

 * More support for model comparison.

 * k-th nearest neighbours on a linear network.

 * Penttinen process can be simulated (by Metropolis-Hastings or CFTP).

 * Calculate the predicted variance of number of points.

 * Convexifying operation for sets.

 * Subdivide a linear network.

 * Accelerated algorithms for linear networks.

 * Quadrat counting accelerated, in some cases.

 * Version nickname: "The Sound of One Hand Typing"

### NEW FUNCTIONS

 * rPenttinen

   Simulate the Penttinen process using perfect simulation.

 * varcount

   Given a point process model, compute the predicted variance
   of the number of points falling in a window.

 * inside.boxx

   Test whether multidimensional points lie inside a specified 
   multidimensional box.

 * lixellate

   Divide each segment of a linear network into smaller segments.

 * nsegments.linnet, nsegments.lpp

   Count the number of line segments in a linear network.

 * grow.boxx

   Expand a multidimensional box.

 * deviance.ppm, deviance.lppm

   Deviance for a fitted point process model.

 * pseudoR2

   Pseudo-R-squared for a fitted point process model.

 * tiles.empty

   Checks whether each tile of a tessellation is empty or nonempty.

 * summary.linim

   Summary for a pixel image on a linear network.

### SIGNIFICANT USER-VISIBLE CHANGES

 * rMaternI, rMaternII
   These functions can now generate random patterns in 
   three dimensions and higher dimensions, when the argument
   "win" is of class "box3" or "boxx".

 * "[.ppx"
   The subset index 'i' may now be a spatial domain
   of class 'boxx' or 'box3'.

 * rmh.ppm, rmhmodel.ppm, simulate.ppm
   A model fitted using the 'Penttinen' interaction can now be simulated.

 * rmh.default, rmhmodel.default
   These functions now recognise cif='penttinen' for the Penttinen interaction.

 * envelope
   New argument 'clamp' gives greater control over one-sided envelopes.

 * dclf.test, mad.test, dclf.progress, mad.progress, 
   dclf.sigtrace, mad.sigtrace
   New argument 'clamp' determines the test statistic for one-sided tests.

 * dclf.progress, mad.progress, dclf.sigtrace, mad.sigtrace,
   mctest.progress, mctest.sigtrace, dg.progress, dg.sigtrace
   New argument 'rmin' determines the left endpoint of the test interval.

 * dclf.test, mad.test, dg.test, dg.progress, dg.sigtrace, dg.envelope
   (also accepted by dclf.progress, mad.progress, dclf.sigtrace, mad.sigtrace)
   New argument 'leaveout' specifies how to calculate the deviation
   between the observed summary function and nominal reference value.

 * envelope
   New argument 'funargs'

 * Hest
   Argument X can now be a pixel image with logical values.
   New argument 'W'. [Based on code by Kassel Hingee.]

 * nncross.lpp, distfun.lpp
   New argument 'k' allows calculation of k-th nearest neighbour.
   Computation accelerated.

 * logLik.ppm
   New argument 'absolute'.

 * plot.kppm
   New arguments 'pause' and 'xname'.

 * tess
   Argument 'window' is ignored when xgrid, ygrid are given.

 * as.polygonal
   Can now repair errors in polygon data, if repair=TRUE.

 * rStrauss, rHardcore, rStraussHard, rDiggleGratton, rDGS, rPenttinen
   New argument 'drop'.

 * Kest.fft
   Now has '...' arguments allowing control of spatial resolution.

 * lppm
   Computation accelerated.

 * quadratcount.ppp
   Computation accelerated in some cases.

 * dg.test
   Computation accelerated.

### BUG FIXES

 1. runifpointx, rpoisppx
    Crashed if nsim > 1.
    Fixed.

 2. triangulate.owin
   Results were incorrect in some special cases.
   Fixed.

 3. quadrat.test, clarkevans.test
   In rare cases, the computed Monte Carlo p-value could have been
   greater than 1. This could have occurred only when nsim was an even number
   and when the correct p-value was equal to 1.
   Fixed.

 4. linearmarkequal
   Result was a data frame instead of an 'fv' object.
   Fixed.

 5. point-in-polygon test
   The function inside.owin could take a very long time to check
   whether points are inside a polygonal window, if the coordinates
   were very large numbers. This was due to numerical overflow.
   (Fixed??)

 6. as.fv.kppm	
   Crashed if the model was not fitted by minimum contrast.
   Fixed.

  7. plot.fv
   Crashed in some obscure cases.
   Fixed.

  8. collapse.fv
   Did not allow 'same=NULL'.
   Fixed.

  9. dclf.progress, mad.progress, dg.progress, 
     dclf.sigtrace, mad.sigtrace, dg.sigtrace
   The results could not be re-plotted using a plot formula,
   because the internal data were slightly corrupted.
   Fixed.

  10. Kest.fft
   Result was incorrectly normalised.
   Fixed.

  11. crosspairs
   If X and Y were identical point patterns,
   the result was not necessarily symmetric
   (on some machines) due to numerical artifacts.
   Fixed.

  12. plot.fv
   Lines were not correctly clipped to the plot region when 'ylim' was given.
   Fixed.

  13. pool.envelope
   The 'scale' argument was not handled correctly.
   Fixed.

Release notes are available in raw text format [here](spatstat-1.43-0.txt).
