#  This file contains a modified version of the function format.news_db in the
#  file src/library/utils/R/news.R
#  Part of the R package, http://www.R-project.org

custom.format.news_db <-
function(x, numbers = FALSE)
{
    if(inherits(x, "news_db_from_Rd") ||
       (!(is.null(bad <- attr(x, "bad")))
        && (length(bad) == NROW(x))
        && all(!bad))) {

        ## Format news in the preferred input format:
        ##   Changes in $VERSION [($DATE)]:
        ##   [$CATEGORY$]
        ##   indented/formatted bullet list of $TEXT entries.
        ## <FIXME>
        ## Add support for DATE.
        ## </FIXME>

        vchunks <- split(x, x$Version)
        ## Re-order according to decreasing version.
        ## R NEWS has invalid "versions" such as "R-devel" and
        ## "2.4.1 patched".  We can remap the latter (to e.g. 2.4.1.1)
        ## and need to ensure the former come first.
        vstrings <- names(vchunks)
        ind <- vstrings != "R-devel"
        pos <- c(which(!ind),
                 which(ind)[order(as.numeric_version(sub(" *patched", ".1",
                                                         vstrings[ind])),
                                  decreasing = TRUE)])
        vchunks <- vchunks[pos]
	if(length(vchunks)) {
            dates <- sapply(vchunks, function(v) v$Date[1L])
            vstrings <- names(vchunks)
            ind <- vstrings != "R-devel"
            vstrings[ind] <- sprintf("version %s", vstrings[ind])
            vheaders <-
                sprintf("Changes in %s%s:",
                        vstrings,
                        ifelse(is.na(dates), "",
                               sprintf(" (%s)", dates)))
        vheaders <- rep("", length(vheaders))
        } else vheaders <- character()

        
        format_items <- function(x)
            paste0(" * ", gsub("\n", "  \n ", x$Text))
        if(numbers){
            format_items <- function(x)
                paste0(format(1:length(x$Text)), ". ", gsub("\n", "  \n  ", x$Text))
        }            
        format_vchunk <- function(vchunk) {
            if(all(!is.na(category <- vchunk$Category)
                   & nzchar(category))) {
                ## need to preserve order of headings.
                cchunks <-
                    split(vchunk,
                          factor(category, levels = unique(category)))
                Map(c, names(cchunks), lapply(cchunks, format_items),
                    USE.NAMES = FALSE)
            } else {
                format_items(vchunk)
            }
        }

        Map(c, vheaders, lapply(vchunks, format_vchunk),
            USE.NAMES = FALSE)
    } else {
        ## Simple and ugly.
        ## Drop all-NA variables.
        apply(as.matrix(x),
              1L,
              function(e)
              paste(formatDL(e[!is.na(e)], style = "list"),
                    collapse = "\n"))
    }
}
