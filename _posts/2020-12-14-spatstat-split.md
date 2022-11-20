---
layout: post
title: spatstat has been split into a family of packages
---

The original spatstat package grew so large 
that CRAN required us to split it into several smaller packages.

In 2017 we created the sub-packages

* spatstat.utils (containing basic utility functions)
* spatstat.data (containing the datasets)

On 14 December 2020, we divided the remaining code into

* spatstat.geom (containing geometrical objects, geometrical operations,
distance measurement)
* spatstat.core (containing the main functionality for statistical analysis
and modelling)
* spatstat.linnet (containing functionality for linear networks)
* spatstat (umbrella package containing documentation)


