SELECT * FROM country;

SELECT Continent, SUM(Population) AS sum_pop, AVG(LifeExpectancy) AS avg_life 
FROM country GROUP BY Continent
HAVING sum_pop >= 1000000;

SELECT CASE WHEN Population < 1000000 then 'small'
			WHEN Population < 10000000 then 'medium'
            WHEN Population < 100000000 then 'large'
            WHEN Population >= 100000000 then 'Extra large' 
            END AS pop_size,
            AVG(LifeExpectancy) AS avg_life
            FROM country GROUP BY 1;

SELECT Language, COUNT(distinct CountryCode) AS num_country 
FROM countrylanguage 
GROUP BY language
ORDER BY 2 desc;

SELECT region, AVG(population) AS avg_pop 
FROM country 
GROUP BY region
HAVING avg_pop > (SELECT AVG(population) FROM country);




            