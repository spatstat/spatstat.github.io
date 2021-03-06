---
title: spatstat 1.40-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.40-0

### 31 December 2014

   We thank Markus Herrmann, Peter Kovesi, Andrew Lister,
   Enrique Miranda, Tuomas Rajala, Brian Ripley, Dominic Schuhmacher
   and Maxime Woringer for contributions.

### OVERVIEW

 * Important bug fixes.

 * Mathematical operators now apply to images.

 * Parametric estimates of relative risk from fitted point process models.

 * Standard errors for relative risk (parametric and non-parametric).

 * Kernel smoothing and rose diagrams for angular data.

 * Perceptually uniform colour maps. 

 * Hierarchical interactions for multitype patterns.

 * Hard core parameters in all interactions no longer need to be specified  
     and will be estimated from data.

 * Improvements to analysis of deviance and model selection.

 * New datasets.

 * New vignette, summarising all datasets installed with spatstat.

 * Tests and diagnostics now include a Monte Carlo option.

 * Faster checking of large datasets.

 * Faster simulations.

 * Code for drawing diagrams (arrows, scale bars).

 * Version nickname: 'Do The Maths'

### NEW DATASETS

 * bdspots  
   Breakdown spots on microelectronic capacitor electrodes.  
   Generously contributed by Prof Enrique Miranda.

 * Kovesi  
   Colour maps with perceptually uniform contrast.  
   Generously contributed by Peter Kovesi.

