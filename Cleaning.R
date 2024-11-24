# Load necessary libraries

library(readxl)  # For reading Excel files
library(dplyr)   # For data manipulation

# Correct file path: Use double backslashes or forward slashes
file_path <- "E:/OneDrive/Documents/2021-s.xls"

# Load the data
# Check for correct sheet name (if multiple sheets exist)
data <- read_excel(file_path, sheet = 1)  # Replace 'sheet = 1' with the appropriate sheet name if needed

# View the column names to verify structure
colnames(data)

# Clean the "Logged GDP per capita" and "Ladder score" columns
cleaned_data <- data %>%

mutate(
    Logged GDP per capita = as.numeric(Logged GDP per capita),  # Convert to numeric

    Ladder score = as.numeric(Ladder score)                    # Convert to numeric
  ) %>%

  filter(!is.na(Logged GDP per capita), !is.na(Ladder score))   # Remove rows with NA values

# View the cleaned data
head(cleaned_data)

# Save the cleaned data to a new file


output_path <- "E:/OneDrive/Documents/cleaned_data.csv"

write.csv(cleaned_data, output_path, row.names = FALSE)

cat("Cleaned data saved to:", output_path, "\n")
