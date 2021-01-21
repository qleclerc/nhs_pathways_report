
## This function will fetch the latest url for the NHS 111 & 999 data

fetch_url_pathways_calls <- function() {
  
  #the url for the homepage where the latest data is stored
  base_url = "https://digital.nhs.uk/data-and-information/publications/statistical/mi-potential-covid-19-symptoms-reported-through-nhs-pathways-and-111-online/latest"
  
  #scrape all the urls on that homepage
  webpage = xml2::read_html(base_url)
  scraped_urls = webpage %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href")
  
  #search for our url (the filename always contains this string)
  query_url = "NHS%20Pathways%20Covid"
  url = grep(query_url, scraped_urls, value = T)
  
  query_url2 = "%202021"
  url2 = grep(query_url2, url, value = T)
  
  url2
}

fetch_url_pathways_online <- function() {
  
  #the url for the homepage where the latest data is stored
  base_url = "https://digital.nhs.uk/data-and-information/publications/statistical/mi-potential-covid-19-symptoms-reported-through-nhs-pathways-and-111-online/latest"
  
  #scrape all the urls on that homepage
  webpage = xml2::read_html(base_url)
  scraped_urls = webpage %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href")
  
  #search for our url (the filename always contains this string)
  query_url = "111%20Online%20Covid"
  url = grep(query_url, scraped_urls, value = T)
  
  query_url2 = "2021-"
  url2 = grep(query_url2, url, value = T)

  url2
}


