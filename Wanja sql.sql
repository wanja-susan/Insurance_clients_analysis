SELECT * FROM car_insurance.vcars;
-- average age of customers who have made claims
SELECT ROUND(AVG(YEAR(current_date())-YEAR(birthdate)),2) AS avg_age
FROM car_insurance.vcars
WHERE claim_freq !=0;

-- •	How does marital status correlate with claim frequency and claim amount?
SELECT marital_status, ROUND(AVG(claim_freq),3) AS avg_claim_freq, ROUND(AVG(claim_amt),3) AS avg_claim_amt
FROM car_insurance.vcars
GROUP BY marital_status
ORDER BY avg_claim_amt DESC;

-- •	What is the most common car color among customers with private car use?
SELECT car_color, COUNT(*) AS car_color_count
FROM car_insurance.vcars
WHERE car_use = 'Private'
GROUP BY car_color
ORDER BY car_color_count DESC
LIMIT 1;

-- •	How many customers have cars that are more than 5 years old and have made claims?
SELECT COUNT(*) AS cars_more_than_5yrs_old
FROM car_insurance.vcars
WHERE car_year<=YEAR(curdate())-5
 AND claim_freq !=0;
 
-- •	Which coverage zone has the highest average claim amount?
SELECT coverage_zone, ROUND(AVG(claim_amt),3) AS avg_claim_amt
FROM car_insurance.vcars
GROUP BY coverage_zone
ORDER BY avg_claim_amt DESC
LIMIT 1 ;

-- •	What is the total number of claims for customers with commercial car use?
SELECT SUM(claim_freq) AS total_claims
FROM car_insurance.vcars
WHERE car_use = 'commercial';

-- •	Do parents have a higher claim frequency compared to non-parents?
SELECT parent, AVG(claim_freq) AS avg_claim_freq
FROM car_insurance.vcars
GROUP BY parent
ORDER BY avg_claim_freq DESC;

--- •	What is the average claim amount for parents compared to non-parents?
SELECT parent, ROUND(AVG(claim_amt),3) AS avg_claim_amt
FROM car_insurance.vcars
GROUP BY parent
ORDER BY avg_claim_amt DESC;
	
-- •	How does education level correlate with household income?
SELECT education, ROUND(AVG(household_income),3) AS avg_household_income
FROM car_insurance.vcars
GROUP BY education
ORDER BY avg_household_income DESC ;

-- •	What is the average claim frequency for male and female customers?
SELECT gender, AVG(claim_freq) AS avg_claim_freq
FROM car_insurance.vcars
GROUP BY gender
ORDER BY avg_claim_freq DESC;

-- •	Is there a correlation between the car's manufacturing year and claim frequency?
SELECT car_year, AVG(claim_freq) AS avg_claim_freq
FROM car_insurance.vcars
GROUP BY car_year
ORDER BY avg_claim_freq DESC
LIMIT 10;

-- •	What is the average claim amount for cars manufactured before 2010?
SELECT ROUND(AVG(claim_amt),3) AS avg_claim_amt
FROM car_insurance.vcars
WHERE  car_year < 2010;

-- •	Which coverage zone has the highest claim frequency?
SELECT coverage_zone, SUM(claim_freq) AS total_claim_freq
FROM car_insurance.vcars
GROUP BY coverage_zone
ORDER BY total_claim_freq DESC
LIMIT 1;

-- •	Is there a relationship between coverage zone and average claim amount?
SELECT coverage_zone, ROUND(AVG(claim_amt),3) AS avg_claim_amt
FROM car_insurance.vcars
GROUP BY coverage_zone
ORDER BY avg_claim_amt DESC;

-- •	What is the most common car make and model among customers with high claim amounts?
SELECT car_make, car_model, ROUND(SUM(claim_amt),3) AS total_claim_amt
FROM car_insurance.vcars
GROUP BY car_make, car_model
ORDER BY total_claim_amt DESC
LIMIT 1;

-- •	Are certain car makes associated with a higher claim frequency?
SELECT car_make, ROUND(AVG(claim_FREQ),3) AS avg_claim_freq
FROM car_insurance.vcars
GROUP BY car_make
ORDER BY avg_claim_freq DESC
LIMIT 10;

-- •	How does household income relate to claim frequency and claim amount?
SELECT household_income, ROUND(AVG(claim_amt),3) AS avg_claim_amt, ROUND(AVG(claim_freq),3) AS avg_claim_freq
FROM car_insurance.vcars
GROUP BY household_income 
ORDER BY avg_claim_amt,avg_claim_freq DESC
LIMIT 10;

-- •	How does the number of kids driving the same car impact claim frequency and claim amount?
SELECT kids_driving, 
ROUND(AVG(claim_amt),3) AS avg_claim_amt,
ROUND(AVG(claim_freq),3) AS avg_claim_freq
FROM car_insurance.vcars
GROUP BY kids_driving
ORDER BY avg_claim_amt DESC;

-- •	What is the distribution of claim amounts among customers?
SELECT claim_amt,
       COUNT(*) AS num_customers
FROM car_insurance.vcars
GROUP BY claim_amt
ORDER BY claim_amt DESC
LIMIT 10;

-- •	Is there a connection between customers' education levels and the car make they own?
SELECT education, car_make, COUNT(*) AS customer_count
FROM car_insurance.vcars
GROUP BY education, car_make
ORDER BY customer_count DESC ;

-- •	Do customers with higher education tend to have certain car makes?
SELECT education,
       car_make,
       COUNT(*) AS num_customers
FROM car_insurance.vcars
GROUP BY education, car_make
ORDER BY education, num_customers DESC;

-- •	What is the proportion of parents among male and female customers?
SELECT gender,
       parent,
       COUNT(*) AS num_customers,
       COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY gender) AS proportion
FROM car_insurance.vcars
GROUP BY gender, parent;
	
-- •	Do male or female customers have more kids driving the same car on average?
SELECT gender,
       AVG(kids_driving) AS avg_kids_driving
FROM car_insurance.vcars
GROUP BY gender;

-- •	Is there a difference in claim frequency between customers with private and commercial car use?
SELECT car_use,
       AVG(claim_freq) AS avg_claim_frequency
FROM car_insurance.vcars
GROUP BY car_use;

-- •	Do customers with commercial car use tend to have higher claim frequencies?
SELECT car_use,
       AVG(claim_freq) AS avg_claim_frequency
FROM car_insurance.vcars
WHERE car_use = 'commercial'
GROUP BY car_use;
