# Read in the diabetes file

diabetes_data <- read.csv("diabetes-md.csv", na ="")



# What type is the data?

class(diabetes_data)

str(diabetes_data)

dim(diabetes_data)

row(diabetes_data)



# Examine missing data

diabetes_data[!complete.cases(diabetes_data),]



# Install the mice package if not already installed

install.packages("mice")

library(mice)

md.pattern(diabetes_data)



library(VIM)

missing_values <- aggr(diabetes_data, prop = FALSE, numbers = TRUE)



# Show content of missing values

summary(missing_values)

#Dealing with missing data
# I've decided to keep only data with 
# missing type and health status
# And the addresses are not important 
Keep_this_data <- diabetes_data[!complete.cases(diabetes_data$Daibetes.type, diabetes_data$Status),]
Keep_this_data
dim(Keep_this_data)

# 15 rows with missing data that i'd like to keep
# Reverse the logic to contain relevant data
Keep_this_data <-diabetes_data[complete.cases(diabetes_data$Daibetes.type, 
                                              diabetes_data$Status),]
Keep_this_data

dim(Keep_this_data)
dim(diabetes_data)

#replace the orginal data frame with the content of processes data 
diabetes_data <-Keep_this_data
head(diabetes_data, 15)

#4 Configure type to an unordered factor with 2 levels
diabetes_data$Type <- factor(diabetes_data$Type, order = FALSE, levels= c("Type1", "Type2"))
  
#Refactor Status too
diabetes_data$Status <- factor(diabetes_data$Status, order = TRUE, levels = c("Poor", "Improved", "Excellent"))

#5 Define the new column names
col_names <- c("Patient Name", "NI address", "Type", "Age", "Health status")

colnames(diabetes_data) <- col_names

str(diabetes_data)

#Lets looka at class 
class_list <-lapply(diabetes_data, class)
class_list

class_list <-sapply(diabetes_data, class)
class_list

#Charts---------------

# Build the data frame list 
dose <- c(20, 30, 40, 50, 60)
drug_a <- c(16, 20, 27, 40, 60)
drug_b <- c(15, 18, 25, 31, 40)
  
# Create a new data frame
drugs <-data.frame(dose, drug_a, drug_b)
str(drugs)
class(drugs)

#general plot of data
plot(drugs)

attach(drugs)
plot(dose, type = "o", col = "blue")
?plot

# Option type = "b" shows both lines should be plotted
plot(dose, drug_a, type = "b")












  
  
  
  
  
  
  




