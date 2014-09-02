---
title: Frequently Asked Quetions about spatstat
layout: master
---

<h2>Spatstat FAQ (draft)</h2>

<ol>
<li>
<i>
What is <kbd>spatstat</kbd> ?
</i>
<blockquote>
<kbd>spatstat</kbd> is an <kbd>R</kbd> library for the statistical 
analysis of spatial data, mainly spatial point patterns.<p>
<kbd>spatstat</kbd> is one of the largest contributed packages
available for <kbd>R</kbd>.
It is the result of 15 years' development by leading researchers
in spatial statistics. 
There is detailed documentation, including introductory vignettes,
workshop notes, and an online manual.
<p>

<kbd>spatstat</kbd> contains about 1500 user-level functions
and 43 datasets. The online manual is over 1000 pages.
The source code includes over 60,000 lines of <kbd>R</kbd> code
and 20,000 lines of <kbd>C</kbd>. 
</blockquote>
<li>
<i>What kinds of data can <kbd>spatstat</kbd> handle?
</i>
<blockquote>
<ul>
<li>
<b>spatial point patterns</b> in two-dimensional space.
<blockquote>
This is the main historical focus of <kbd>spatstat</kbd>.
Very complicated datasets can be handled.
The point patterns may be `marked' by real numbers (e.g. trees annotated
with their diameters), categorical values (e.g. ants labelled by species),
logical values (e.g. on/off), etc.
The spatial region where the points are
observed can have a very complicated shape (an arbitrary polygon or a 
binary pixel image mask). 
Patterns of many thousands of points can be analysed.
</blockquote>
<li>
<b>spatial point patterns</b> in 3-dimensional or higher-dimensional space.
<blockquote>
The package supports point pattern datasets in any number of dimensions.
At present, it has a modest capability to analyse 3-dimensional point pattern
datasets. It supports multi-dimensional space-time point patterns in
any number of dimensions. Further capabilities are under development.
</blockquote>
<li>
<b>spatial regions</b> in two-dimensional space.
<blockquote>
A region of space (such as the survey region for a geological or ecological
survey) can be delimited by a polygon, or several polygons. Alternatively
it can be specified by a binary pixel image. 
</blockquote>
<li>
<b>pixel images</b> in two-dimensional space.
<li>
<b>spatial patterns of line segments</b> in two-dimensional space.
<blockquote>
A list of line segments of finite length inside a region
(for example, a map of geological faults in a survey region).
</blockquote>
<li>
<b>tessellations</b> in two-dimensional space. 
<blockquote>
A tessellation is a division of space into non-overlapping regions,
such as the states of the USA or the departements of France. 
Tessellations may be specified by polygonal boundaries or by pixel labels
in a pixel image.
</blockquote>
</ul>
Ultimately, <kbd>spatstat</kbd> will handle all the major kinds of
spatial data: point patterns, regional data, and geostatistical data. 
Currently, the vast majority of the functions deal with spatial point patterns.
(This is unlikely to change in the near future).
</blockquote>
<p>
<p>
<li>
<i>
What kind of analysis can <kbd>spatstat</kbd> perform?
</i>
<blockquote>
<kbd>spatstat</kbd> is designed to support a <b>complete statistical
analysis</b> of a spatial point pattern dataset. 
It contains functions for 
<ul>
<li>data handling 
<li>exploratory data analysis 
<li>model-fitting
<li> simulation
<li> spatial sampling
<li> model diagnostics
<li> formal inference
</ul>
</blockquote>
<li>
<i>
What kind of model-fitting does it do?
</i>
<blockquote>
Currently <kbd>spatstat</kbd> uses frequentist methods (maximum likelihood
and approximations to maximum likelihood) to fit a wide variety of 
point process models. It can fit Poisson point process models,
Gibbs point process models and random cluster process models
to a point pattern dataset.
The models can be spatially homogeneous, or inhomogeneous, 
with the spatial trend modelled as a function of the cartesian coordinates,
and/or a function of spatial covariates.
Gibbs models may include interpoint interaction (clustering or repulsion)
and dependence on marks.
<p>
Gibbs point process models are fitted by the method of maximum pseudolikelihood
or by the Ogata-Huang approximation to maximum likelihood.
The user interface is a function <kbd>ppm</kbd> similar to 
the <kbd>R</kbd> functions <kbd>lm</kbd> or <kbd>glm</kbd>, which uses
a formula to describe the spatial inhomogeneity and the dependence 
on covariates or marks. 
Fitted Gibbs models can be simulated automatically. 
<p>
Cluster process models 
can be fitted by the method of minimum contrast,
or by maximum composite likelihood. 
The user interface is a function <kbd>kppm</kbd>.
</blockquote>
<li>
<i>
I want to test whether the point pattern is random. Can <kbd>spatstat</kbd>
do that?
</i>
<blockquote>
Yes, and much more. <kbd>spatstat</kbd> 
provides facilities for formal inference (such as hypothesis tests)
and informal inference (such as residual plots).
<p>
If you want to formally test the hypothesis of Complete Spatial Randomness
you can do this using the chi-squared test based on quadrat counts
(<kbd>quadrat.test</kbd>), the Kolmogorov-Smirnov test based on values 
of a covariate (<kbd>kstest</kbd>), graphical Monte Carlo tests based on
simulation envelopes of the <i>K</i> function (<kbd>envelope</kbd>), 
non-graphical tests like the Diggle-Cressie-Loosmore-Ford test
(<kbd>dclf.test</kbd>) or the maximum absolute deviation test
(<kbd>mad.test</kbd>),
or the likelihood ratio test for parametric models (<kbd>anova.ppm</kbd>).  
<p>
If you want to formally test the goodness-of-fit of 
another point process model, you can again use 
the chi-squared test (for Poisson models only),
or graphical or non-graphical Monte Carlo tests
(for Poisson, Gibbs, Cox or cluster process models).
<p>
Informal validation of a point process model is equally important.
By inspecting various kinds of diagnostic plots, we can assess
whether the assumptions underlying our analysis appear to be valid.
Tools include the point process residual plots (<kbd>diagnose.ppm</kbd>),
nonparametric regression (<kbd>rhohat</kbd>),
partial residual plots (<kbd>parres</kbd>) and 
added variable plots (<kbd>addvar</kbd>).
</blockquote>
<li>
<i>
What are the connections and differences between <kbd>spatstat</kbd> and other 
packages?
</i>
<blockquote>
See the <a href="http://cran.r-project.org/web/views/Spatial.html">Spatial Task View</a> on CRAN for an overview of packages for analysing spatial data.
Some packages listed there are intended to provide basic 
data analysis capabilities, file conversion etc. 
<kbd>spatstat</kbd> is focused on higher-level <i>statistical</i> analysis
of spatial data. It is based on statistical principles, and follows
the standard practice and terminology of spatial statistics.
It is intended to contain tools for performing all the standard, classical
analyses of spatial point pattern data (such as the <i>K</i>-function)
as well as a wide selection of modern methods (e.g. residual diagnostics).
<kbd>spatstat</kbd> is not derived from, or dependent on, or superseded by,
any other package in spatial statistics. 
Several packages depend or suggest using <kbd>spatstat</kbd>; for the
current list, see the <kbd>Reverse Depends:</kbd> and
<kbd>Reverse Suggests:</kbd> lists on the 
<a href="http://cran.r-project.org/web/packages/spatstat/index.html">
CRAN page for <kbd>spatstat</kbd></a>
</blockquote>
<li>
<i>
What is the practical limit on the number of points in a point pattern?
</i>
<blockquote>
This depends on the memory available to R.
As a rough guide, if you are using a typical laptop with 2Gb of RAM, 
the following are feasible: <p>

<table>
<tr>
<td>Plotting a point pattern</td>
<td>.....</td>
<td>over 1 million points</td>
</tr>
<tr>
<td>Exploratory analysis (K function, etc)</td>
<td>.....</td>
<td>over 100,000 points</td>
</tr>
<tr>
<td>Model-fitting</td>
<td>.....</td>
<td>20,000 points (unmarked)</td>
</tr>
<tr>
<td>Complete analysis</td>
<td>.....</td>
<td>about 10,000 points</td>
</tr>
</table>
<p>

We are currently working on raising the practical limit on the number 
of points. 
Recent versions of <kbd>spatstat</kbd> (version <kbd>1.20-0</kbd> and later) 
can fit Gibbs point process models to patterns of 20,000 points.
We are currently working on datasets with 300,000 to 1 million points.
</blockquote>
<li>
<i>
I want to attach multiple marks to each point
e.g. each tree should be marked by its diameter and its species.
How to do this?
</i>
<blockquote>
This is possible in the latest version of <kbd>spatstat</kbd>
(version <kbd>1.18-0</kbd> and later).
However, at the moment, <kbd>spatstat</kbd> has limited capabilities
to <i>analyse</i> such data. See the 
<kbd>MarkedPointProcess</kbd> package for additional capabilities.
</blockquote>
<li>
<i>When I plot the estimated K-function of my data using the command
</i><kbd>plot(Kest(X))</kbd><i>, I don't understand the meaning of the different coloured curves.</i>
<blockquote>
The different curves are different estimates of the <b>K</b>-function 
(computed by different edge correction techniques) together with 
the theoretical <b>K</b>-function for a completely random pattern.
For more detailed information, read <a href="explainKplot.html">this explanation</a>
</blockquote>
<li>
<i>I can't seem to control the range of r values in plot(Kest(X)).
How can I control it?
How is the default plotting range determined?
</i>
<blockquote>
To control the range of r values, use the argument <kbd>xlim</kbd> 
as in <kbd>plot(Kest(X), xlim=c(0, 7))</kbd>. See <kbd>help(plot.fv)</kbd>.
<p>
The default range of r values that is plotted 
depends on the `default plotting range'
of the object (of class 'fv') returned by <kbd>Kest</kbd>. 
</blockquote>
<li>
<i>
How are the r values determined in Kest(X) ?
</i>
<p>
The default r values for Kest are computed as follows:
    <ol>
    <li>The maximum r value is computed by the function 'rmax.rule',
