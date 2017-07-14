# function to grab trendy itunes shows
trendyitunes = function(){ 
  iTunes = fromJSON("https://rss.itunes.apple.com/api/v1/us/tv-shows/top-tv-episodes/25/non-explicit/json")
  pool = data.frame(Name = iTunes$feed$results$artistName, 
                    Detail = paste("Episode:",iTunes$feed$results$name), 
                    category = iTunes$feed$results$primaryGenreName,
                    from = "iTunes")
  return(pool)
}
