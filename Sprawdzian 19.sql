use Mondial;

----------------------------------------------------------------------------------------------------------
--Zadanie1  znajd� miasta i ich ludno�c pomiedzy �rednia liczb� ludnio�ci, kt�rych kod panstwa jest z zakresu od b do h  a srednia liczb� ludno�ci kt�rych kod panstwa jest z zakresu od k do p

select city.name, city.population from city
where population between (select Avg(population) from city where country like '[b-h]%') and (select Avg(population)  from city  where country like '[k-p]%');
select Avg(population) from city where country like '[b-h]%';
select Avg(population)  from city  where country like '[k-p]%';

--------------------------------------------------------------------------------------------------------
--Zadanie2 znajd� wszystkie miasta ich ludno�c oraz kod panstwa uwzgledniaj�c w podzapytaniu najwi�ksz� liczbe ludno�ci  w miastach . Pogrupuj je wg codu pa�stwa

select city.name, city.population, city.country
from city where population in (select max(population) from city group by country);

-----------------------------------------------------------------------------------------------------
--Zadanie3 znajd� wysp� i jej powierzchni�. Uwzglednij w zapytaniu podzapytanie dotyczace najwiekszej powierzchni l�du tej wyspy)

select * from island;
select island.name, island.area from island where area = (select MAX(area) from island);

-------------------------------------------------------------------------------------------------------
--Zadanie4 znajd� wszystki rzeki kt�rych wielko�c jest powyzej �redniej wszystkich rzek

select * from river;
select name, length from river where length > (select AVG(length) from river);

-------------------------------------------------------------------------------------------------------
--Zadanie5 znajd� kraje(nazwe, kod, GDP)  kt�rych doch�d narodowy GDP jest ponizej produktu narodowego azji  

select GDP, country.name , economy.country from country inner join economy
on country.code = economy.country where GDP < all (select GDP  from economy inner join encompasses
on economy.country = encompasses.country and GDP is not null and continent like 'Asia' );

-------------------------------------------------------------------------------------------------------
--Zadanie6 znajd� wszystkie pa�stwa, kt�rych populacja jest wieksza niz srednia ludnio�ci w pa�stw z  zakresu nazw od k do p. Posortuj dane malejace wg ludno�ci

select name, population from country where population>(select AVG(population) from country where name like '[k-p]%')
order by population desc;

---------------------------------------------------------------------------------------------------------

--Zadanie7  znajd� morze i jego g�eboko�c. Uwzglednij w zapytaniu podzapytanie dotyczace najp�ytszego morza)

select * from sea;
select sea.name, sea.depth from sea where depth=(select MIN(depth) from sea);

----------------------------------------------------------------------------------------------------------
--Zadanie8 znajd� wszystkie miasta, kt�rych populacja jest wieksza niz srednia ludnio�ci w Niemiec i Francji

select AVG(population) from city where country='D' or country='F';

select name, population from city where population >(select AVG(population) from city where country='d' or country ='f')
order by population;

-----------------------------------------------------------------------------------------------------------
