rm(list=ls())
# 1. Load your libaries, set your quandl key
library(Quandl)
library(mongolite)
Quandl.api_key("NK5VXuCQ2udjooiGPg5z")

# 2. Set your database connection
url_path = 'mongodb+srv://rix:Austin2020@cluster0.xjb0o.mongodb.net/test'
#new gdp collection
gdp_collection <- mongo(collection = "gdp", 
                         db = "rix_analytics",
                         url = url_path, 
                         verbose = TRUE)

# 3. Get the data from quandl into a data frame
data <- Quandl("FRED/GDP", start_date="2010-01-01")
gdp <- data.frame(data)

#check data frame records and size
head(gdp)
dim(gdp)

# 4. Create Load the crude data frame into the database (Uses odbc and DBI package)
gdp_collection$insert(gdp)

# 5. Check the count (Uses RODBC package)
check_df <- gdp_collection$find(query = '{}')
dim(check_df)