<kbd>
       rmax <- rmax.rule("K", W, lambda)
</kbd>
      where <kbd>W</kbd> is the window containing the data, and lambda is the
      average density of points per unit area. 
      Currently this rule takes the minimum of
	<ul>
	<li>
	Ripley's rule of thumb: rmax = one quarter of the 
	     smallest side of the enclosing rectangle
	<li>
	large sample rule: <kbd>rmax = sqrt(1000/(pi * lambda))</kbd>
 	</ul>
   <li>
    r values are equally spaced from 0 to rmax
      with step value 'eps'. If eps is not specified, then eps = rmax/512
      so that there are 513 values or 512 intervals.
   </ol>
    You can always override the 'r' values if you need to.
<p>
I should perhaps also point out that when you plot the K function,
the range of r values that is plotted depends on the `default plotting range'
of the object (of class 'fv') returned by Kest. To override this,
add the argument `xlim' to the plot command.
<p>
<li>
<i>
What determines the pixel dimensions (number of pixels) 
in an image object? 
How do I control the pixel dimensions when the image is
      (a) generated by density.ppp() or setcov()
      (b) created by converting other data using as.im()
      (c) returned by predict.ppm
</i>
<blockquote>
When spatstat is first loaded, the default pixel dimensions are 100 x 100
for all of the above commands except predict.ppm, which has a default
of 40 x 40.

