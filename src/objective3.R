# Objective 3: How far away are the areas from objective 2 from where the first confirmed case(s) occurred?

library(geosphere)

# Coordinates of the most recent area to have a first confirmed case
recent_coords <- c(cases[recentRow, "Long"], cases[recentRow, "Lat"])

# Coordinates of the area with the highest number of confirmations and deaths on the first recorded day
origin_coords <- c(cases[highestCasesIndex, "Long"], cases[highestCasesIndex, "Lat"])

# Calculate distance in meters
distance_meters <- distm(origin_coords, recent_coords, fun = distVincentyEllipsoid)

# Convert meters to miles (1 meter = 0.000621371 miles)
distance_miles <- distance_meters * 0.000621371

# Print the result
cat(paste("The region with the newest first case, ", cases[recentRow, "Province.State"], ", ", cases[recentRow, "Country.Region"],
          ", is approximately ", round(distance_miles, 2), " miles away from ", highestCasesLocation, ".", sep = ""))