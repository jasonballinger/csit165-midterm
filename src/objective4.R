# Objective 4: Calculate risk scores for different areas

# Filter out areas with zero confirmations
cases_filtered <- cases[cases$X1.22.20 > 0, ]
deaths_filtered <- deaths[deaths$X1.22.20 > 0, ]

# Calculate risk scores
risk_scores <- 100 * deaths_filtered$X1.22.20 / cases_filtered$X1.22.20

# Add risk scores to the dataset
cases_filtered$risk_score <- risk_scores

# Sort areas by risk score and confirmations
sorted_areas <- cases_filtered[order(cases_filtered$risk_score, -cases_filtered$X1.22.20), ]

# Get the area with the lowest risk score and most confirmations
lowest_risk_area <- head(sorted_areas, 1)

# Get the area with the highest risk score and most confirmations
highest_risk_area <- tail(sorted_areas, 1)

# Calculate global risk score
global_risk_score <- 100 * sum(deaths_filtered$X1.22.20) / sum(cases_filtered$X1.22.20)

# Print the results using cat(paste())
cat(paste("Lowest risk score:", lowest_risk_area$risk_score))
cat("\n") # Newline for readability
cat(paste("Highest risk score:", highest_risk_area$risk_score))
cat("\n") # Newline for readability
cat(paste("Global risk score:", global_risk_score))