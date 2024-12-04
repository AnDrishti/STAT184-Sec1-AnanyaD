# STAT184-HW-Introduction
# United States Armed Forces Data Analysis

## Introduction

Welcome to the repository for the United States Armed Forces Data Analysis project. This repository was created as part of an assignment to explore, clean, and analyze military personnel data. The primary goal is to transform raw, untidy data into a structured, tidy format for meaningful analysis and visualization.

The repository includes:
- **Data**: A CSV file containing information on active-duty personnel across different branches of the US Armed Forces, categorized by pay grade, branch, and gender.
- **Code**: An R script to clean, manipulate, and tidy the dataset.

## Implementation

### Data Processing
The raw data, `US-ArmedForces-untidy.csv`, was processed using R with the following steps:
1. **Loading Necessary Packages**: Libraries such as `rvest`, `tidyverse`, and `dplyr` were used for web scraping, data manipulation, and cleaning.
2. **Data Cleaning**:
   - Removed unnecessary columns and rows.
   - Renamed columns for better readability.
   - Replaced missing values (`NA`) with `0`.
3. **Data Transformation**:
   - Filtered out irrelevant rows based on the pay grade column.
   - Pivoted the data into a "tidy" format for easy analysis using `pivot_longer`.
   - Split composite columns (e.g., "Branch, Gender") into separate variables and trimmed whitespace.

### Key Challenges
- Handling missing values effectively.
- Ensuring that column names and data structures were consistent.
- Filtering rows based on specific text patterns in the pay grade column.


### Results
Summary of Findings
- Successfully transformed the dataset into a tidy format, making it ready for further analysis.
- The cleaned dataset provides insights into the distribution of active-duty personnel across branches and genders.

### Key Learnings
- Learned how to work with raw, untidy data and make it analysis-ready.
- Gained experience using R for data cleaning and manipulation, including advanced functions like pivot_longer and mutate.

### Contact
For any questions or collaboration opportunities, feel free to reach out:

Name: Ananya Drishti

Email: azd6012@psu.edu
