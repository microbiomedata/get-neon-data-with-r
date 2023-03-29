library("stringr")
x <- c("why", "video", "cross", "extra", "deal", "authority")
str_replace(x, "[aeiou]", "?")
