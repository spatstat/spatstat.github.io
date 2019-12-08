---
title: spatstat 1.62-1 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.62-1

### 08 December 2019

   We thank Mohammad Ghorbani, Ute Hahn, Abdollah Jalilian, Nestor Luambua,
   Greg McSwiggan, Annie Mollie and Jakob Gulddahl Rasmussen for contributions.

### OVERVIEW

 * spatstat now requires spatstat.utils version 1.15-0  
    and goftest version 1.2-2.

 * Nearest Neighbour Index function can now return mark values.

 * Important fix in Ripley isotropic correction.

 * Index of repulsion strength for determinantal point process models.

 * Nearest neighbours between two point patterns in any number of dimensions.

 * More options for handling bad simulation outcomes in envelope().

 * Bandwidth selectors warn about extreme values of bandwidth.

 * Tessellations on a linear network can now have marks.

 * New functions for simulating point processes on a linear network.

 * More functions for manipulating tessellations on a linear network.

 * mppm accepts case weights.

 * Bug fixes and minor improvements.

 * Nickname: 'An update which will live in infamy'

### NEW FUNCTIONS

 * repul  
    Repulsiveness index for a determinantal point process model.

 * reach.kppm  
    Reach (interaction distance) for a Cox or cluster point process model.

 * summary.dppm, print.summary.dppm  
    Summary method for determinantal point process models.

 * nncross.ppx  
    Nearest neighbours between two point patterns in any number of dimensions.

 * uniquemap.matrix  
    Method for uniquemap for matrices.

 * repairNetwork  
    Detect and repair inconsistencies in internal data  
    in a linnet or lpp object.

 * marks<-.lintess, unmark.lintess  
    Assign marks to the tiles of a tessellation on a linear network.

 * marks.lintess  
    Extract the marks of the tiles of a tessellation on a linear network.

 * tilenames.lintess  
    Extract the names of the tiles in a tessellation on a linear network

 * tilenames<-.lintess  
    Change the names of the tiles in a tessellation on a linear network

 * nobjects.lintess  
    Count the number of tiles in a tessellation on a linear network

 * as.data.frame.lintess  
    Convert a tessellation on a linear network into a data frame.

 * rcelllpp  
    Simulate the cell point process on a linear network

 * rSwitzerlpp  
    Simulate the Switzer-type point process on a linear network

 * intersect.lintess  
    Form the intersection of two tessellations on a linear network

 * chop.linnet  
    Divide a linear network into tiles using infinite lines

### SIGNIFICANT USER-VISIBLE CHANGES

 * lintess  
    New argument 'marks'  
    Tessellations can now have marks.

 * tilenames, tilenames<-  
    These functions are now generic, with methods for 'tess' and 'lintess'

 * mppm  
    New argument 'weights' specifies case weights for each row of data.

 * unstack.lintess  
    Now handles marks.

 * plot.lintess  
    Modified to display the marks attached to the tiles.  
    Changed options: style=c("colour", "width", "image").

 * as.linfun.lintess  
    The default function values are the marks.

 * print.lintess, summary.lintess, print.summary.lintess  
    Output now includes information about marks.

 * nnfun.ppp, nnfun.psp, nnfun.lpp  
    New argument 'value' specifies whether to return the index of the  
    nearest neighbour or the mark value of the nearest neighbour.

 * envelope.ppp, envelope.ppm, envelope.kppm, envelope.pp3  
    New arguments 'rejectNA' and 'silent'.

 * envelope.lpp, envelope.lppm  
    New arguments 'maxnerr', 'rejectNA' and 'silent'.

 * plot.psp  
    New argument 'col' gives control over the colour map  
    representing the values of marks attached to the segments.

 * plot.im  
    Some warnings are suppressed when do.plot=FALSE.

 * plot.linim  
    New explicit argument 'box' determines whether to plot a bounding box.  
    Default is now FALSE in all cases.

 * Kest, Kinhom, pcf, pcfinhom, edge.Ripley  
    Calculation of isotropic edge correction for polygonal windows  
    has changed slightly. Results are believed to be more accurate.  
    Computation has been accelerated by about 20 percent in typical cases.

 * bw.diggle, bw.ppl, bw.lppl, bw.pcf, bw.CvL, bw.voronoi  
    A warning is issued if the optimal value of the cross-validation criterion  
    occurs at an endpoint of the search interval.  
    New argument 'warn'.

 * mad.test, dclf.test, dg.test, bits.test  
    Function values which are infinite, NA or NaN are now ignored  
    in the calculation (with a warning) instead of causing an error.  
    Warning messages are more detailed.

 * rmhcontrol, rmh  
    The parameter 'nsave' can now be a vector of integers.

 * diagnose.ppm  
    Accelerated, when type="inverse", for models without a hard core.

 * uniquemap.data.frame  
    Accelerated for some cases.

 * vcov.ppm, vcov.mppm  
    New argument 'nacoef.action' specifies what to do if  
    some of the fitted coefficients are NA, NaN or Inf.

 * Lest, Linhom, Ldot, Lcross, Ldot.inhom, Lcross.inhom  
    These summary functions now have an explicit argument 'correction'.  
    Behaviour is unchanged.

 * bugfixes  
    Arguments sinceversion="book" or sincedate="book"  
    are interpreted to give all bugs reported after publication  
    of the spatstat book.

 * cbind.hyperframe, rbind.hyperframe  
    The result now retains the row.names of the original arguments.

 * print.summary.owin  
    More information is printed.

 * append.psp  
    Arguments may be NULL.

 * as.psp  
    Now permits a data frame of marks to have only one column,  
    instead of coercing it to a vector.

