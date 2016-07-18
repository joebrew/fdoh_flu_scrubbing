library(readxl)
library(readr)
# flshots <- read_excel('FLShotsHeaders.xlsx')

# CHANGE THE BELOW LINE
ab <- read_excel('private_data_goes_here.xls')

# Recode person ID
ab$personID <- as.numeric(factor(ab$personID))

# Recode teacher name
ab$teacherName <- as.numeric(factor(ab$teacherName))

# Completely drop first, middle, and last name
ab$firstName <- NULL
ab$middleName <- NULL
ab$lastName <- NULL

# Keep only the birth month (not individual date)
ab$dob <- paste0(format(as.Date(ab$dob, '%Y-%m-')), '01')

# Write a new (cleaned) file for Joe
write_csv(ab, 'srubbed_data_for_joe.csv')