# Objective 2: Where is the most recent area to have a first confirmed case?

library(readr)

# Import data set
cases <- data.frame(read_delim(file="time_series_covid19_confirmed_global.csv", delim=","))

# Find the indices of the most recent first case
recentRow <- NA
recentCol <- NA

for (i in 1:nrow(cases)) {
  row <- cases[i, ] # Splice the row (state/country)
  for (j in 5:ncol(cases)) {
    # Check for first case
    if (cases[i, j] >= 1) {
      # Check if it has a more recent first case
      if (j > recentCol || is.na(recentCol)) { 
        recentRow <- i
        recentCol <- j
      }
      break
    }
  }
}

# return the state + country value for the highest index
print(paste("Region with the newest first case is:", cases[recentRow, 1], cases[recentRow, 2]))