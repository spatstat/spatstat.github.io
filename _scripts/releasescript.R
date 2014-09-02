### This scripts exects to find the spatstat DESCRIPTION file in ../spatstat/
### It generates a blog post about the release in the _posts directory.

## ## Date from commandline
## args <- commandArgs(trailingOnly = TRUE)
## if(length(args)==0){
##     args <- as.character(Sys.Date())
## }
## DATE <- args[1]

# Use main dir as working directory
setwd("..")

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
extratxt <- paste0('\nRelease notes are available in raw text format <a href="',
              substr(txtfile, 14, nchar(txtfile)),
              '">here</a>.')
writeLines(extratxt, con = con)
close(con)

# Make txt version without layout header:
x <- readLines(paste0("releasenotes/spatstat-", VERSION, ".md"))
con <- file(txtfile, "a")
writeLines(x[-(1:5)], con = con)
close(con)

print("Success!")
