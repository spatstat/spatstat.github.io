---
title: Frequently Asked Quetions about spatstat
layout: master
---

h2. Spatstat FAQ (draft)

<ol>
<li><p>_What is spatstat ?_</p>
<blockquote>

<p>spatstat is an R library for the statistical analysis of spatial data, mainly spatial point patterns.</p>
<p>spatstat is one of the largest contributed packages available for R. It is the result of 15 years' development by leading researchers in spatial statistics. There is detailed documentation, including introductory vignettes, workshop notes, and an online manual.</p>
<p>spatstat contains about 1500 user-level functions and 43 datasets. The online manual is over 1000 pages. The source code includes over 60,000 lines of R code and 20,000 lines of C.</p>
</blockquote>
</li>
<li><p>_What kinds of data can spatstat handle?_</p>
<blockquote>

<ul>
<li><p>*spatial point patterns* in two-dimensional space.</p>
<blockquote>

This is the main historical focus of spatstat. Very complicated datasets can be handled. The point patterns may be `marked' by real numbers (e.g. trees annotated with their diameters), categorical values (e.g. ants labelled by species), logical values (e.g. on/off), etc. The spatial region where the points are observed can have a very complicated shape (an arbitrary polygon or a binary pixel image mask). Patterns of many thousands of points can be analysed.
</blockquote>
</li>
<li><p>*spatial point patterns* in 3-dimensional or higher-dimensional space.</p>
<blockquote>

The package supports point pattern datasets in any number of dimensions. At present, it has a modest capability to analyse 3-dimensional point pattern datasets. It supports multi-dimensional space-time point patterns in any number of dimensions. Further capabilities are under development.
</blockquote>
</li>
<li><p>*spatial regions* in two-dimensional space.</p>
<blockquote>

A region of space (such as the survey region for a geological or ecological survey) can be delimited by a polygon, or several polygons. Alternatively it can be specified by a binary pixel image.
</blockquote>
</li>
<li>*pixel images* in two-dimensional space.</li>
<li><p>*spatial patterns of line segments* in two-dimensional space.</p>
<blockquote>

A list of line segments of finite length inside a region (for example, a map of geological faults in a survey region).
</blockquote>
</li>
<li><p>*tessellations* in two-dimensional space.</p>
<blockquote>

A tessellation is a division of space into non-overlapping regions, such as the states of the USA or the departements of France. Tessellations may be specified by polygonal boundaries or by pixel labels in a pixel image.
</blockquote>
</li>
</ul>

<p>Ultimately, spatstat will handle all the major kinds of spatial data: point patterns, regional data, and geostatistical data. Currently, the vast majority of the functions deal with spatial point patterns. (This is unlikely to change in the near future).</p>
</blockquote>

<p></p></li>
<li><p>_What kind of analysis can spatstat perform?_</p>
<blockquote>

<p>spatstat is designed to support a *complete statistical analysis* of a spatial point pattern dataset. It contains functions for</p>
<ul>
<li>data handling</li>
<li>exploratory data analysis</li>
<li>model-fitting</li>
<li>simulation</li>
<li>spatial sampling</li>
<li>model diagnostics</li>
<li>formal inference</li>
</ul>

</blockquote>
</li>
<li><p>_What kind of model-fitting does it do?_</p>
<blockquote>

<p>Currently spatstat uses frequentist methods (maximum likelihood and approximations to maximum likelihood) to fit a wide variety of point process models. It can fit Poisson point process models, Gibbs point process models and random cluster process models to a point pattern dataset. The models can be spatially homogeneous, or inhomogeneous, with the spatial trend modelled as a function of the cartesian coordinates, and/or a function of spatial covariates. Gibbs models may include interpoint interaction (clustering or repulsion) and dependence on marks.</p>
<p>Gibbs point process models are fitted by the method of maximum pseudolikelihood or by the Ogata-Huang approximation to maximum likelihood. The user interface is a function ppm similar to the R functions lm or glm, which uses a formula to describe the spatial inhomogeneity and the dependence on covariates or marks. Fitted Gibbs models can be simulated automatically.</p>
<p>Cluster process models can be fitted by the method of minimum contrast, or by maximum composite likelihood. The user interface is a function kppm.</p>
</blockquote>
</li>
<li><p>_I want to test whether the point pattern is random. Can spatstat do that?_</p>
<blockquote>

<p>Yes, and much more. spatstat provides facilities for formal inference (such as hypothesis tests) and informal inference (such as residual plots).</p>
<p>If you want to formally test the hypothesis of Complete Spatial Randomness you can do this using the chi-squared test based on quadrat counts (quadrat.test), the Kolmogorov-Smirnov test based on values of a covariate (kstest), graphical Monte Carlo tests based on simulation envelopes of the _K_ function (envelope), non-graphical tests like the Diggle-Cressie-Loosmore-Ford test (dclf.test) or the maximum absolute deviation test (mad.test), or the likelihood ratio test for parametric models (anova.ppm).</p>
<p>If you want to formally test the goodness-of-fit of another point process model, you can again use the chi-squared test (for Poisson models only), or graphical or non-graphical Monte Carlo tests (for Poisson, Gibbs, Cox or cluster process models).</p>
<p>Informal validation of a point process model is equally important. By inspecting various kinds of diagnostic plots, we can assess whether the assumptions underlying our analysis appear to be valid. Tools include the point process residual plots (diagnose.ppm), nonparametric regression (rhohat), partial residual plots (parres) and added variable plots (addvar).</p>
</blockquote>
</li>
<li><p>_What are the connections and differences between spatstat and other packages?_</p>
<blockquote>

See the "Spatial Task View":http://cran.r-project.org/web/views/Spatial.html on CRAN for an overview of packages for analysing spatial data. Some packages listed there are intended to provide basic data analysis capabilities, file conversion etc. spatstat is focused on higher-level _statistical_ analysis of spatial data. It is based on statistical principles, and follows the standard practice and terminology of spatial statistics. It is intended to contain tools for performing all the standard, classical analyses of spatial point pattern data (such as the _K_-function) as well as a wide selection of modern methods (e.g. residual diagnostics). spatstat is not derived from, or dependent on, or superseded by, any other package in spatial statistics. Several packages depend or suggest using spatstat; for the current list, see the Reverse Depends: and Reverse Suggests: lists on the "CRAN page for spatstat":http://cran.r-project.org/web/packages/spatstat/index.html
</blockquote>
</li>
<li><p>_What is the practical limit on the number of points in a point pattern?_</p>
<blockquote>

<p>This depends on the memory available to R. As a rough guide, if you are using a typical laptop with 2Gb of RAM, the following are feasible:</p>
<p></p>

|Plotting a point pattern|.....|over 1 million points|
|Exploratory analysis (K function, etc)|.....|over 100,000 points|
|Model-fitting|.....|20,000 points (unmarked)|
|Complete analysis|.....|about 10,000 points|


<p>We are currently working on raising the practical limit on the number of points. Recent versions of spatstat (version 1.20-0 and later) can fit Gibbs point process models to patterns of 20,000 points. We are currently working on datasets with 300,000 to 1 million points.</p>
</blockquote>
</li>
<li><p>_I want to attach multiple marks to each point e.g. each tree should be marked by its diameter and its species. How to do this?_</p>
<blockquote>

This is possible in the latest version of spatstat (version 1.18-0 and later). However, at the moment, spatstat has limited capabilities to _analyse_ such data. See the MarkedPointProcess package for additional capabilities.
</blockquote>
</li>
<li><p>_When I plot the estimated K-function of my data using the command_plot(Kest(X))_, I don't understand the meaning of the different coloured curves._</p>
<blockquote>

The different curves are different estimates of the *K*-function (computed by different edge correction techniques) together with the theoretical *K*-function for a completely random pattern. For more detailed information, read "this explanation":explainKplot.html
</blockquote>
</li>
<li><p>_I can't seem to control the range of r values in plot(Kest(X)). How can I control it? How is the default plotting range determined?_</p>
<blockquote>

To control the range of r values, use the argument xlim as in plot(Kest(X), xlim=c(0, 7)). See help(plot.fv).
The default range of r values that is plotted depends on the `default plotting range' of the object (of class 'fv') returned by Kest.
</blockquote>
</li>
<li><p>_How are the r values determined in Kest(X) ?_</p>
<p>The default r values for Kest are computed as follows:</p>
<ol>
<li>The maximum r value is computed by the function 'rmax.rule', rmax &lt;- rmax.rule(&quot;K&quot;, W, lambda) where W is the window containing the data, and lambda is the average density of points per unit area. Currently this rule takes the minimum of
<ul>
<li>Ripley's rule of thumb: rmax = one quarter of the smallest side of the enclosing rectangle</li>
<li>large sample rule: rmax = sqrt(1000/(pi &#42; lambda))</li>
</ul>
</li>
<li>r values are equally spaced from 0 to rmax with step value 'eps'. If eps is not specified, then eps = rmax/512 so that there are 513 values or 512 intervals.</li>
</ol>

<p>You can always override the 'r' values if you need to.</p>
<p>I should perhaps also point out that when you plot the K function, the range of r values that is plotted depends on the `default plotting range' of the object (of class 'fv') returned by Kest. To override this, add the argument `xlim' to the plot command.</p></li>
<li><p>_What determines the pixel dimensions (number of pixels) in an image object? How do I control the pixel dimensions when the image is (a) generated by density.ppp() or setcov() (b) created by converting other data using as.im() (c) returned by predict.ppm_</p>
<blockquote>

When spatstat is first loaded, the default pixel dimensions are 100 x 100 for all of the above commands except predict.ppm, which has a default of 40 x 40. You can reset the default pixel dimensions by the command spatstat.options(npixel=c(nx, ny)) where nx, ny are the number of pixels in the x and y directions respectively. This does not apply to predict.ppm. Each of the commands (a)-(c) has an argument that controls the pixel dimensions in that particular case. (a) for density(X) where X is a point pattern density(X, dimyx=c(ny, nx)) (b) for as.im(f, W) where f is a number or function and W is a window M &lt;- as.mask(W, dimyx=c(ny,nx)) as.im(X, M) (c) for predict(obj) where obj is a fitted model (class &quot;ppm&quot;) predict(obj, ngrid=c(nx, ny)) The creation of new pixel grids is done by as.mask(). See help(as.mask) for explanation of the arguments dimyx = pixel dimensions = c(ny, nx) xy = pixel grid coordinates = list(x, y)
</blockquote>
</li>
<li><p>_I have several polygonal windows that represent adjoining regions (e.g. counties with some common borders). How can I combine them into a single window?_</p>
<blockquote>

First, convert each of the regions into a separate owin object. Then apply union.owin to combine them. For more information, see the "package vignette":http://cran.r-project.org/web/packages/spatstat/vignettes/shapefiles.pdf on shapefiles.
</blockquote>
</li>
</ol>