### NEW FUNCTIONS

 * Mathematical operations are now supported for images.  
   For example:   alpha <- atan(bei.extra$grad) * 180/pi  
   See help(Math.im)

 * relrisk.ppm  
   Spatially-varying probabilities of different types of points  
   predicted by a fitted point process model.

 * circdensity  
   Kernel density estimate for angular data

 * rose  
   Rose diagram (rose of directions) for angular data

 * nnorient  
   Nearest neighbour orientation distribution.

 * AIC.ppm  
   Calculate AIC of a Gibbs model using Takeuchi's rule.

 * interp.colours  
   Interpolate a sequence of colour values.

 * anyDuplicated.ppp, anyDuplicated.ppx  
   Fast replacements for any(duplicated(x)) for point patterns.

 * textstring, onearrow, yardstick  
   Objects representing a text string, an arrow, or a scale bar,  
   for use in drawing spatial diagrams.

 * plot.imlist, image.imlist, contour.imlist  
   Methods for the new class 'imlist'

 * [<-.layered,  [[<-.layered  
   More support for class 'layered'

### SIGNIFICANT USER-VISIBLE CHANGES

 * (vignettes)  
   New vignette 'datasets' summarises all the datasets installed  
   with the spatstat package.

 * relrisk  
   The function relrisk is now generic, with methods for ppp and ppm.  
   New argument 'relative' specifies whether to calculate the relative risk  
   or the absolute probability of each type of point.  
   New argument 'se' specifies whether to calculate standard errors.

 * plot.im  
   The default colour map for plotting images,  
   specified by spatstat.options('image.colfun'),   
   has been changed to a perceptually uniform map.

 * DiggleGratton, Fiksel, MultiHard, MultiStraussHard  
   The hard core distance parameters in these models  
   can now be omitted by the user, and will be estimated automatically  
   from data (by the 'self-starting' feature of interactions).  
   This was already true of Hardcore and StraussHard.

 * Hybrid  
   Hybrid models now apply the 'self-starting' feature  
   to each component model. 

 * anova.ppm  
   Can now reconcile models fitted using different dummy points,  
   different values of 'rbord', different values of 'use.gam', etc. 

 * profilepl  
   New argument 'aic' makes it possible to optimise the parameters   
   by minimising AIC.

 * profilepl  
   No longer requires values for parameters which are 'optional'   
   (such as the hard core distance).

 * rmh, simulate.ppm, rmh.ppm, rmh.default  
   The Metropolis-Hastings algorithm now starts by deleting any points  
   in the initial state that are 'illegal' (i.e. whose conditional intensity  
   is equal to zero). This ensures that the result of rmh   
   never contains illegal points.

 * runifpoint, rpoispp, rStrauss, rHardcore, rStraussHard,  
   rDiggleGratton, rDGS, runifdisc, rpoint, rMaternI, rMaternII, rSSI,  
   rPoissonCluster, rGaussPoisson, rstrat, rsyst, rcell, rthin, rjitter,  
   rNeymanScott, rMatClust, rThomas, rCauchy, rVarGamma, rmpoint, rmpoispp,   
   runifpointOnLines, rpoisppOnLines, runiflpp, rpoislpp, runifpointx,   
   rpoisppx, runifpoint3, rpoispp3  
      These random point pattern generators now have an argument 'nsim'  
      specifying the number of simulated realisations to be generated.

 * pairorient  
   New argument 'cumulative'.  
   New algorithm to compute kernel estimate of probability density.  
   Default behaviour changed.  
   Argument 'units' has been renamed 'unit' for consistency.  
   Labels and descriptions of columns have been corrected.

 * predict.ppm  
   New syntax (backward-compatible).  
   New argument 'se' replaces option 'type="se"'.  
   Old argument 'total' is deprecated: use 'window' and set 'type="count"'.

 * cdf.test  
   The methods for class 'ppm' and 'lppm' now handle Gibbs models  
   and perform a Monte Carlo test in this case.

 * lurking, diagnose.ppm  
   Lurking variable plot can now include simulation envelopes.

 * rmh.ppm  
   New argument 'w' determines the window in which the simulated pattern  
   is generated.

 * ppp  
   Accelerated.

 * Gcom, Gres  
   When conditional=TRUE and restrict=TRUE, the Hanisch estimate  
   was not calculated exactly as described in Appendix E.1 of   
   Baddeley, Rubak and Moller (2011). The intensity was estimated   
   on the full window rather than the eroded window.  
   Fixed.   

 * step, drop1, add1, extractAIC  
   The AIC of a Gibbs model is now calculated using Takeuchi's rule  
   for the degrees of freedom.

 * model.matrix.ppm, model.matrix.kppm  
   New argument 'Q' allows prediction at any desired locations.

 * vcov.ppm  
   New argument 'fine' gives more control over computation.

 * predict.ppm  
   For multitype models, when the result is a list of images,  
   the names of list entries are now identical to the mark levels  
   (e.g. "hickory" instead of "markhickory")

 * print.slrm  
   Output now respects options('width')

 * image.listof  
   New argument 'ribmar' controls margin space around the ribbon  
   when equal.ribbon=TRUE.

 * integral.im  
   New argument 'domain' specifies the domain of integration.

 * plot.fasp  
   New argument 'transpose' allows rows and columns to be exchanged.

 * plot.im  
   The list 'ribargs' can now include the parameter 'labels'.

 * rmh, rpoint, rpoispp, rmpoint, rmpoispp  
   Accelerated, for inhomogeneous processes.

 * stienen  
   Now recognises the parameter 'lwd'. 

 * suffstat  
   Accelerated (also affects ppm with method='ho').

 * Poisson, AreaInter, BadGey, Concom, DiggleGatesStibbard, DiggleGratton,  
   Fiksel, Geyer, Hardcore, Hybrid, LennardJones, MultiHard, MultiStrauss,  
   MultiStraussHard, OrdThresh, Ord, PairPiece, Pairwise, SatPiece,   
   Saturated, Softcore, Strauss, StraussHard, Triplets  
      These functions can now be printed (by typing the function name)  
      to give a sensible description of the required syntax.

 * fitin  
   A plot of the fitted interpoint interaction of a point process model  
   e.g. plot(fitin(ppm(swedishpines ~ 1, Strauss(9))))  
   now shows the unit of length on the x-axis.

 * fitin  
   Plots of the fitted interpoint interaction are now possible  
   for some higher-order interactions such as Geyer and AreaInter.

 * anova.ppm  
   New argument 'warn' to suppress warnings.

 * rmhmodel.ppm  
   Argument 'win' renamed 'w' for consistency with other functions.

 * print.ppm  
   Printed output for the fitted regular parameters  
   now respects options('digits').

 * print.ppm, print.summary.ppm  
   Output now respects options('width') and spatstat.options('terse')

 * print.ppm  
   By default, standard errors are not printed   
   for a model fitted with method="logi" (due to computational load)

 * plot.profilepl  
   Now recognises 'lty', 'lwd', 'col' etc

 * vesicles, gorillas  
   Some of the raw data files for these datasets are also installed in spatstat  
   for demonstration and training purposes. 

### BUG FIXES

 1. rmh, rmh.ppm, rmh.default, simulate.ppm  
    The result of simulating a model with a hard core  
    did not necessarily respect the hard core constraint,  
    and simulation of a model with strong inhibition  
    did not necessarily converge.   
    This only happened if the first order trend was large,  
    the starting state (n.start or x.start) was not given,  
    and the number of iterations (nrep) was not very large.  
    It occurred because of a poor choice for the default starting state.  
    Bug was present since about 2010.  
    Fixed.

 2. markcorrint  
    Results were completely incorrect.  
    Bug introduced in spatstat 1.39-0, october 2014.  
    Fixed.

 3. Kinhom  
    Ignored argument 'reciplambda2' in some cases.  
    Bug introduced in spatstat 1.39-0, october 2014.  
    Fixed.

 4. relrisk  
    When at="pixels", a small fraction of pixel values were sometimes  
    wildly inaccurate, due to numerical errors. This affected the   
    range of values in the result, and therefore the appearance of plots.  
    Fixed.

 5. model.images  
    Crashed if the model was multitype.  
    Fixed.

 6. profilepl  
    Crashed in some cases when the interaction was multitype.  
    [Spotted by Andrew Lister.]  
    Fixed.

 7. profilepl  
    Crashed if the model involved covariates that were not  
    given in a 'data' argument.  
    Fixed.

 8. envelope.ppm  
    Crashed if global=TRUE and savefuns=TRUE.  
    Fixed.

 9. setminus.owin  
    Crashed if the result was empty and the input was polygonal.  
    Fixed.

10. predict.ppm  
    Crashed sometimes when type="cif" and ngrid was very large.  
    Fixed.

11. pixelquad  
    If X was a multitype point pattern, the result was mangled.  
    Fixed.

12. relrisk  
    Did not accept a character string value for the argument 'case'.  
    Fixed.

13. intensity.ppm  
    Format of result was incorrect for ppm(Y ~ 1) where Y is multitype.  
    Fixed.

14. $<-.hyperframe  
    Columns containing character values were converted to factors.  
    Fixed.

15. clickppp  
    Sometimes filled the window in solid black colour..  
    Fixed.

16. plot.psp  
    Ignored 'show.all' in some cases.  
    Fixed.

17. plot.ppp  
    Warned about NA values amongst the marks, even if there were no NA's  
    in the column(s) of marks selected by the argument 'which.marks'.  
    Fixed.

18. stienen  
    Did not suppress the border circles when border=FALSE.  
    Fixed.

Release notes are available in raw text format [here](spatstat-1.40-0.txt).
