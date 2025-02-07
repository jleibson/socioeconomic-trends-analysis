# Socioeconomic Trends Analysis

## Overview
This project analyzes socioeconomic trends using American Community Survey (ACS) data from 2019. It explores the relationships between education, income, age, and other demographic factors across U.S. counties, providing insights into the complex interplay of these variables.

## Features
- Data retrieval from ACS using tidycensus
- Data cleaning and preparation
- Multiple regression analysis
- Correlation analysis
- Static and interactive visualizations

## Requirements
- R (version 4.0 or higher)
- Required R packages:
  - tidyverse
  - tidycensus
  - ggplot2
  - corrplot
  - plotly

## Code Structure
- data_retrieval.R: Functions to fetch and clean ACS data
- analysis.R: Core analysis functions including regression and correlation
- visualization.R: Code for generating static and interactive plots
- main.R: Orchestrates the entire analysis workflow

## Installation
- Clone this repository: 'git clone https://github.com/jleibson/socioeconomic-trends-analysis.git'
- Navigate to the project directory: 'cd socioeconomic-trends-analysis'
- Install required R packages: 'install.packages(c("tidyverse", "tidycensus", "ggplot2", "corrplot", "plotly"))'
- Set up your Census API key:
    - Get a key at https://api.census.gov/data/key_signup.html
    - In R, run: 'Sys.setenv(CENSUS_API_KEY="YOUR_API_KEY_HERE")'

## Usage
1. Open `socioeconomic_trends_analysis.R` in RStudio
2. Run the script to perform the analysis and generate visualizations

## Output
- CSV file with cleaned and analyzed data
- PNG file with faceted plot of income vs. education by age group
- HTML file with interactive plot

## Challenges and Limitations
- ACS data is based on estimates and has margins of error
- Analysis is limited to 2019 data; longitudinal trends are not captured
- Some rural counties have limited data availability

## Key Variables
- median_income: Median household income in the past 12 months
- education_level: Percentage of population with a bachelor's degree or higher
- median_age: Median age of the population
- management_occ: Percentage of civilian employed population in management occupations
- mean_work_hours: Mean usual hours worked for workers 16 to 64 years

## Key Findings
- Strong positive correlation (0.65) between education level and median income
- Age has a slight negative correlation (-0.12) with income
- Work hours and management occupations positively correlate with income (0.17 and 0.33 respectively)
- The relationship between education and income varies across age groups, as visualized in the faceted plot

## Results and Evaluation
Our analysis revealed a strong positive correlation (r = 0.65) between education level and median income. Here's a sample visualization of this relationship:


<img width="400" alt="Screen Shot 2025-02-07 at 2 46 00 PM" src="https://github.com/user-attachments/assets/21a99789-0448-46d8-a994-24b6b6355448" />


## Significance and Conclusion
This analysis provides valuable insights into the socioeconomic landscape of U.S. counties. By examining the relationships between education, income, age, and occupation, we can better understand the factors that contribute to economic well-being. The visualizations and statistical analyses offer a nuanced view of how these variables interact, which can be crucial for:

1. Policy makers in developing targeted educational and economic policies
2. Researchers studying social mobility and economic disparities
3. Businesses making decisions about workforce development and location strategies

The project demonstrates the power of data-driven approaches in uncovering complex socioeconomic patterns. The interactive visualizations, in particular, allow for a more engaging exploration of these relationships, making the insights accessible to a wider audience.

## Future Work
- Incorporate time series analysis to track trends over multiple years
- Add more demographic variables for a more comprehensive analysis
- Develop a Shiny app for interactive exploration of the data

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)

## Contact
Joseph Leibson - joseph.leibson@gmail.com

Project Link: [https://github.com/jleibson/socioeconomic-trends-analysis](https://github.com/jleibson/socioeconomic-trends-analysis)