You can reset the default pixel dimensions by the command
	spatstat.options(npixel=c(nx, ny))
where nx, ny are the number of pixels in the x and y directions
respectively. This does not apply to predict.ppm.

Each of the commands (a)-(c) has an argument 
that controls the pixel dimensions in that particular case.

      (a) for density(X) where X is a point pattern
	  	density(X, dimyx=c(ny, nx))

      (b) for as.im(f, W) where f is a number or function
          and W is a window
	        M <- as.mask(W, dimyx=c(ny,nx))
	        as.im(X, M)

      (c) for predict(obj) where obj is a fitted model (class "ppm")
	    predict(obj, ngrid=c(nx, ny))

The creation of new pixel grids is done by as.mask().
See help(as.mask) for explanation of the arguments 

		  dimyx = pixel dimensions = c(ny, nx)

		  xy = pixel grid coordinates = list(x, y)
</blockquote>
<li>
<i>I have several polygonal windows that represent adjoining regions
(e.g. counties with some common borders). How can I combine them
into a single window?
</i>
<blockquote>
First, convert each of the regions into a separate <kbd>owin</kbd> object. 
Then apply <kbd>union.owin</kbd> to combine them. 
For more information, see the 
<a href="http://cran.r-project.org/web/packages/spatstat/vignettes/shapefiles.pdf">
package vignette</a> on shapefiles.  
</blockquote>
</ol>
