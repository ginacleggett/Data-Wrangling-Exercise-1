> refine <- read.csv("~/Downloads/refine_original.csv")
>   View(refine)
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:
  
  filter, lag

The following objects are masked from ‘package:base’:
  
  intersect, setdiff, setequal, union

> library(tidyr)
> # Clean up the 'company' column, so all of the misspellings of the brand names are standardized. For example, you can transform the values in the column to be: philips, akzo, van houten and unilever (all lowercase).
  > refine$company <- tolower(refine$company)
> refine$company <- gsub("phillips|phllips|fillips|phillps", "philips", refine$company")
                         + refine$company
                         + refine$company <- gsub("phillips|phllips|fillips|phillps", "philips", refine$company)
                         Error: unexpected string constant in:
                         "refine$company
                         refine$company <- gsub(""
                                                > View(refine)
                                                > str(gsub)
                                                function (pattern, replacement, x, ignore.case = FALSE, perl = FALSE, 
                                                          fixed = FALSE, useBytes = FALSE)  
                                                  > refine$company <- gsub("phillips|phllips|fillips|phillps", "philips", refine$company)
                                                > refine$company <- gsub("akzo|akz0|ak zo", "akzo", refine$company)
                                                > refine$company <- gsub("unilever|unilver", "unilever", refine$company)
                                                > #Separate the product code and product number into separate columns i.e. add two new columns called product_code and product_number, containing the product code and number respectively
                                                  > refine <- separate(refine, col = Product.code...number, into = c("product_code", "product_number"), sep = "-")
                                                > #In order to make the data more readable, add a column with the product category for each record.
                                                  > 
                                                  > refine$product_category[refine$product_code == "p"] <- "Smartphone"
                                                > 
                                                  > refine$product_category[refine$product_code == "v"] <- "TV"
                                                > refine$product_category[refine$product_code == "x"] <- "Laptop"
                                                > refine$product_category[refine$product_code == "q"] <- "Tablet"
                                                > #You'd like to view the customer information on a map. In order to do that, the addresses need to be in a form that can be easily geocoded. Create a new column full_address that concatenates the three address fields (address, city, country), separated by commas.
                                                  > 
                                                  > refine <- unite(refine, full_address, address, city, country, sep = ",")
                                                > 
                                                  > #Both the company name and product category are categorical variables i.e. they take only a fixed set of values. In order to use them in further analysis you need to create dummy variables. Create dummy binary variables for each of them with the prefix company_ and product_ i.e.
                                                  > str(mutate)
                                                function (.data, ...)  
                                                  > 
                                                  > refine <- mutate(refine, company_philips = ifelse(company == "philips", 1, 0), company_akzo = ifelse(company == "akzo", 1, 0), company_van_houten = ifelse(company == "van houten", 1, 0),company_unilever = ifelse(company == "unilever", 1, 0))
                                                > 
                                                  > refine <- mutate(refine, product_smartphone = ifelse(product_category == "Smartphone", 1, 0), product_tv = ifelse (product_category == "TV", 1, 0), product_laptop = ifelse(product_category == "Laptop", 1, 0),
                                                                     +                  +              product_tablet = ifelse(product_category == "Tablet", 1, 0))
                                                Error: unexpected '=' in:
                                                  "fine <- mutate(refine, product_smartphone = ifelse(product_category == "Smartphone", 1, 0), product_tv = ifelse (product_category == "TV", 1, 0), product_laptop = ifelse(product_category == "L
                                                +              product_tablet ="
                                                > refine <- mutate(refine, product_smartphone = ifelse(product_category == "Smartphone", 1, 0), product_tv = ifelse (product_category == "TV", 1, 0), product_laptop = ifelse(product_category == "Laptop", 1, 0), product_tablet = ifelse(product_category == "Tablet", 1, 0))
