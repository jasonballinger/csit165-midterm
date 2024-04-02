# Objective 1: Determine where COVID-19 originated from

library(readr)

# Import data sets
cases <- data.frame(read_delim(file="time_series_covid19_confirmed_global.csv", delim=","))
deaths <- data.frame(read_delim(file="time_series_covid19_deaths_global.csv", delim=","))

# Highest confirmed cases & deaths for first day (1/22/2020)
highestCasesIndex <- which.max(cases$X1.22.20)
highestDeathsIndex <- which.max(cases$X1.22.20)

# Get location given the index
highestCasesLocation <- paste(cases$Province.State[highestCasesIndex], cases$Country.Region[highestCasesIndex])
highestDeathsLocation <- paste(deaths$Province.State[highestDeathsIndex], cases$Country.Region[highestDeathsIndex])

# Check if the locations are the same
if (highestCasesLocation == highestDeathsLocation) {
  print(paste("COVID-19 originated from:", highestCasesLocation))
} else {
  print("Unable to find COVID-19's origin location")
}