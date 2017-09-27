# Titanic data exercise 
# 09/27/2017 - Chen Chen

# 0. Load data into Rstudio
titanic <- read.csv("titanic_original.csv",sep=',',stringsAsFactors = FALSE)

# 1. Port of embarkation: find missing Embarked values and replace 
# them with S (which stands for Southampton)
titanic$embarked[titanic$embarked == ""] <- "S"

# 2. Fill in missing age values with mean of age 
titanic$age[is.na(titanic$age)] <- mean(titanic$age,na.rm=TRUE)

# 3. Assign 'NA' to people who didn't make it to a lifeboat
titanic$boat[titanic$boat == ""] <- "NA"

# 4. Add cabin number column, set to 1 there is a cabin number,0 otherwise
has_cabin_number <- titanic$cabin
has_cabin_number[has_cabin_number != ""] <- 1
has_cabin_number[has_cabin_number == ""] <- 0
titanic_filled <- cbind(titanic,has_cabin_number)

write.csv(titanic_filled,file="titanic_clean.csv",row.names=FALSE)
