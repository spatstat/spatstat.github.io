---
title: spatstat 1.53-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.53-0

### 23 September 2017

   We thank Tilman Davies and Mehdi Moradi for contributions.

### OVERVIEW

 * Numerous bug fixes for linear networks code.

 * spatstat now requires the sub-package 'spatstat.data'  
    which contains the datasets.

 * Minor enhancements and bug fixes.

 * Nickname: "Tinfoil Hat"

### NEW FUNCTIONS

 * "[<-.linim"  
    Subset assignment method for pixel images on a linear network.

 * nnfromvertex  
    Given a point pattern on a linear network,  
    find the nearest data point from each vertex of the network.

 * tile.lengths  
    Calculate the length of each tile in a tessellation on a network.

 * text.ppp, text.lpp, text.psp  
    Methods for 'text' for spatial patterns.

### SIGNIFICANT USER-VISIBLE CHANGES

 * datasets  
    All datasets installed in 'spatstat' have now been moved  
    into the sub-package 'spatstat.data'. This should not have any effect  
    on normal use. The 'spatstat.data' package is automatically loaded  
    when spatstat is loaded, and the datasets are lazy-loaded so that  
    they are available in the usual way. To list all datasets you now need  
    to type 'data(package="spatstat.data")'

 * nbfires  
    This dataset now includes information about the different   
    land and sea borders of New Brunswick.

 * rhohat  
    New argument 'subset' allows computation for a subset of the data.

 * predict.lppm  
    Argument 'locations' can now be an 'lpp' object.

 * ewcdf  
    Argument 'weights' can now be NULL.

 * plot.msr  
    New arguments 'equal.markscale' and 'equal.ribbon'.

 * plot.im  
    The number of tick marks in the colour ribbon can now be controlled  
    using the argument 'nint' in 'ribargs'.

 * plot.symbolmap  
    New argument 'nsymbols' controls the number of symbols plotted.

 * square  
    Handles a common error in the format of the arguments.

 * [.linim  
    More robust against artefacts.

 * [.linnet  
    More robust against artefacts when the subset index is a pixel mask.

 * linim  
    The image Z is now automatically restricted to the network.  
    New argument 'restrict'.

 * plot.linim  
    When style="width", negative values are plotted in red (by default).  
    New argument 'negative.args' controls this.

 * plot.linim  
    New argument 'zlim' specifies the range of values to be mapped.

 * Summary.linim  
    Recognises the argument 'finite' so that range(x, finite=TRUE)  
    works for a linim object x.

 * identify.psp  
    Improved placement of labels.  
    Arguments can be passed to text.default to control the plotting of labels.

 * as.polygonal  
    Accelerated when w is a pixel mask.

 * density.lpp  
    Accelerated in the default case.

 * Kinhom  
    Stops gracefully if 'lambda' contains any zero values.

 * print.linim  
    Prints more information.

### BUG FIXES

 1. with.msr  
     The value of 'atommass' was incorrect, due to a coding error.  
     Fixed.

 2. [.linim  
     Internal data was sometimes corrupted.  
     Fixed.

 3. as.linim  
     The result had incorrect internal format when Window(X) was a mask  
     and one of the arguments 'eps', 'dimyx', 'xy' was present.  
     Fixed.

 4. as.im.im  
     If W was a rectangle or polygonal window, the pixel resolution of the   
     result was determined by the spatstat defaults, rather than being  
     determined by the image argument X. This was contrary to the  
     rule advertised in help(as.im).   
     Fixed.

 5. density.lpp  
     In the 'slow' case (kernel not Gaussian, or continuous=FALSE),  
     occasionally a pixel could incorrectly be assigned the value 1.  
     [Spotted by Mehdi Moradi.]  
     Fixed.

 6. "[.solist"  
     Ignored the "..." arguments in some cases.  
     Fixed.

 7. density.lpp  
     Ignored the resolution arguments 'eps', 'dimyx' in the default case.  
     Fixed.

 8. plot.msr  
     Plotted the panel titles on top of each other, if how="contour".  
     Fixed.

 9. contour.im  
     Plotted the title text at the wrong place when add=TRUE and show.all=TRUE.  
     Fixed.

10. predict.lppm  
     Crashed if 'locations' was an 'lpp' object.  
     Fixed.

11. plot.ppp  
     Crashed if the window had height 0 and width 0  
     and the pattern had several columns of marks.  
     Fixed.

12. plot.solist  
     Crashed if all panels had windows of height 0 and width 0.  
     Fixed.

13. linearK, linearKinhom, linearpcf, linearpcfinhom  
     Crashed if the linear network was disconnected and one component  
     of the network contained fewer than 2 points.  
     Fixed.

14. integral.linim  
     Crashed in some cases.  
     Fixed.

15. "[.linim"  
     Crashed in some cases.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.53-0.txt).
