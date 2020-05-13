
## This function will fetch the latest url for the NHS online deaths data

fetch_url_online_deaths <- function() {
  
  #the url for the homepage where the latest data is stored
  base_url <- "https://www.england.nhs.uk/statistics/statistical-work-areas/covid-19-daily-deaths/"
  
  #scrape all the urls on that homepage
  webpage <- xml2::read_html(base_url)
  scraped_urls <- webpage %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href")
  
  #search for our url (the filename always contains this string)
  query_url <- "COVID-19-total-announced-deaths"
  url <- grep(query_url, scraped_urls, value = T)
  
  url
}

