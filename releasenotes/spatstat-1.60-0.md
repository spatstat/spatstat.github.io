---
title: spatstat 1.60-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.60-0

### 23 June 2019

   We thank Ottmar Cronie, Tilman Davies, Andrew Hardegen,
   Tom Lawrence, Robin Milne, Mehdi Moradi, Gopalan Nair,
   Tim Pollington and Suman Rakshit for contributions.

### OVERVIEW

 * Random thinning and random labelling of spatial patterns  
    extended to different types of pattern.

 * Confidence intervals for multitype K functions.

 * Envelopes for balanced two-stage test

 * Accelerated some code.

 * Minor bug fixes and improvements.

 * Package built under R 3.6.0.

 * Version nickname: 'Swinging Sixties'

### NEW FUNCTIONS

 * bits.envelope  
    Global simulation envelope corresponding to bits.test,  
    the balanced independent two-stage Monte Carlo test.

 * extrapolate.psp  
    Extrapolate line segments to obtain infinite lines.

 * uniquemap  
    Map duplicate points to unique representatives.  
    Generic with methods for ppp, lpp, ppx

 * uniquemap.data.frame  
    Map duplicate rows to unique representatives

 * localKcross, localLcross, localKdot, localLdot,  
    localKcross.inhom, localLcross.inhom  
    Multitype local K functions.

### SIGNIFICANT USER-VISIBLE CHANGES

 * lohboot  
    Now works for multitype K functions Kcross, Kdot, Lcross, Ldot,  
    Kcross.inhom, Lcross.inhom.

 * Kinhom, pcfinhom  
    Leave-one-out calculation is implemented when 'lambda' is a fitted model  
    of class 'dppm'.

 * Kcross.inhom, Kdot.inhom, Lcross.inhom, Ldot.inhom  
    Leave-one-out calculation is implemented when 'lambdaX' is a fitted model  
    of class 'dppm'.

 * rthin, rlabel  
    These functions now work on point patterns of all classes  
    (ppp, lpp, pp3, ppx) and line segment patterns (psp).

 * bw.abram  
    New argument 'smoother' determines how the pilot estimate is computed.  
    Formal arguments rearranged. 

 * plot.im  
    New argument 'riblab'.

 * rlabel  
    New arguments 'nsim' and 'drop'.

 * localK, localKinhom  
    New argument 'rmax'.

 * rLGCP  
    Accelerated.

 * anyDuplicated.ppp  
    Accelerated.

 * duplicated.ppp  
    Accelerated, in most cases.

 * simulate.kppm  
    Accelerated, for LGCP models. 

 * predict.ppm  
    Accelerated, for models fitted with method="VBlogi"

 * print.rmhmodel  
    Output improved.

### BUG FIXES

1. plot.linim, plot.linfun  
     Not all the entries of 'leg.args' were passed to text.default.  
     Fixed.

2. densityVoronoi.ppp  
     Did not correctly handle patterns containing duplicated points.  
     Fixed.

3. markcorr  
     The argument 'correction="none"' did not generate any results.  
     [Spotted by Tim Pollington.]  
     Fixed.

4. names<-.fv  
     Did not adjust the plotting formula, so that a subsequent call to plot.fv  
     would complain about missing variables.  
     Fixed.

5. im.apply  
     Crashed if 'FUN' returned factor values.  
     Fixed.

6. stienenSet  
     Crashed if the data contained duplicated points.  
     Fixed.

7. predict.ppm, effectfun  
     Crashed in some cases, with the message 'ncol(x)=nrow(v) is not TRUE'.  
     Fixed.

8. parres  
     Crashed in some cases, with the message 'logical subscript too long'.  
     Fixed.

9. dclf.test, mad.test, dg.test, bits.test  
     Crashed in some cases if the summary function values were infinite or NA.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.60-0.txt).
