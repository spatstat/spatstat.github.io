### This scripts expects to find the spatstat DESCRIPTION and NEWS
### file in ../../spatstat/
### The script:
### - generates a blog post about the release in the _posts directory
### - updates info about manual etc. in ../resources.md
### - generates a txt and markdown file with full release notes in ../releasenotes
### - generates a list of full release notes in ../releasenotes/index.md


## ## Date from commandline
## args <- commandArgs(trailingOnly = TRUE)
## if(length(args)==0){
##     args <- as.character(Sys.Date())
## }
## DATE <- args[1]

# Use main dir as working directory
setwd("..")

# Generate newest quickref:
out <- "resources/spatstatQuickref.pdf"
file.remove(out)
cmd <- paste("R CMD Rd2pdf --title='Spatstat Quick Reference guide' --no-preview -o",
             out, "../spatstat/man/spatstat-package.Rd")
system(cmd, wait = FALSE, ignore.stdout = TRUE)

# Generate newest manual (and get length and size):
out <- "resources/spatstatManual.pdf"
file.remove(out)
cmd <- paste("R CMD Rd2pdf --no-preview -o", out,
             "../spatstat")
system(cmd, wait = TRUE, ignore.stdout = TRUE)
PAGES <- system(paste("pdfinfo", out, "| grep Pages | sed 's/[^0-9]*//'"), intern = TRUE)
SIZE <- system(paste("du -h", out), intern = TRUE)
SIZE <- paste0(strsplit(SIZE, "\t")[[1]][1], "b")

# Find version, date and nickname and write it in the template file
VERSION <- packageDescription("spatstat", "..", fields = "Version")
NICKNAME <- packageDescription("spatstat", "..", fields = "Nickname")
DATE <- packageDescription("spatstat", "..", fields = "Date")
filename <- paste0(DATE, "-spatstat-", VERSION, "-released.md")
filename <- file.path("_posts", filename)
if(!file.copy("_scripts/releasepost.txt", filename))
    stop("Couldn't create new post. Maybe filename already exists?")
system(paste0("sed -i 's/VERSION/", VERSION, "/g' ", filename))
system(paste0("sed -i 's/NICKNAME/", NICKNAME, "/g' ", filename))

# News (without thanks)
newsdb <- news(package="spatstat", lib.loc="..")

# OVERVIEW (stripped of extra white space and \n) and THANKS
OVERVIEW <- news(Version == VERSION & Category == "OVERVIEW", db = newsdb)
THANKS <- grep("[Tt]hank", OVERVIEW$Text, value = TRUE)
OVERVIEW <- grep("[Nn]ickname|[Tt]hank", OVERVIEW$Text, invert = TRUE, value = TRUE)
OVERVIEW <- gsub("[[:space:]]+", " ", OVERVIEW)

# Write overview to release post
cat(paste("*", OVERVIEW), file = filename, sep = "\n", append = TRUE)


##### Full release notes below: #####

source("_scripts/custom.format.news_db.R")
filename <- paste0("releasenotes/spatstat-", VERSION, ".md")

# Layout header:
cat("---",
    paste("title: spatstat", VERSION, "RELEASE NOTES"),
    "layout: master",
    "---\n",
    sep = "\n",
    file = filename
    )

# Headline, date, etc.
cat("# RELEASE NOTES",
    paste("## spatstat", VERSION),
    paste0("### ", format(as.Date(DATE), format = "%d %B %Y"), "\n"),
    sep = "\n\n",
    file = filename,
    append = TRUE
    )

# Thanks
THANKS <- strsplit(THANKS, "\n", fixed = TRUE)[[1]]
THANKS <- gsub("[[:space:]]+", " ", THANKS)
THANKS <- gsub("^[[:space:]]+|[[:space:]]+$", "", THANKS)
cat(paste("  ", THANKS),
    file = filename,
    sep = "\n",
    append = TRUE
    )

# Full news (without thanks and bugs)
NEWS <- news(Version == VERSION & !grepl("Thank", Text, ignore.case = TRUE) &
             !grepl("BUG", Category, ignore.case = TRUE), db = newsdb)
notes <- paste(unlist(custom.format.news_db(NEWS)), collapse = "\n\n")
notes <- sub("\nOVERVIEW", "OVERVIEW", notes, fixed = TRUE)
for(x in unique(NEWS$Category)){
    notes <- gsub(x, paste("###", x), notes)
}
con <- file(filename, "a")
writeLines(notes, con = con)

# Add bugs (enumerated)
BUGS <- news(Version == VERSION & grepl("BUG", Category, ignore.case = TRUE), db = newsdb)
buglist <- paste(unlist(custom.format.news_db(BUGS, TRUE)), collapse = "\n\n")
buglist <- sub("\nBUG", "### BUG", buglist, fixed = TRUE)
writeLines(buglist, con = con)

# Add link to raw txt version
txtfile <- sub(".md", ".txt", filename, fixed = TRUE)
extratxt <- paste0("\nRelease notes are available in raw text format [here](",
              substr(txtfile, 14, nchar(txtfile)),
              ").")
writeLines(extratxt, con = con)
close(con)

# Make txt version without layout header:
x <- readLines(paste0("releasenotes/spatstat-", VERSION, ".md"))
n <- length(x)
con <- file(txtfile, "a")
writeLines(x[-c(1:5, n-1, n)], con = con)
close(con)

print("Success!")


### Make list of release notes
indexfile <- "releasenotes/index.md"
if(!file.copy("_scripts/releaseindex.txt", indexfile, overwrite = TRUE))
    stop("Couldn't create new release note index!")
releases <- list.files("releasenotes/", "spatstat.*.md")
releases <- sub(".md", "", releases, fixed = TRUE)
releases <- paste0("[", releases, "](", releases, ".html)\n")
cat(rev(releases), file = indexfile, sep = "\n", append = TRUE)


### Update resources page with manual length and size:
resourcefile <- "resources.md"
if(!file.copy("_scripts/resources.txt", resourcefile, overwrite = TRUE))
    stop("Couldn't create new release note index!")
system(paste0("sed -i 's/PAGES/", PAGES, "/g' ", resourcefile))
system(paste0("sed -i 's/SIZE/", SIZE, "/g' ", resourcefile))
