### This scripts exects to find the spatstat DESCRIPTION file in ../spatstat/
### It generates a blog post about the release in the _posts directory.

## ## Date from commandline
## args <- commandArgs(trailingOnly = TRUE)
## if(length(args)==0){
##     args <- as.character(Sys.Date())
## }
## DATE <- args[1]

# Find version, date and nickname and write it in the template file
VERSION <- packageDescription("spatstat", "..", fields = "Version")
NICKNAME <- packageDescription("spatstat", "..", fields = "Nickname")
DATE <- packageDescription("spatstat", "..", fields = "DATE")
filename <- paste0(DATE, "-spatstat-", VERSION, "-released.md")
filename <- file.path("_posts", filename)
if(!file.copy("templates/releasepost.txt", filename))
    stop("Couldn't create new post - filename already exists!")
system(paste0("sed -i 's/VERSION/", VERSION, "/g' ", filename))
system(paste0("sed -i 's/NICKNAME/", NICKNAME, "/g' ", filename))

# News (without thanks)
newsdb <- news(package="spatstat", lib.loc="..")
# NEWS <- news(Version == VERSION & !grepl("Thank", Text, ignore.case = TRUE), db = newsdb)

# OVERVIEW (stripped of extra white space and \n) and THANKS
OVERVIEW <- news(Version == VERSION & Category == "OVERVIEW", db = newsdb)
THANKS <- grep("[Tt]hank", OVERVIEW$Text, value = TRUE)
OVERVIEW <- grep("ickname|thank", OVERVIEW$Text, invert = TRUE, value = TRUE)
OVERVIEW <- gsub("[[:space:]]+", " ", OVERVIEW)

# Write overview to release post
cat(paste("*", OVERVIEW), file = filename, sep = "\n", append = TRUE)
