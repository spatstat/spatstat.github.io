---
title: spatstat 1.42-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.42-0

### 27 May 2015

   We thank Anders Bilgrau, Ute Hahn, Jack Hywood, Tuomas Rajala,
   Cody Schank, Olivia Semboli and Ben Taylor for contributions.

### OVERVIEW

 * Version nickname: 'Life, The Universe and Everything'

 * Permutation test for difference between groups of point patterns.

 * Variational Bayes estimation for point process models.

 * Score test in anova.ppm

 * ROC curve, and discrimination index AUC, for fitted models.

 * Interactive text editor for spatial datasets.

 * Tools for analysing data on a tree. 

 * Kernel density/intensity estimation on a linear network.

 * Random pixel noise.

 * Improved behaviour of polygon geometry operations.

 * Improved support for cluster and Cox models.

 * Improved basic support for owin objects.

 * Improved support for tessellations.

 * More hierarchical Gibbs interactions.

 * Modifications to Kest.

 * summary method for Cox and cluster models.

 * class 'listof' is almost completely replaced by 'anylist' and 'solist'.

 * Improvements and bug fixes.

 * spatstat now depends on R version 3.2.0 or later.

### NEW FUNCTIONS

 * studpermu.test  
   Studentised permutation test for difference between groups of point patterns.  
   Generously contributed by Ute Hahn.

 * AIC.kppm, extractAIC.kppm, logLik.kppm, nobs.kppm  
   Methods for computing AIC for fitted Cox and cluster models.

 * transmat  
   Convert pixel arrays between different display conventions.

 * roc  
   Receiver Operating Characteristic curve.

 * auc  
   Discrimination index AUC (area under the ROC curve) 

 * edit.ppp, edit.psp, edit.im  
   Interactive text editor works for spatial datasets.

 * edit.hyperframe  
   Interactive text editor works for hyperframes.

 * parameters  
   Extract all parameters from a fitted model.

 * density.lpp  
   Kernel estimation of point process intensity on a linear network.

 * extractbranch, deletebranch, treeprune, treebranchlabels, begins  
   Tools for analysing data on a tree.

 * rnoise  
   Random pixel noise.

 * as.data.frame.owin  
   Convert a window to a data frame.

 * harmonise.owin  
   Convert several binary mask windows to a common pixel grid.

 * copyExampleFiles  
   Copy the raw data files from an installed dataset  
   to a chosen folder, for use in a practice exercise.

 * density.ppplist  
   Method for 'density' for lists of point patterns.

 * inradius  
   Radius of largest circle inside a window.

 * mergeLevels  
   Merge different levels of a factor.

 * relevel.im, relevel.ppp, relevel.ppx  
   Change the reference level of a factor.

 * simulate.profilepl  
   simulation method for models fitted by profile maximum pseudolikelihood.

 * predict.rho2hat  
   Prediction method for class rho2hat

 * with.msr  
   Evaluate (an expression involving) components of a measure. 

 * summary.kppm, print.summary.kppm, coef.summary.kppm  
   Methods for 'summary' and 'coef(summary(..))' for Cox and cluster models.

 * as.im.funxy  
   Method for as.im for class funxy.

 * shift.linim, scalardilate.linim, affine.linim  
   Geometrical transformations for 'linim' objects.

 * Smooth.solist  
   Smooth method for a list of spatial objects.

 * unitname.tess, unitname<-.tess  
   Tessellations now keep track of the name of the unit of length.

 * dirichletAreas  
   Faster algorithm for tile.areas(dirichlet(X)).

 * identify.lpp  
   Method for 'identify' for point patterns on a linear network.

 * HierStraussHard, HierHard  
   Hierarchical interactions for Gibbs models.

 * delaunayDistance, delaunayNetwork, dirichletEdges,   
   dirichletNetwork, dirichletVertices, dirichletWeights  
      These functions will replace delaunay.distance, delaunay.network,   
   dirichlet.edges, dirichlet.network, dirichlet.vertices and  
   dirichlet.weights respectively.  
   The latter are now 'deprecated'.

