library(mongolite)



url_path = 'mongodb+srv://rix:Austin2020@cluster0.xjb0o.mongodb.net/test'



gdp2_collection <- mongo(collection = "gdp2", 
                         db = "sample_dataset_R",
                         url = url_path, 
                         verbose = TRUE)

# insert code
gdp2_collection$insert(gdp)

check_df <- gdp2_collection$find(query = '{}')
dim(check_df)
