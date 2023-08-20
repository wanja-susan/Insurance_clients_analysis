# Note
I will only be displaying the first ten results of my query, if the output is more than 10, to save time

 ## Question 1
 •	What is the average age of customers who have made claims?
 
 You need to Calculate the age of each customer by subtracting their birth year from the current year, then
 Calculate the average of the calculated ages.
 
 `SELECT ROUND(AVG(YEAR(current_date())-YEAR(birthdate)),2) AS avg_age
FROM car_insurance.vcars
WHERE claim_freq !=0;`
 ## Output
 ![A1](https://github.com/wanja-susan/Insurance_clients_analysis/assets/130906675/9d158246-eda6-492a-a72d-bd0dd8fdf234)

 ## Question 2
 •	How does marital status correlate with claim frequency and claim amount?
 
 Calculate the average claim frequency and average claim amount for each "marital_status" group and round it to three decimal places.

 `SELECT marital_status, ROUND(AVG(claim_freq),3) AS avg_claim_freq, ROUND(AVG(claim_amt),3) AS avg_claim_amt
FROM car_insurance.vcars
GROUP BY marital_status
ORDER BY avg_claim_amt DESC;`
## Output
![A2](https://github.com/wanja-susan/Insurance_clients_analysis/assets/130906675/6d458e11-c7e9-4389-addd-525a6b28ab93)

## Question 3
•	What is the most common car color among customers with private car use?

Calculate the count of rows (number of cars) for each unique car color and assigns it the alias "car_color_count then 
filter the data to include only rows where the "car_use" column has the value 'Private', indicating private car usage.

`SELECT car_color, COUNT(*) AS car_color_count
FROM car_insurance.vcars
WHERE car_use = 'Private'
GROUP BY car_color
ORDER BY car_color_count DESC
LIMIT 1;`

![A3](https://github.com/wanja-susan/Insurance_clients_analysis/assets/130906675/11610d28-3eac-4ae2-86c5-ed8f31d24699)

## Question 4
•	How many customers have cars that are more than 5 years old and have made claims?

Count the number of rows (cars) that meet the specified conditions and assign it the alias "cars_more_than_5yrs_old then 
filter the data using the where clause to include only rows that meet the two conditions.

`SELECT COUNT(*) AS cars_more_than_5yrs_old
FROM car_insurance.vcars
WHERE car_year<=YEAR(curdate())-5
 AND claim_freq !=0;`
 
![A4](https://github.com/wanja-susan/Insurance_clients_analysis/assets/130906675/92431627-29d6-44fd-a046-36c762f5581a)

## Question 5
•	Which coverage zone has the highest average claim amount?

Calculate the average claim amount for each "coverage_zone" group and round it to three decimal places.
Group the data by the "coverage_zone" column. This allows calculations to be performed for each unique coverage zone.
Limit the result set to only one row, which will be the coverage zone with the highest average claim amount.

`SELECT coverage_zone, ROUND(AVG(claim_amt),3) AS avg_claim_amt
FROM car_insurance.vcars
GROUP BY coverage_zone
ORDER BY avg_claim_amt DESC
LIMIT 1 ;`
 
![A5](https://github.com/wanja-susan/Insurance_clients_analysis/assets/130906675/35517339-eb88-4cca-9158-b995775e15f6)

## Question 6
•	What is the total number of claims for customers with commercial car use?

 Calculate the sum of claim frequencies for all rows that meet the condition,
 "car_use" column has the value 'commercial', indicating commercial car usage, and assigns it the alias "total_claims
 
`SELECT SUM(claim_freq) AS total_claims
FROM car_insurance.vcars
WHERE car_use = 'commercial';`

![A6](https://github.com/wanja-susan/Insurance_clients_analysis/assets/130906675/6b0f9129-7c78-4aac-bb1e-aea444176cb3)

## Question 7
 •	Do parents have a higher claim frequency compared to non-parents?
Calculate the sum of claim frequencies for all rows that meet the condition, and assign it the alias "total_claims
filter the data to include only rows where the "car_use" column has the value 'commercial', indicating commercial car usage.

`SELECT parent, AVG(claim_freq) AS avg_claim_freq
FROM car_insurance.vcars
GROUP BY parent
ORDER BY avg_claim_freq DESC;`

![A7](https://github.com/wanja-susan/Insurance_clients_analysis/assets/130906675/7a89456e-105d-4bea-bcd1-cbd43ca9f893)

## Question 8
 •	What is the average claim amount for parents compared to non-parents?

 Calculate the average claim amount for each unique value in the "parent" column and rounds it to three decimal places.
 
`SELECT parent, ROUND(AVG(claim_amt),3) AS avg_claim_amt
FROM car_insurance.vcars
GROUP BY parent
ORDER BY avg_claim_amt DESC;`

![A8](https://github.com/wanja-susan/Insurance_clients_analysis/assets/130906675/b5dfed75-df1d-4c91-be05-eebbbeb7e61d)








