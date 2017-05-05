---
title: spatstat help
layout: master
---

# spatstat help

## where to find help

There is a [Quick Reference Guide](resources/spatstatQuickref.pdf) for 
`spatstat` which summarises its capabilities and gives a comprehensive
list of `spatstat` commands. To view the Quick Reference guide
directly from `R`, load `spatstat` and type
`help(spatstat)`. Alternatively open [the full `spatstat` package
manual](resources/spatstatManual.pdf) in a browser, and navigate to
the first entry in the manual.

For information about a particular function in `spatstat`, either
follow the links in the Quick Reference guide, or type
`help(functionname)`. The keyword search function `help.search` can
be narrowed to the `spatstat` package:

```
help.search("systematic", package="spatstat")
```

will tell you the `spatstat` function to use for generating
``systematic'' random point patterns.

Users of `spatstat` are strongly urged to **read the online help files**
for the package. Substantial effort has gone into writing clear, detailed and
comprehensive explanations of important concepts. Indeed several of the
`spatstat` help files have been plagiarised in scientific publications.
The `spatstat` online help files also include very practical guidance, warnings, 
and explanations of common error messages.

The `spatstat` package is constantly evolving. Regular users of
`spatstat` can stay up-to-date by typing `latest.news` to read about
changes in the most recent version of `spatstat`, or
`news(package="spatstat")` to read about changes in all previous
versions. The package news is also available at the [news
page](news.html), where you can sign up for notifications about new
releases via RSS.

Several introductory ``vignettes'' are installed with `spatstat`. They
include a quickstart guide `Getting Started with Spatstat`, a document
about `Handling shapefiles` and a document summarising recent
updates. To see a list of *all* available vignettes, type (in the
`R` command line interface) `vignette()`; the list of `spatstat`
vignettes is given by `vignette(package="spatstat")`. To read a
vignette, type `vignette('name')` where `name` is the
name of the document without the file extension,
e.g. `vignette("getstart")`. Vignettes can also be accessed using the
graphical help interface invoked by `help.start()`.

Several demonstration scripts are also installed with `spatstat`.
Type

```
demo(package=spatstat)
```

for a list of all available demonstrations, or `demo(spatstat)` for a
general overview.

## Forums for questions

Questions about `spatstat` are often posted on the 
[stackexchange.com](http://stackexchange.com) forum
(with the `spatstat` tag). 
You may find that a similar question has already been 
answered: check the old questions and answers under the `spatstat`
tag on [stackoverflow.com](http://stackoverflow.com/questions/tagged/spatstat).

The email forum `R-sig-geo` sometimes handles questions about `spatstat`.
General questions about `R` which are not `spatstat`-specific (and not
specific to some other contributed package) can be addressed to the
`R-help` forum. Join these or other fora by visiting
[r-project.org](http://www.r-project.org).

You can also email the `spatstat` authors directly: load `spatstat` and
type `?spatstat` to see the authors' email addresses.

## Bugs in spatstat

If you have identified a bug or problem in `spatstat`, please
post a report to the bug reports page at
[github.com/spatstat/spatstat](https://github.com/spatstat/spatstat/issues).
You will need to *supply an example of the problem*, and the example
should be *reproducible*.

You can also email the `spatstat` authors directly: load `spatstat` and
type `?spatstat` to see the authors' email addresses.

