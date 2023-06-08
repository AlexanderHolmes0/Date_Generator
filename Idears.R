library(netstat)
#install.packages('netstat')
library(rvest)
#install.packages('rvest')
library(tidyverse)

link <- 'https://confessionsofparenting.com/date-ideas/'

ideas <- read_html(link)

ideas <- ideas %>% 
  html_elements("#main li") %>% 
  html_text2()

ideas <- ideas[-(1:11)]

write.csv(ideas,file="Ideas.csv",row.names = FALSE, col.names = FALSE)
