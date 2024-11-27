select * from finance.financialdata;

-- create table before import dataset into database 
CREATE TABLE FinancialData (
    Income FLOAT,
    Age INT,
    Dependents INT,
    Occupation VARCHAR(50),
    City_Tier VARCHAR(10),
    Rent FLOAT,
    Loan_Repayment FLOAT,
    Insurance FLOAT,
    Groceries FLOAT,
    Transport FLOAT,
    Eating_Out FLOAT,
    Entertainment FLOAT,
    Utilities FLOAT,
    Healthcare FLOAT,
    Education FLOAT,
    Miscellaneous FLOAT,
    Desired_Savings_Percentage FLOAT,
    Desired_Savings FLOAT,
    Disposable_Income FLOAT,
    Potential_Savings_Groceries FLOAT,
    Potential_Savings_Transport FLOAT,
    Potential_Savings_Eating_Out FLOAT,
    Potential_Savings_Entertainment FLOAT,
    Potential_Savings_Utilities FLOAT,
    Potential_Savings_Healthcare FLOAT,
    Potential_Savings_Education FLOAT,
    Potential_Savings_Miscellaneous FLOAT);
    

-- total count for all records
select count(*) from financialdata ;

-- avg salary 
select avg(income) from finance.financialdata;

-- the total expenditure on healthcare for individuals aged 30 and above
select sum(Healthcare) as sum_healthcare from financialdata
where age >= '30';

-- income and top 5 salary in tier 1
select income, occupation from finance.financialdata
where City_Tier = 'Tier_1'
order by income desc
limit 5;

-- top 5 income in tier 2 cities
select income, occupation from finance.financialdata
where City_Tier = 'Tier_2'
order by income desc
limit 5;

-- tier 3 
select income, occupation from finance.financialdata
where City_Tier = 'Tier_3'
order by income desc
limit 5;


-- individual with income and occupation in they younger age
select min(age) as min_age, income, Occupation from financialdata
group by income, Occupation
order by min_age
limit 10;

-- Count the number of individuals aged 50 or above
SELECT COUNT(*) FROM financialdata WHERE Age >= 50;

-- average amount spent on groceries by individuals in Tier 1 cities
SELECT avg(Groceries) AS avg_groceries FROM financialdata WHERE city_tier = 'Tier_1';

-- the total expenditure on healthcare across all city tiers
select sum(healthcare) as sum_healthcare, city_tier 
from finance.financialdata
group by City_Tier;

-- Professionals with transport expenses
SELECT COUNT(*) as Prof_Transport
FROM financialdata
WHERE Occupation = 'Professional' AND Transport > 0;

-- Average utility expenditure for individuals below 30
select AVG(Utilities) as avg_utilities
from financialdata
where Age < 30;

-- Individuals in Tier 2 with desired savings percentage > 15%
select count(*) as count_Tier2
FROM financialdata
WHERE City_Tier = 'Tier_2' AND Desired_Savings_Percentage > 15;

-- Individuals with grocery expenses greater than 5,000
select COUNT(*) as high_groceries
from financialdata
where Groceries > 5000;

SELECT * FROM financialdata
WHERE Rent > 10000 AND City_Tier = 'Tier_3';

-- Average income for individuals aged 30-40
Select avg(Income) as avg_income
from financialdata
where Age between 30 and 40;

-- average income of individuals in Tier 1 cities
select avg(income) as avg_income 
from financialdata
where city_tier = 'tier_1';

-- the average income of individuals who spend more on entertainment than on education
select avg(income), age as avg_income from financialdata
where Entertainment > Education
group by age
order by age 
limit 10;

-- the number of individuals with insurance expenses greater than 2,000
select count(*) from financialdata where insurance > 2000;

-- the average loan repayment amount for individuals with dependents
select avg(loan_repayment) as average_loan_repayment from financialdata  where dependents > 0;

-- the number of individuals with transport expenses less than 1,000
select count(*) from financialdata where transport < 1000;


-- the number of individuals with desired savings greater than 10,000
select count(*) from financialdata where desired_savings > 10000;

-- the total disposable income for individuals aged 45 and above
select sum(disposable_income) as total_disposable_income from financialdata where age >= 45;


-- the number of individuals with groceries expenses greater than 5,000
select count(*) from financialdata where Groceries < 5000;

-- the total amount spent on eating out by individuals in Tier 2 cities
select sum(eating_out) as total_eating_out from financialdata where city_tier = 'Tier_2';

-- Count the number of individuals with disposable incomes less than 5000
select count(*) from financialdata where disposable_income < 5000;


-- the average rent for individuals living in Tier 1 cities and having 2 or more dependents
SELECT avg(Rent) as Avg_rent
FROM financialdata
WHERE City_Tier = 'Tier_1' AND dependents >= 2;


-- the individuals who spend more on entertainment than on healthcare
SELECT * FROM financial_data WHERE Entertainment > Healthcare;

-- How many individuals have a potential savings on groceries greater than 1000 and a potential savings on entertainment less than 500
SELECT COUNT(*) AS Count_High_Groceries_Low_Entertainment
FROM financialdata
WHERE Potential_Savings_Groceries > 1000 AND Potential_Savings_Entertainment < 500;

