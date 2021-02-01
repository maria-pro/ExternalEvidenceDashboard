install.packages("httr")
install.packages("jsonlite")
install.packages("openssl")


library(httr)
library(jsonlite)
library(openssl)

# whatever name you assigned to your created app
appname <- "MariaP"

## api key (example below is not a real key)
key <- "W6G8J2SOcOpoLnidoCeM4XIIH"

## api secret (example below is not a real key)
secret <- "MHdYH2ui7cQlsXoDVk65H6gnWyqolDuyaukfJIm4Vh8Su9rnoS"

# create token named "twitter_token"

app_keys <- openssl::base64_encode(paste0(key, ":", secret))

r <- httr::POST("https://api.twitter.com/oauth2/token",
                httr::add_headers(Authorization = paste0("Basic ", app_keys)),
                body = list(grant_type = "client_credentials"))
bearer <- httr::content(r, encoding = "UTF-8")

url<-"https://api.twitter.com/1.1/search/tweets.json?q=rstats&src=typed_query"


res=GET(url, add_headers(
  Authorization=paste0("Bearer ", bearer$access_token))
)


        