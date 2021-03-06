---
title: spatstat 1.56-1 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.56-1

### 27 July 2018

   We thank Agustin Lobo for contributions.

### OVERVIEW

 * Improvements to infrastructure.

 * Bug fixes.

 * Version nickname: "Invisible Friend"

### NEW FUNCTIONS

 * as.im.expression  
    New method for 'as.im' for expressions.

 * flipxy.tess  
    Method for 'flipxy' for tessellations.

### SIGNIFICANT USER-VISIBLE CHANGES

 * sdr  
    This is now a generic function, with a method for class 'ppp'.

 * pointsOnLines  
    The result now has an attribute named "map"  
    which maps each point to its parent line segment.

 * summary.lpp  
    Improved output.

 * intersect.owin  
    Argument 'fatal' now defaults to FALSE.

 * quadrature schemes (class "quad" and "logiquad")  
    Improved print and summary methods.

### BUG FIXES

 1. cut.lpp  
     Crashed if the marks were a data frame or hyperframe.  
     Fixed.

 2. summary.lpp, print.summary.lpp  
     Output was garbled if the marks were a data frame or hyperframe.  
     Fixed.

 3. integral.linim  
     Crashed if the function had NA values.  
     Fixed.

 4. Tstat  
     Crashed if ratio=TRUE.  
     Fixed.

 5. intersect.owin  
     Ignored argument 'fatal' in some cases.  
     [Spotted by Agustin Lobo.]  
     Fixed.

 6. plot.tess  
     Crashed if do.col=TRUE and 'values' was a factor.  
     Fixed.

 7. pcf.ppp  
     Crashed if 'domain' was given and ratio=TRUE.  
     Fixed.

 8. "[<-.sparse3Darray"  
     Crashed if 'value' was one-dimensional  
     and the indices i, j, k specified a two-dimensional subset of x.  
     Fixed.

 9. plot.quad  
     Crashed if tiles=TRUE for a quadrature scheme  
     created by quadscheme(method="dirichlet", exact=TRUE).  
     Fixed.

10. bugtable  
     Crashed if there were no bugs!  
     Fixed.

11. sparse array code  
     An array bounds violation (segmentation fault) could occur.  
     Fixed.

12. internal code  
     Numerous internal bugs have been fixed.

Release notes are available in raw text format [here](spatstat-1.56-1.txt).
