# Enter data into vectors before constructing the data frame
date_col <- c("10/15/18", "01/11/18", "10/21/18", "10/28/18", "05/01/18")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99)
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2) # NA is inserted in place of the missing data for this attribute
q5_col <- c(5, 5, 2, NA, 1)

# Construct a data frame using the data from all the vectors
managers_data <- data.frame(date_col, 
                            country_col, 
                            gender_col, 
                            age_col, 
                            q1_col, 
                            q2_col, 
                            q3_col, 
                            q4_col, 
                            q5_col)

managers_data

column_names <- c("Date", 
                  "Country", 
                  "Gender", 
                  "Age", 
                  "Q1", 
                  "Q2", 
                  "Q3", 
                  "Q4", 
                  "Q5")

# Add column names to the managers_data dataframe
colnames(managers_data) <- column_names

managers_data


# Recode the incorrect 'age' to NA
managers_data$Age[managers_data$Age == 99] <- NA
managers_data


# 2 options to create new variable 
# 1 - create a new vector and store the logical check in it 
# 2 - create the new var when doing the logical check 

managers_data$age_cat[managers_data$Age <=25] <-"Young"
managers_data


# Recode age_cat so that it is ordinal and factored 
# with the order young , middle aged, elder
age_cat <- factor(managers_data$AgeCat, order =TRUE, levels= c("Young", "Middle Aged", "Elder"))
age_cat

# replace manager_data age_cat variable with 
# the factored variable 

managers_data$Agecat <-age_cat
managers_data

# Look at the structure of data frame 
str(managers_data)

managers_data

# Create a new col called 'summary_col' that 
# Contains a summary of each row
summary_col <- managers_data$Q1 + 
  managers_data$Q2 + 
  managers_data$Q3 + 
  managers_data$Q4 + 
  managers_data$Q5

summary_col

# Add summary_col to the end of the data frame 
# take content of the data frame , create a new data frame 
# and add summary_col vector to the data frame 

managers_data <- data.frame(managers_data, summary_col)
managers_data

# Calculate mean value for each row 
mean_value <- rowMeans(managers_data[5:9])
mean_value

# Add the mean_value vector to the data frame 

managers_data <- data.frame(managers_data, mean_value)
managers_data

# Change variable titles to make them more readable 
names(managers_data)[11] <-"Summary"
names(managers_data)[12] <-"Mean Value"

# show the structure of the data frame
str(managers_data)
managers_data

# Covert the current date chr variable to a date type var
# Currently using dd/mm/yy
managers_data$Date
converted_date <- as.Date(managers_data$Date, "%m/%d/%y")
converted_date
str(converted_date)


# Overwrite the current date var with the new date var
# in the managers data frame 
managers_data$Date <- converted_date
str(managers_data)

# Dealing with missing data 
# Listwise deletion = remove any rows that contain NA
new_managers_data <-na.omit(managers_data)
new_managers_data


# Use complete.cases
complete_managers_data <- complete.cases(managers_data)
complete_managers_data
sum(complete_managers_data)

# List rows that do not have missing vals
complete_managers_data <- managers_data[complete.cases(managers_data) ,]
complete_managers_data

# List rows with missing values 
managers_data[!complete.cases(managers_data) ,]

# show summary of all missing vals in a variable 
sum(is.na(managers_data$Age))
sum(is.na(managers_data$`Mean Value`))

# Install and use the mice packages to show 
# Missing vars in the managers data frame 
install.packages("mice")
library(mice)
md.pattern(managers_data)

# The VIM pack also shows missing values 
install.packages("VIM")
library(VIM)
missing_values <- aggr(managers_data, prop = FALSE, numbers = TRUE)

# show summary of the content of missing values 
summary(missing_values)







































