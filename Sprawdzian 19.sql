use Mondial;

----------------------------------------------------------------------------------------------------------
--Zadanie1  znajdŸ miasta i ich ludnoœc pomiedzy œrednia liczbê ludnioœci, których kod panstwa jest z zakresu od b do h  a srednia liczbê ludnoœci których kod panstwa jest z zakresu od k do p

select city.name, city.population from city
where population between (select Avg(population) from city where country like '[b-h]%') and (select Avg(population)  from city  where country like '[k-p]%');
select Avg(population) from city where country like '[b-h]%';
select Avg(population)  from city  where country like '[k-p]%';

--------------------------------------------------------------------------------------------------------
--Zadanie2 znajdŸ wszystkie miasta ich ludnoœc oraz kod panstwa uwzgledniaj¹c w podzapytaniu najwiêksz¹ liczbe ludnoœci  w miastach . Pogrupuj je wg codu pañstwa

select city.name, city.population, city.country
from city where population in (select max(population) from city group by country);

-----------------------------------------------------------------------------------------------------
--Zadanie3 znajdŸ wyspê i jej powierzchniê. Uwzglednij w zapytaniu podzapytanie dotyczace najwiekszej powierzchni l¹du tej wyspy)

select * from island;
select island.name, island.area from island where area = (select MAX(area) from island);

-------------------------------------------------------------------------------------------------------
--Zadanie4 znajdŸ wszystki rzeki których wielkoœc jest powyzej œredniej wszystkich rzek

select * from river;
select name, length from river where length > (select AVG(length) from river);

-------------------------------------------------------------------------------------------------------
--Zadanie5 znajd¿ kraje(nazwe, kod, GDP)  których dochód narodowy GDP jest ponizej produktu narodowego azji  

select GDP, country.name , economy.country from country inner join economy
on country.code = economy.country where GDP < all (select GDP  from economy inner join encompasses
on economy.country = encompasses.country and GDP is not null and continent like 'Asia' );

-------------------------------------------------------------------------------------------------------
--Zadanie6 znajdŸ wszystkie pañstwa, których populacja jest wieksza niz srednia ludnioœci w pañstw z  zakresu nazw od k do p. Posortuj dane malejace wg ludnoœci

select name, population from country where population>(select AVG(population) from country where name like '[k-p]%')
order by population desc;

---------------------------------------------------------------------------------------------------------

--Zadanie7  znajdŸ morze i jego g³ebokoœc. Uwzglednij w zapytaniu podzapytanie dotyczace najp³ytszego morza)

select * from sea;
select sea.name, sea.depth from sea where depth=(select MIN(depth) from sea);

----------------------------------------------------------------------------------------------------------
--Zadanie8 znajdŸ wszystkie miasta, których populacja jest wieksza niz srednia ludnioœci w Niemiec i Francji

select AVG(population) from city where country='D' or country='F';

select name, population from city where population >(select AVG(population) from city where country='d' or country ='f')
order by population;

-----------------------------------------------------------------------------------------------------------