### SIGNIFICANT USER-VISIBLE CHANGES

 * ppm  
   Now supports Variational Bayes fitting method.

 * kppm  
   'AIC' and 'step' now work for kppm objects  
   fitted using maximum Palm likelihood.

 * kppm  
   The default for the weight function 'weightfun' has been changed,   
   for better performance.

 * envelope  
   envelope methods now have argument 'use.theory' specifying whether  
   to use the 'theoretical' value of the summary function when constructing  
   simultaneous envelopes.

 * anova.ppm  
   Now performs the Score Test, for Poisson models only,  
   if argument test="Rao" or test="score".

 * Kest  
   New argument 'rmax' controls maximum value of argument 'r'

 * diagnose.ppm  
   Now computes and prints the null standard deviation of the  
   smoothed Pearson residual field, when appropriate.

 * nncorr, nnmean, nnvario  
   New argument 'k' specifies k-th nearest neighbour.

 * quadrat.test.ppp, quadrat.test.quadratcount  
   New argument 'lambda' supports a test of the Poisson process   
   with given intensity 'lambda'.

 * clickpoly, clickbox  
   These functions now handle graphical arguments to polygon()  
   when drawing the resulting polygon or rectangle.

 * owin, as.owin, as.mask  
   owin(mask=D) or as.owin(D) or as.mask(D) will produce a binary mask window  
   if D is a data frame with two columns of (x,y) coordinates  
   or a data frame with three columns containing (x,y,logical).

 * as.owin.data.frame  
   W can now be a data frame with only two columns,  
   giving the spatial coordinates of the pixels that are inside the window.

 * rose  
   Tick marks now have labels showing the angle (in degrees or radians).

 * distcdf  
   New argument 'regularise' determines whether values at short distances  
   will be smoothed to avoid discretisation artefacts.

 * rpoislinetess  
   Return value now has an attribute 'lines' giving the   
   realisation of the Poisson line process.

 * intersect.owin, union.owin, setminus.owin  
   New argument 'p' controls resolution of polygon clipping algorithm.

 * intersect.owin, union.owin  
   Arguments may be lists of windows, of class 'solist'.  
   Formal arguments A and B have been removed.

 * superimpose  
   Now handles lists of point patterns   
   (objects of class 'ppplist' or 'splitppp')

 * density.ppp  
   New argument 'positive' allows the user to stipulate that  
   density values must be positive (avoiding numerical errors  
   which occasionally produce small negative values).

 * adaptive.density  
   Now accepts f = 0 (uniform intensity estimate) and  
   f = 1 (Voronoi intensity estimate) as well as 0 < f < 1.  
   Algorithm accelerated.

 * rSSI  
   Can now generate inhomogeneous patterns.

 * effectfun  
   Now works for 'kppm' and 'lppm' objects as well.

 * integral.im, integral.msr  
   Argument 'domain' can now be a tessellation;  
   the integral over each tile of the tessellation is returned.

 * allstats, compareFit, markcorr, split.ppx, by.ppp  
   Result is now of class 'anylist'.

 * by.im, density.splitppp, idw, model.images, nnmark, pixellate.ppp,  
   predict.lppm, predict.ppm, quadratcount.splitppp, quadratresample, relrisk,   
   Smooth.msr, split.im, tiles  
   Result is now of class 'solist'.

 * split.ppp  
   New argument 'reduce'.  
   Result now inherits class 'ppplist' and 'solist', as well as 'splitppp'

 * rLGCP  
   New argument 'nsim' allows multiple patterns to be generated.

 * alltypes  
   New argument 'reuse' determines whether all simulation envelopes  
   are based on the same set of simulated patterns, or on independent sets.

 * rpoispp, runifpoint  
   New argument 'ex' makes it possible to generate a random pattern  
   similar to an example point pattern.

 * effectfun  
   Argument 'covname' is not needed if the model has only one covariate.

 * quadratcount  
   Argument 'tess' can now be anything acceptable to as.tess.

 * tess  
   New argument 'unitname' specifies the name of the unit of length.  
   If it is missing, unitname information will be extracted from the  
   other data.

 * intersect.tess, chop.tess, quadrats  
   Results of these functions now have the same 'unitname' as their input.

 * persp.im, nnclean, plot.qqppm, plot.bw.optim  
   These plotting functions now obey spatstat.options('monochrome')

 * lurking  
   Now returns an object of class 'lurk' which has a plot method.  
   Two-standard-deviation limits are now plotted using grey shading.

 * marktable  
   New argument 'N' for studying the N nearest neighbours.     
   New argument 'collapse' for manipulating the contingency table.

 * harmonise.fv  
   Now discards columns with names which do not match.

 * eval.fv  
   New argument 'equiv' can be used to declare that two columns  
   with different names in different objects are equivalent.

 * quantile.ewcdf  
   New argument 'type' controls the type of quantile.

 * plot.imlist  
   New argument 'plotcommand' specifies how to plot each image.

 * persp.im  
   The lower extent of the apron can now be controlled by 'zlim'.

 * quadscheme  
   Argument 'method' is partially matched.

 * Kdot, Ldot  
   New argument 'from' is an alternative to 'i'.

 * Kcross, Lcross  
   New arguments 'from' and 'to' are alternatives to 'i' and 'j' respectively.

 * varblock  
   Changed the ordering (and therefore default colours/styles)   
   of curves in the plot, to match other functions like lohboot.

 * bw.diggle  
   New argument 'nr' controls accuracy.

 * textureplot  
   Now accepts a pixel image, a tessellation, or anything acceptable to as.tess.

 * textureplot  
   Line spacing in legend now matches line spacing in main display.

 * [.tess  
   Subset index can now be a window.

 * plot.tess  
   Can now plot a text label in each tile.

 * plot.tess  
   New argument 'do.plot'.

 * MultiHard, MultiStrauss, MultiStraussHard, HierStrauss  
   Printed output of fitted model now respects spatstat.options('terse').

 * print.ppm  
   Reduced redundancy in output in some cases.

 * print.msr  
   Responds better to spatstat.options('terse').

 * print.ppm, print.fii, print.interact  
   Irregular parameters are now printed to the number of significant figures  
   specified by options("digits").

 * square  
   New argument 'unitname'.

 * plot.fv  
   Return value is now invisible.

 * delaunay.distance, delaunay.network, dirichlet.edges,   
   dirichlet.network, dirichlet.vertices  
      These functions are now 'deprecated', and will be replaced by  
      delaunayDistance, delaunayNetwork, dirichletEdges,   
      dirichletNetwork and dirichletVertices respectively.

 * data(residualspaper)  
   In the real datasets (Fig1 and Fig11), the name of the unit of length  
   has now been recorded.

 * rLGCP  
   This function now requires the package 'RandomFields'  
   to be loaded explicitly by library(RandomFields) or require(RandomFields),   
   unless model="exp".

 * iplot, istat  
   These functions now require the package 'rpanel'   
   to be loaded explicitly by library(rpanel) or require(rpanel).

 * ppm, quadscheme  
   Improved calculation of Dirichlet weights.

 * countends  
   New argument 'toler' controls numerical errors

 * diagnose.ppm  
   Improved handling of additional graphics arguments.

 * pcf3est  
   Mathematical labels changed.

 * plot.hyperframe  
   Default margin spacing has been increased.

### BUG FIXES

 1. Kinhom, Linhom  
    The value of 'theo' was erroneously rescaled   
    by a small amount, when renormalise=TRUE (the default).  
    Fixed.

 2. Kmark  
    Values were erroneously rescaled.  
    Fixed.

 3. union.owin  
    Strange results were sometimes obtained when taking the union   
    of more than two windows.  
    Fixed.

 4. rpoispp3   
    Implementation was incorrect for nsim > 1.  
    (Results may have been incorrect.)  
    Spotted by Jack Hywood.  
    Fixed.

 5. as.owin.data.frame  
    Crashed if the window was not connected.  
    Fixed.

 6. Frame<-  
    Crashed when applied to a binary mask.  
    Fixed.

 7. rho2hat  
    Crashed if cov1="x" and cov2="y".  
    Fixed.

 8. as.mask  
    Crashed sometimes when only the argument 'xy' was given.  
    Fixed.

 9. ppm  
    Crashed (rarely) when method='ho' if the simulated pattern was empty.  
    Fixed.

10. istat, iplot  
    Crashed in recent versions of rpanel.  
    Fixed.

11. convexhull  
    Crashed if applied to a 'psp' object.  
    Fixed.

12. plot.ppm  
    Crashed with message about 'variable lengths differ'.  
    Fixed.

13. plot.solist  
    Crashed when applied to a list of point patterns  
    if some patterns had more than one column of marks.  
    Fixed.

14. Smooth.ppp  
    Crashed if applied to a point pattern with several columns of marks  
    if some of the columns were factors.  
    Fixed.

15. runifpoint3, rpoispp3  
    Crashed if nsim > 1.  
    Spotted by Jack Hywood.  
    Fixed.

16. hist.im  
    Crashed if argument 'freq' was given.  
    Fixed.

17. MultiStraussHard  
    Generated misleading error messages (e.g. 'model is invalid')   
    when arguments 'iradii' and 'hradii' did not have the same pattern of NA's.  
    Fixed.

18. plot.solist  
    Figures were sometimes aligned incorrectly   
    when the argument 'panel.args' was given.  
    Fixed.

19. scaletointerval  
    Results sometimes fell slightly outside the desired interval  
    due to numerical error.  
    Fixed.

20. plot.solist  
    Behaved incorrectly when plotcommand='persp'.  
    Fixed.

21. "[.hyperframe"  
    Sometimes returned an 'anylist' when it should have returned a 'solist'.  
    Fixed.

22. plot.im  
    Did not plot surrounding frame box when ribbon=FALSE.  
    Fixed.

23. envelope  
    The functions stored when savefuns=TRUE did not inherit   
    the correct name for the unit of length.  
    Fixed.

24. print.ppm, print.fii, print.interact  
    Layout was misaligned.  
    Fixed.

25. plot.plotppm  
    Paused for input when it was not appropriate.  
    Fixed.

26. plot.fv  
    On png devices, the legend box was drawn with a white background,  
    obscuring the main plot.   
    Fixed.

27. plot.owin, plot.ppp, plot.im  
    There was unnecessary extra space above the main title.  
    Fixed.

28. plot.rho2hat  
    Colour map ribbon was drawn but not annotated.  
    Fixed.

29. density.splitppp, density.ppplist  
    Format was out of order if se=TRUE.  
    Fixed.

30. MultiStraussHard  
    project.ppm sometimes yielded a model that was still invalid.  
    Fixed.

Release notes are available in raw text format [here](spatstat-1.42-0.txt).
