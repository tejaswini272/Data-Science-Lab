install.packages("rvest")
install.packages("dplyr")
library(rvest)
library(dplyr)

google<-read_html("https://www.imdb.com/chart/top/?sort=nv,desc&mode=simple&page=1")
titel = google %>% html_nodes(" .titleColumn a ") %>% html_text()
stars = google %>% html_nodes("strong  ") %>% html_text()
Reviews_data = data.frame(titel,stars, stringsAsFactors = FALSE)
write.csv(Reviews_data, "Reviews_data.csv")

View(Reviews_data)