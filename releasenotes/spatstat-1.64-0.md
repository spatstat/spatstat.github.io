---
title: spatstat 1.64-0 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.64-0

### 27 April 2020

   We thank Robert Aue, Tilman Davies, Greg McSwiggan, Tyler Rudolph
   and Rasmus Plenge Waagepetersen for contributions.

### OVERVIEW

 * Interactive graphics functions have been removed to a separate package.

 * spatstat no longer needs the packages 'tcltk' and 'rpanel'.

 * The suggested package 'maptools' should be version 0.9-9 or later.

 * Important bug fix in density.ppp.

 * Add new vertices to a linear network.

 * Relative risk estimation on a network.

 * Leave-one-out density estimation on a network.

 * Improvements and extensions to linear networks code.

 * Improvements to 'nndist' methods.

 * Function lengths.psp has been renamed lengths_psp.

 * Bug fixes related to mppm.

 * Stability improvements.

 * Version nickname: 'Susana Distancia'

### NEW FUNCTIONS

 * relrisk.lpp  
    Method for 'relrisk' for point patterns on a linear network.

 * bw.relrisklpp  
    Bandwidth selection for relative risk on a network.

 * densityfun.lpp  
    Method for 'densityfun' for point patterns on a linear network.

 * addVertices  
    Add new vertices to a network, at locations outside the existing network.

 * lengths_psp  
    This is the new name of the function 'lengths.psp',  
    which had to be changed because of a conflict with the generic 'lengths'.

 * densityEqualSplit  
    The equal-split algorithm for kernel density estimation on a network  
    is now visible as a separate function.

 * densityHeat  
    The heat-equation algorithm for kernel density estimation on a network  
    is now visible as a separate function. It has also been extended  
    to computing leave-one-out density estimates at the data points.

 * hotrod  
    Compute the heat kernel kappa(u,v) on a one-dimensional line segment.

 * heatkernelapprox  
    Calculate an approximation to the value of the heat kernel  
    on a network evaluated at the source point, kappa(u,u).

### SIGNIFICANT USER-VISIBLE CHANGES

 * nndist.pp3, nndist.ppx, nndist.lpp  
    These functions now recognise the argument 'by'  
    allowing computation of the nearest distance to each group of points.

 * pairdist.lpp, crossdist.lpp  
    These functions can now handle large networks,  
    using the sparse representation.

 * density.lpp, densityQuick.lpp  
    Infinite bandwidth (sigma=Inf) is now permitted,  
    and results in a density estimate that is constant over all locations.

 * as.linnet.psp  
    The resulting network now has an attribute 'camefrom'  
    indicating the provenance of each line segment in the network.

 * as.linnet.linnet  
    New argument 'maxsize'.

 * repairNetwork  
    Increased capability of detecting and repairing inconsistencies.

 * joinVertices  
    New argument 'marks'.

 * insertVertices  
    Marks attached to the lines of the network are now retained.

 * as.lpp  
    Accepts more data formats.

 * iplot, iplot.ppp, iplot.layered, iplot.linnet, iplot.default  
    These interactive plotting functions have been removed from spatstat  
    into a new package 'spatstat.gui'

 * istat  
    This interactive analysis function has been removed from spatstat  
    into a new package 'spatstat.gui'

 * crossdist.lpp  
    New argument 'check'.

 * lengths.psp  
    This function will soon be Deprecated,  
    in favour of the new name 'lengths_psp'

 * density.lpp  
    Formal arguments changed. No effect on usage.

 * integral.linim  
    Now handles complex-valued functions.

 * transect.im  
    New argument 'nsample'.

 * bw.lppl  
    Accelerated when distance="path".

 * collapse.fv  
    Recognises the abbreviations used by fvnames()

### BUG FIXES

1. density.ppp  
     Edge correction factors were calculated incorrectly when the  
     window was not a rectangle, causing a negative bias in the  
     estimated intensity. [Spotted by Tilman Davies.]  
     Bug introduced in spatstat 1.57-0, october 2018.  
     Fixed.

2. mppm  
     Internal data were malformed if the interaction was Hardcore()  
     or MultiHard() or a hybrid involving these interactions.  
     This caused various errors when the fitted model was used.  
     Fixed.

3. mppm  
     Ignored the arguments 'nd' and 'eps' controlling the quadrature scheme.  
     Fixed.

4. "[.linnet", "[.lpp"  
     In X[W] where W is a window, if a vertex of the network  
     lay exactly on the boundary of W, an edge of length zero was created.  
     Fixed.

5. valid.ppm  
     Crashed sometimes when applied to the result of subfits().  
     Fixed.

6. as.im.densityfun  
     Crashed if argument W was missing.  
     Fixed.

7. as.linnet.linnet  
     This code could crash the R session, when sparse=FALSE, if there was  
     insufficient memory available to create the matrix of distances  
     between all pairs of network vertices.  
     Fixed.

8. Summary.linim  
     A spurious warning was generated when the operation any() or all()  
     was applied to a logical-valued image on a network.  
     Fixed.

9. "[<-.linim"  
     Crashed if the assignment would have replaced some existing NA values.  
     Fixed.

Release notes are available in raw text format [here](spatstat-1.64-0.txt).
