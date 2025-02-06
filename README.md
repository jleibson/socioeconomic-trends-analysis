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

## Installation
1. Clone this repository
2. Install required R packages:
install.packages(c("tidyverse", "tidycensus", "ggplot2", "corrplot", "plotly"))

3. Set up your Census API key (get one at https://api.census.gov/data/key_signup.html)

## Usage
1. Open `socioeconomic_trends_analysis.R` in RStudio
2. Run the script to perform the analysis and generate visualizations

## Output
- CSV file with cleaned and analyzed data
- PNG file with faceted plot of income vs. education by age group
- HTML file with interactive plot

## Key Findings
- Strong positive correlation (0.65) between education level and median income
- Age has a slight negative correlation (-0.12) with income
- Work hours and management occupations positively correlate with income (0.17 and 0.33 respectively)
- The relationship between education and income varies across age groups, as visualized in the faceted plot

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

