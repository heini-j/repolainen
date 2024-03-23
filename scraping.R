#scraping with a delay of x seconds, most basic hacking tactic
library(rvest)
library(tidyverse)

sys.sleep(5)

for (i in 1:10) {
  cat(i)}

#scraping yle frontpage

read_html("https://yle.fi/")

css.selector <- ".underlay-link"

read_html("https://yle.fi/") %>%
   html_elements(css=css.selector) %>%
   html_text()

#getting the links
read_html("https://yle.fi/") %>%
  html_elements(css="a") %>%
  html_text()

#getting the attributes
links <- read_html("https://yle.fi/") %>%
  html_elements(css="a") %>%
  html_attr(name="href")

#scraping each page 

links <- links[10:160]
links2 <- str_c("https://yle.fi", links)

links2[85]


#1. creating an empty container to place the results
articles <- vector(mode="list", length=length(links2))

#2. build the body for the loop

read_html(links2[85]) %>%
  html_elements(css=".yle__article__paragraph") %>%
  html_text()

#3. loop over the iterator i with random time intervals

length(links2)

for(i in 1:length(links2)){
  cat("iteration", i, "\n")
  articles[[i]] <- read_html(links2[i]) %>%
    html_elements(css=".yle__article__paragraph") %>%
    html_text()
  Sys.sleep(runif(n=1, min=0.2,max=0.4))
}

#conditional programming with if ..  else (if) statements
