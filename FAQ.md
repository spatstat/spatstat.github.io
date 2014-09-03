---
title: Frequently Asked Quetions about spatstat
layout: master
---

# Spatstat FAQ (draft)

1.  *What is `spatstat` ?*

    > `spatstat` is an `R` library for the statistical analysis of
    >spatial data, mainly spatial point patterns. 
    >
    > `spatstat` is one of the largest contributed packages available
    >for R. It is the result of 15 years' development by leading
    >researchers in spatial statistics. There is detailed
    >documentation, including introductory vignettes, workshop notes,
    >and an online manual.
    >
    > `spatstat` contains about 1500 user-level functions and 43
    >datasets. The online manual is over 1000 pages. The source code
    >includes over 60,000 lines of `R' code and 20,000 lines of `C`.

2.  *What kinds of data can `spatstat` handle?*

    > -   **spatial point patterns** in two-dimensional space.
    >
    >     > This is the main historical focus of `spatstat`. Very
    >complicated datasets can be handled. The point patterns may be
    >\`marked' by real numbers (e.g. trees annotated with their
    >diameters), categorical values (e.g. ants labelled by species),
    >logical values (e.g. on/off), etc. The spatial region where the
    >points are observed can have a very complicated shape (an
    >arbitrary polygon or a binary pixel image mask). Patterns of many
    >thousands of points can be analysed. 
    >
    > -   **spatial point patterns** in 3-dimensional or
    >higher-dimensional space.
    >
    >     > The package supports point pattern datasets in any number
    >of dimensions. At present, it has a modest capability to analyse
    >3-dimensional point pattern datasets. It supports
    >multi-dimensional space-time point patterns in any number of
    >dimensions. Further capabilities are under development.
    >
    > -   **spatial regions** in two-dimensional space.
    >
    >     > A region of space (such as the survey region for a
    >geological or ecological survey) can be delimited by a polygon,
    >or several polygons. Alternatively it can be specified by a
    >binary pixel image.
    >
    > -   **pixel images** in two-dimensional space.
    >
    > -   **spatial patterns of line segments** in two-dimensional
    >space.
    >
    >     > A list of line segments of finite length inside a region
    >(for example, a map of geological faults in a survey region).
    >
    > -   **tessellations** in two-dimensional space.
    >
    >     > A tessellation is a division of space into non-overlapping
    >regions, such as the states of the USA or the departements of
    >France. Tessellations may be specified by polygonal boundaries or
    >by pixel labels in a pixel image.
    >
    > Ultimately, `spatstat` will handle all the major kinds of
    >spatial data: point patterns, regional data, and geostatistical
    >data. Currently, the vast majority of the functions deal with
    >spatial point patterns. (This is unlikely to change in the near
    >future).

3.  *What kind of analysis can `spatstat` perform?*

    > `spatstat` is designed to support a **complete statistical
    >analysis** of a spatial point pattern dataset. It contains
    >functions for
    >
    > -   data handling
    > -   exploratory data analysis
    > -   model-fitting
    > -   simulation
    > -   spatial sampling
    > -   model diagnostics
    > -   formal inference

4.  *What kind of model-fitting does it do?*

    > Currently `spatstat` uses frequentist methods (maximum
    >likelihood and approximations to maximum likelihood) to fit a
    >wide variety of point process models. It can fit Poisson point
    >process models, Gibbs point process models and random cluster
    >process models to a point pattern dataset. The models can be
    >spatially homogeneous, or inhomogeneous, with the spatial trend
    >modelled as a function of the cartesian coordinates, and/or a
    >function of spatial covariates. Gibbs models may include
    >interpoint interaction (clustering or repulsion) and dependence
    >on marks.
    >
    > Gibbs point process models are fitted by the method of maximum
    >pseudolikelihood or by the Ogata-Huang approximation to maximum
    >likelihood. The user interface is a function `ppm` similar to the
    >`R` functions `lm` or `glm`, which uses a formula to describe the
    >spatial inhomogeneity and the dependence on covariates or
    >marks. Fitted Gibbs models can be simulated automatically.
    >
    > Cluster process models can be fitted by the method of minimum
    >contrast, or by maximum composite likelihood. The user interface
    >is a function `kppm`.

5.  *I want to test whether the point pattern is random. Can
`spatstat` do that?*

    > Yes, and much more. `spatstat` provides facilities for formal
    >inference (such as hypothesis tests) and informal inference (such
    >as residual plots).
    >
    > If you want to formally test the hypothesis of Complete Spatial
    >Randomness you can do this using the chi-squared test based on
    >quadrat counts (`quadrat.test`), the Kolmogorov-Smirnov test based
    >on values of a covariate (`kstest`), graphical Monte Carlo tests
    >based on simulation envelopes of the *K* function (`envelope`),
    >non-graphical tests like the Diggle-Cressie-Loosmore-Ford test
    >(`dclf.test`) or the maximum absolute deviation test
    >(`mad.test`), or the likelihood ratio test for parametric models
    >(`anova.ppm`).
    >
    > If you want to formally test the goodness-of-fit of another
    >point process model, you can again use the chi-squared test (for
    >Poisson models only), or graphical or non-graphical Monte Carlo
    >tests (for Poisson, Gibbs, Cox or cluster process models).
    >
    > Informal validation of a point process model is equally
    >important. By inspecting various kinds of diagnostic plots, we
    >can assess whether the assumptions underlying our analysis appear
    >to be valid. Tools include the point process residual plots
    >(`diagnose.ppm`), nonparametric regression (`rhohat`), partial
    >residual plots (`parres`) and added variable plots (`addvar`).

6.  *What are the connections and differences between `spatstat` and
other packages?*

    > See the [Spatial Task View][1] on CRAN for an overview of
      packages for analysing spatial data. Some packages listed there
      are intended to provide basic data analysis capabilities, file
      conversion etc. `spatstat` is focused on higher-level
      *statistical* analysis of spatial data. It is based on
      statistical principles, and follows the standard practice and
      terminology of spatial statistics. It is intended to contain
      tools for performing all the standard, classical analyses of
      spatial point pattern data (such as the *K*-function) as well as
      a wide selection of modern methods (e.g. residual
      diagnostics). `spatstat` is not derived from, or dependent on,
      or superseded by, any other package in spatial
      statistics. Several packages depend or suggest using `spatstat`;
      for the current list, see the Reverse Depends: and Reverse
      Suggests: lists on the [CRAN page for `spatstat`][2]

7.  *What is the practical limit on the number of points in a point
pattern?*

    > This depends on the memory available to R. As a rough guide, if
    >you are using a typical laptop with 2Gb of RAM, the following are
    >feasible:
    >
    > ||
    > |Plotting a point pattern|.....|over 1 million points|
    > |Exploratory analysis (K function, etc)|.....|over 100,000 points|
    > |Model-fitting|.....|20,000 points (unmarked)|
    > |Complete analysis|.....|about 10,000 points|
    >
    > We are currently working on raising the practical limit on the
    >number of points. Recent versions of `spatstat` (version 1.20-0
    >and later) can fit Gibbs point process models to patterns of
    >20,000 points. We are currently working on datasets with 300,000
    >to 1 million points.

8.  *I want to attach multiple marks to each point e.g. each tree
should be marked by its diameter and its species. How to do this?*

    > This is possible in the latest version of `spatstat` (version
      1.18-0 and later). However, at the moment, `spatstat` has
      limited capabilities to *analyse* such data. See the
      `MarkedPointProcess` package for additional capabilities.

9.  *When I plot the estimated K-function of my data using the
command *`plot(Kest(X))`*, I don't understand the meaning of the
different coloured curves.*

    > The different curves are different estimates of the
      **K**-function (computed by different edge correction
      techniques) together with the theoretical **K**-function for a
      completely random pattern. For more detailed information, read
      [this explanation](explainKplot.html)

10. *I can't seem to control the range of r values in
`plot(Kest(X))`. How can I control it? How is the default plotting
range determined?*

    > To control the range of r values, use the argument `xlim` as in
    > `plot(Kest(X), xlim=c(0, 7))`. See `help(plot.fv)`. The default
    > range of r values that is plotted depends on the \`default
    > plotting range' of the object (of class "fv") returned by `Kest`.

11. *How are the r values determined in Kest(X) ?*

    > The default r values for Kest are computed as follows:
    >
    > 1.  The maximum r value is computed by the function 'rmax.rule',
    > `rmax \<- rmax.rule("K", W, lambda)` where `W` is the window
    > containing the data, and `lambda` is the average density of points
    > per unit area. Currently this rule takes the minimum of
    >    -   Ripley's rule of thumb: rmax = one quarter of the smallest
    > side of the enclosing rectangle
    >     -   large sample rule: `rmax = sqrt(1000/(pi \* lambda))`
    >
    > 2.  r values are equally spaced from 0 to rmax with step value
    > '`eps`'. If `eps` is not specified, then `eps = rmax/512` so that
    > there are 513 values or 512 intervals.
    >
    > You can always override the 'r' values if you need to.
    >
    > We should perhaps also point out that when you plot the K
    > function, the range of r values that is plotted depends on the
    > \`default plotting range' of the object (of class 'fv') returned
    > by `Kest`. To override this, add the argument `xlim` to the plot
    > command.

12. *What determines the pixel dimensions (number of pixels) in an
image object? How do I control the pixel dimensions when the image is
(a) generated by density.ppp() or setcov() (b) created by converting
other data using as.im() (c) returned by predict.ppm*

    > When `spatstat` is first loaded, the default pixel dimensions
      are 100 x 100 for all of the above commands except predict.ppm,
      which has a default of 40 x 40. You can reset the default pixel
      dimensions by the command spatstat.options(npixel=c(nx, ny))
      where nx, ny are the number of pixels in the x and y directions
      respectively. This does not apply to predict.ppm. Each of the
      commands (a)-(c) has an argument that controls the pixel
      dimensions in that particular case. (a) for density(X) where X
      is a point pattern density(X, dimyx=c(ny, nx)) (b) for as.im(f,
      W) where f is a number or function and W is a window M \<-
      as.mask(W, dimyx=c(ny,nx)) as.im(X, M) (c) for predict(obj)
      where obj is a fitted model (class "ppm") predict(obj,
      ngrid=c(nx, ny)) The creation of new pixel grids is done by
      as.mask(). See help(as.mask) for explanation of the arguments
      dimyx = pixel dimensions = c(ny, nx) xy = pixel grid coordinates
      = list(x, y)

13. *I have several polygonal windows that represent adjoining regions
(e.g. counties with some common borders). How can I combine them into
a single window?*

    > First, convert each of the regions into a separate `owin`
      object. Then apply `union.owin` to combine them. For more
      information, see the [package vignette][3] on shapefiles.


[1]: http://cran.r-project.org/web/views/Spatial.html
[2]: http://cran.r-project.org/web/packages/spatstat/index.html
[3]: http://cran.r-project.org/web/packages/spatstat/vignettes/shapefiles.pdf