### BUG FIXES

 1. as.linnet.psp  
     Sometimes produced a network with duplicated segments.  
     [Such objects can be repaired using 'repairNetwork'.]  
     Fixed.

 2. edge.Ripley, Kest, Kinhom  
     Isotropic correction weights for polygonal windows were sometimes incorrect  
     for small radius 'r' if the polygon contained many small segments  
     [spotted by Annie Mollie] or if the polygon was very long and thin  
     [spotted by Nestor Luambua]. Problem arose in spatstat 1.60-0.  
     Fixed.

 3. lppm  
     Did not correctly handle the case where the left-hand side of the formula  
     is the name of an entry in the 'data' argument.  
     Fixed.

 4. plot.lpp  
     Did not correctly handle the argument 'which.marks'.  
     Fixed.

 5. plot.im  
     Did not correctly handle the argument 'ribargs$at'.  
     Fixed.

 6. density.lpp  
     Sometimes requested a larger value of 'iterMax' but ignored it.  
     Fixed.

 7. [.linnet, [.lpp  
     Crashed if x contained inconsistent internal data  
     (when index 'j' was a window, and snip=TRUE).  
     Fixed.

 8. plot.linim   
     Crashed if the pixel values were complex numbers.  
     Fixed.

 9. plot.linfun  
     Crashed if the function values were complex numbers.  
     Fixed.

10. integral.linim, mean.linim  
     Crashed if the image had logical values.  
     Fixed.

11. Re, Im, Arg, Mod, Conj  
     For pixel images on a linear network (class 'linim')  
     these operations crashed if the pixel values were complex numbers.

12. studpermu.test  
     Crashed if the hyperframe was very large.  
     Fixed.

13. studpermu.test  
     Crashed in some cases when the simulated functions were  
     incompatible with each other, due to the use of different edge  
     corrections.  
     Fixed.

14. vcov.ppm, print.ppm, summary.ppm  
     Crashed in some cases if the fitted coefficients were NA.  
     Fixed.

15. quantess.owin, quantess.ppp, quantess.im  
     Crashed in some cases because the tile labels were not unique.  
     Fixed.

16. plot.pp3  
     Did not correctly handle graphical arguments ('col', 'pch', 'cex')  
     if they were vectors [Spotted by Abdollah Jalilian].  
     Fixed.

17. shift.linnet  
     Generated a spurious warning.  
     Fixed.

18. density.lpp, lixellate  
     Crashed in some cases when a data point was exactly at a vertex.  
     [Spotted by Jakob Gulddahl Rasmussen.]  
     Fixed.

19. plot.linim  
     Crashed (when style="width") if any pixel values were NaN.  
     Fixed.

20. Fest, Jest, Jdot, Jcross, Hest, Iest, rectcontact  
     envelope() commands using one of these summary functions  
     crashed sometimes with a message about illegal spacing of 'r' values.  
     Fixed.

21. plot.linnet, plot.psp  
     Ignored argument 'col' when style="width".  
     Fixed.

22. rshift.psp  
     Crashed if X had a data frame of marks.  
     [Spotted by Ute Hahn.]  
     Fixed.

23. Kscaled  
     Crashed if Ripley's isotropic edge correction was selected  
     but the translation edge correction was not.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.62-1.txt).
