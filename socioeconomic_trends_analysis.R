# Socioeconomic Trends Script
# Author: Joseph Leibson
# Date: 2025-01-15
# Description: This script analyzes socioeconomic trends using ACS data from 2019.
# It explores the relationship between education, income, and other demographic factors.

# Load required libraries
library(tidyverse)  # For data manipulation and visualization
library(tidycensus) # For fetching ACS data
library(ggplot2)    # For creating static visualizations
library(corrplot)   # For correlation matrix visualization
library(plotly)     # For interactive visualizations

# Set up tidycensus API key (replace with your own key)
# census_api_key("YOUR_API_KEY_HERE", install = TRUE)

# Fetch ACS data using tidycensus
# Variables selected: median income, total population, education level, median age, work hours, and management occupation
acs_data <- get_acs(
  geography = "county",
  variables = c(
    median_income = "B19013_001",
    total_population = "B15003_001",
    bachelor_or_higher = "B15003_022",
    median_age = "B01002_001",
    work_hours = "B23020_001",
    management_occupation = "C24010_003"
  ),
  year = 2019  # Specify the year of the ACS data
)

# Clean and prepare the data
cleaned_data <- acs_data %>%
  pivot_wider(names_from = variable, values_from = c(estimate, moe)) %>%
  mutate(
    pct_bachelor_or_higher = (estimate_bachelor_or_higher / estimate_total_population) * 100,
    county_state = paste(NAME, sep = ", "),
    age_group = cut(estimate_median_age, 
                    breaks = c(0, 35, 40, 45, 50, Inf),
                    labels = c("Under 35", "35-39", "40-44", "45-49", "50+"))
  ) %>%
  select(county_state, estimate_median_income, pct_bachelor_or_higher, 
         estimate_median_age, estimate_work_hours, estimate_management_occupation, age_group)

# Check for missing values in the dataset
if (any(is.na(cleaned_data))) {
  warning("Missing values detected in the dataset. Consider imputation or removal.")
}

# Check for outliers in key variables
summary(cleaned_data)

# Custom theme for consistent visualizations
custom_theme <- theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    strip.text = element_text(size = 12)
  )

# Initial education vs income plot
initial_plot <- ggplot(cleaned_data, aes(x = pct_bachelor_or_higher, y = estimate_median_income)) +
  geom_point(alpha = 0.5, color = "steelblue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    title = "Income vs Education",
    subtitle = "Median Household Income vs Percentage with Bachelor's Degree or Higher",
    x = "Percentage with Bachelor's Degree or Higher",
    y = "Median Household Income (USD)"
  ) +
  custom_theme

print(initial_plot)

# Multiple regression analysis
model <- lm(estimate_median_income ~ pct_bachelor_or_higher + estimate_median_age + 
              estimate_work_hours + estimate_management_occupation, data = cleaned_data)

# Create correlation matrix
cor_matrix <- cor(cleaned_data[, c("estimate_median_income", "pct_bachelor_or_higher", 
                                   "estimate_median_age", "estimate_work_hours", 
                                   "estimate_management_occupation")], use = "complete.obs")

# Create correlation plot
corrplot(cor_matrix, method = "color", type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)

# Faceted scatter plot
facet_plot <- ggplot(cleaned_data, aes(x = pct_bachelor_or_higher, y = estimate_median_income)) +
  geom_point(alpha = 0.5, color = "steelblue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  facet_wrap(~ age_group) +
  labs(
    title = "Income vs Education by Median Age Group",
    x = "Percentage with Bachelor's Degree or Higher",
    y = "Median Household Income (USD)"
  ) +
  custom_theme

print(facet_plot)

# Interactive plot with enhanced tooltips
interactive_plot <- ggplotly(
  facet_plot,
  tooltip = c("county_state", "pct_bachelor_or_higher", "estimate_median_income", "age_group")
)

# Print results
cat("Multiple Regression Results:\n")
print(summary(model))

cat("\nCorrelation Analysis:\n")
print(cor_matrix)

cat("\nVisualization Interpretation:\n")
cat("The faceted plot shows the relationship between education and income across different age groups.\n")
cat("The correlation heatmap displays the strength of relationships between all variables.\n")

# Create a directory for outputs
if (!dir.exists("output")) {
  dir.create("output")
}

# Save cleaned data
write.csv(cleaned_data, "output/expanded_education_income_analysis.csv", row.names = FALSE)

# Save plots
ggsave("output/faceted_plot.png", facet_plot, width = 12, height = 8)
htmlwidgets::saveWidget(interactive_plot, "output/interactive_plot.html")

# End of script