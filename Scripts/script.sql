--1.	How many rows are in the data_analyst_jobs table?
SELECT COUNT (*)
FROM data_analyst_jobs

--Answer- 1793

--2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
	
SELECT *
FROM data_analyst_jobs
LIMIT 10

--Answer- ExxonMobil
--3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT (location)
FROM data_analyst_jobs
WHERE location IN('TN', 'KY')

--Answer 21, 27
--4.	How many postings in Tennessee have a star rating above 4?

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE star_rating >4

--Answer 416 
--5.	How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000

--Answer 151

--6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT location as State , AVG (star_rating) as avg_rating
FROM data_analyst_jobs
group by location
order by avg_rating desc

--Answer "NE"

--7.	Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT (distinct title)
FROM data_analyst_jobs

--Answer 881
--8.	How many unique job titles are there for California companies?
SELECT COUNT (distinct title)
FROM data_analyst_jobs
WHERE location = 'CA'

--Answer 230
--9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
	
SELECT company, AVG(star_rating) AS Avg_rating, SUM(review_count) AS total_review
FROM data_analyst_jobs
where company is not null
GROUP BY company
HAVING SUM(review_count) > 5000

---Ans 70
	
-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, AVG(star_rating) AS Avg_rating, SUM(review_count) AS total_review
FROM data_analyst_jobs
where company is not null
GROUP BY company
HAVING SUM(review_count) > 5000
ORDER BY Avg_rating DESC

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

SELECT DISTINCT(title)
FROM data_analyst_jobs
--where lower(title) like '%analyst%';
WHERE title  ILIKE '%Analyst%' 

--12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%'

--4, Tableaue