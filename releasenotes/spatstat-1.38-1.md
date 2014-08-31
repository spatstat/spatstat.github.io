---
title: spatstat 1.38-1 RELEASE NOTES
layout: master
---

# RELEASE NOTES

## spatstat 1.38-1

### 27 August 2014

   We thank Ute Hahn and Xavier Raynaud for contributions.

### OVERVIEW

 * Urgent Bug Fixes.

 * Nickname: 'Le Hardi'

### NEW FUNCTIONS

 * "[<-.fv", "$<-.fv"  
   Subset replacement methods for 'fv' objects.

### SIGNIFICANT USER-VISIBLE CHANGES

 * clarkevans.test  
   Simulations are now performed with a fixed number of points.

 * plot.owin, plot.ppp, plot.psp, plot.im  
   The default size of the outer margin of white space has been  
   reduced. 

 * dclf.test  
   Improved information in printed output.

### BUG FIXES

1. update.ppm  
    Results were incorrect in several cases.  
    [Spotted by Xavier Raynaud.]  
    Bug introduced in spatstat 1.38-0.  
    Fixed.

2. Kinhom, Linhom  
    Calculations were incorrect if 'lambda' was a fitted point process model.  
    [Spotted by Xavier Raynaud.]  
    Bug introduced in spatstat 1.38-0.  
    Fixed.

3. envelope.envelope  
    Ignored the arguments 'global' and 'VARIANCE'.  
    Fixed.

4. fv objects  
    If 'f' was an object of class 'fv', then an assignment like f$name <- NULL  
    mangled the internal format of the object 'f', leading to errors  
    in print.fv and plot.fv.  
    [Spotted by Ute Hahn.]  
    Fixed.

5. split.ppp  
    split(X, A) where A is a rectangular tessellation,  
    produced errors if the window of 'A' did not include the window of 'X'.  
    [Spotted by Ute Hahn.]  
    Fixed.

6. names<-.hyperframe  
    Mangled the internal format.  
    [Spotted by Ute Hahn.]  
    Fixed.

7. plot.fv  
    y axis label was incorrect in some cases when the 'fv' object  
    had only a single column of function values.  
    [Spotted by Ute Hahn.]  
    Fixed.
