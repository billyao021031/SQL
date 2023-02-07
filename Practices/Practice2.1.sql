SELECT * FROM country; 

SELECT name, region FROM country WHERE region IN ('Eastern Africa', 'North America', 'Middle East') ORDER BY region;

SELECT Name, Region, Population, LifeExpectancy FROM country WHERE region = 'Eastern Asia' AND (Population >= 70000000 OR LifeExpectancy > 75);

SELECT name FROM country WHERE name LIKE 'A%a';