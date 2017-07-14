#This script was used to create the model that is included with the package

#packages.used=c("tm", "dplyr", "tidytext","jsonlite", "rJava","plyr","RCurl","XML","feedeR")

# check packages that need to be installed.
#packages.needed=setdiff(packages.used, 
#                        intersect(installed.packages()[,1], 
#                                  packages.used))
# install additional packages
#if(length(packages.needed)>0){
#  install.packages(packages.needed, dependencies = TRUE)
#}

# load packages
library("RCurl")
library('jsonlite')
library("dplyr")
library("plyr")
library("rJava")

trendyitunes = function(){ 
  iTunes = fromJSON("https://rss.itunes.apple.com/api/v1/us/tv-shows/top-tv-episodes/25/non-explicit/json")
  pool = data.frame(Name = iTunes$feed$results$artistName, 
                    Detail = paste("Episode:",iTunes$feed$results$name), 
                    category = iTunes$feed$results$primaryGenreName,
                    from = "iTunes")
  return(pool)
}
