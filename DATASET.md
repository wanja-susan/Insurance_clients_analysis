# The Dataset
The data was sourced from Onyx Data on LinkedIn as part of a challenge named "Car Insurance Claims Dataset."

The dataset has 11912 rows and 16 columns.
The dataset was loaded in MYSQL Workbench which took 3 hours to completely upload the dataset.
The next step involved changing the columns to their correct data type. This dataset was clean, hence the analysis process started immediately.

The Database used is MYSQL Workbench.

## Summary of the dataset
| Column Name        | Type       | Description                                     |
|-------------------|------------|----------------------------------------------|
| id                | string     | Customer's record ID                          |
| birthdate         | date       | Customer's Birthday '%m/%d/%Y'            |
| marital_status    | string     | Customer's marital status                    |
| car_use           | string     | The reason of having a car: private, commercial |
| gender            | string     | Customer's gender                            |
| kids_driving      | integer    | No of Customers using the same car          |
| parent            | string     | Is Customer a parent?                        |
| education         | string     | Customer's education level                   |
| car_make          | string     | Car's manufacturer                          |
| car_model         | string     | Car's model                                 |
| car_color         | string     | Car's colour                                |
| car_year          | year       | The year that the car is in manufacture     |
| claim_freq        | integer    | How many times customer claim insurance     |
| coverage_zone     | string     | What is the coverage zone                   |
| claim_amt         | decimal    | Claim amount                                |
| household_income  | decimal    | Household income                            |

