SELECT * FROM country;
SELECT * FROM city;
SELECT * FROM countrylanguage;

-- 1.Use Table Country and Language to find the language used in each country. 
-- 	 I want all columns from Country table and language column from Language table.

SELECT C.Name, L.Language 
	FROM country AS C, countrylanguage AS L 
    WHERE C.Code = L.CountryCode;

SELECT C.name, L.language 
	FROM country AS C JOIN 
    countrylanguage AS L
    ON C.code = L.CountryCode;

-- 2.Use table Country and City to find each country's capital city name. Hint: check the capital column in
-- 	 the table Country, and find which column you should use in table City to join these 2 tables. 

SELECT c.Name, ci.Name 
	FROM country AS c, 
    city AS ci 
    WHERE c.Capital = ci.ID;

SELECT c.Name, ci.Name 
	FROM country AS c 
    JOIN city AS ci 
    ON c.Capital = ci.ID;

-- 3. Use table Country and City to find each country's capital city name, the population in the capital city 
--    and the percentage of capital city's population in the whole country. 

SELECT c.Name AS country_name, 
	ci.Name AS capital_name, 
	ci.Population AS capital_pop,
    ci.Population/c.Population * 100.00 AS capital_pop_percent
	FROM country AS c, 
    city AS ci 
    WHERE c.Capital = ci.ID;

    


