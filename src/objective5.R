# Objective 5: Make two tables with the top 5 countries that have the most COVID-19 related confirmations and and deaths

library(readr)

# import data sets
confirmed <- data.frame(read_delim(file="time_series_covid19_confirmed_global.csv", delim=","))
deaths <- data.frame(read_delim(file="time_series_covid19_deaths_global.csv", delim=","))

# list of countries in the dataframe
countries <- unique(confirmed$Country.Region)

# create empty lists to store summed confirmed and deaths counts
summed_confirmed <- vector("numeric", length(countries))
summed_deaths <- vector("numeric", length(countries))

# sum confirmed and death counts for each country
for (i in 1:length(countries)) {
  country <- countries[i]
  summed_confirmed[i] <- sum(confirmed[confirmed$Country.Region == country, c(5:length(confirmed))])
  summed_deaths[i] <- sum(deaths[deaths$Country.Region == country, c(5:length(deaths))])
}

# create data frames with summed counts and countries
sum_confirmed_dataframe <- data.frame(Country = countries, Confirmed = summed_confirmed)
sum_deaths_dataframe <- data.frame(Country = countries, Deaths = summed_deaths)

# put countries in data frames in descending order based on counts
sum_confirmed_dataframe <- sum_confirmed_dataframe[order(-sum_confirmed_dataframe$Confirmed), ]
sum_deaths_dataframe <- sum_deaths_dataframe[order(-sum_deaths_dataframe$Deaths), ]

# use kable to convert data frames into tables
library(knitr)
confirmed_table <- kable(sum_confirmed_dataframe[1:5, ], caption = "Top 5 Countries with the Most COVID-19 Confirmations", col.names = c("Country", "Confirmed"))
deaths_table <- kable(sum_deaths_dataframe[1:5, ], caption = "Top 5 Countries with the Most COVID-19 Deaths", col.names = c("Country", "Deaths"))

# print tables
print(confirmed_table)
print(deaths_table)
