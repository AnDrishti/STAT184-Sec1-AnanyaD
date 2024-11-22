#Writing Our Code ----
##Step 0: Loading any relevant packages ----
library(rvest)
library(tidyverse)
library(dplyr)
##Step 1: Get Data From csv file ----
df <- read_csv("C:/Users/PRIYNKA/Downloads/US Armed Forces (6_2024) - Sheet1.csv", col_names = "FALSE")

# 1: Remove unwanted totals columns.
df_new <- df[, !(names(df) %in% c("X4", "X7", "X10", "X13", "X16", "X17", "X18", "X19"))]

df_untidy <- df_new %>%
  
  # 2: Rename columns.
  rename(
    "Pay_Grade" = "FALSE",          
    "Army, Male" = X2,
    "Army, Female" = X3,
    "Navy, Male" = X5,
    "Navy, Female" = X6,
    "Marine Corps, Male" = X8,
    "Marine Corps, Female" = X9,
    "Air Force, Male" = X11,
    "Air Force, Female" = X12,
    "Space Force, Male" = X14,
    "Space Force, Female" = X15
  )%>%
  mutate(
    # 3: Replace missing values (NA) with 0 across multiple columns
    across(everything(), ~ ifelse(is.na(.), 0, .))
  )%>%
  # 4: Remove unwanted rows based on Paygrade Column
  filter(
    !Pay_Grade %in% c("Active-Duty Personnel by Service Branch, Sex, and Pay Grade", "Pay Grade", 
                           "Total Enlisted", "Total Warrant Officers", "Total Officers", "Total",
                           "Source: DMDC Active-Duty Military Personnel Master File (June 2024)",
                           "0", "1", "2")
  )

military_tidy_data <- df_untidy %>%
  # 5: pivot_longer() func.
  pivot_longer(
    cols = -Pay_Grade,  # This selects all columns except Pay_Grade
    names_to = "Branch_Gender",  # Name for the gathered column
    values_to = "Amount"  # Name for the values column
  ) %>%
  # 6: Split the Branch_Gender column into two separate columns
  separate(Branch_Gender, into = c("Branch", "Gender"), sep = ", ") %>%
  # 7: Remove any whitespace that may be around the Branch and Gender names
  mutate(across(c(Branch, Gender), ~ trimws(.))) 

# 8: View the tidied data
View(military_tidy_data)