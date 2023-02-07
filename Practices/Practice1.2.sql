SELECT * FROM country;

SELECT name, population FROM country ORDER BY population desc limit 5;

SELECT name, region, SurfaceArea FROM country ORDER BY region desc, SurfaceArea;

SELECT name, LifeExpectancy, population FROM country WHERE LifeExpectancy >= 75 ORDER BY population;

SELECT name, Indepyear FROM country WHERE Indepyear between 1980 and 1990;

SELECT name, region, Indepyear FROM country WHERE region = 'Eastern Asia' and indepyear is null;

SELECT name, population, SurfaceArea FROM country WHERE region = 'Western Europe' and Population <= 80000000 and SurfaceArea >= 3000 ORDER BY Code desc;