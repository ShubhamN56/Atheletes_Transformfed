create database sqlprj1;
use sqlprj1;

create table olympics(
ID int,
Name varchar(500),
Sex varchar(10),
Age int,
Height int,
Weight int,
Team varchar(350),
NOC varchar(100),
Games varchar(500),
Year int,
Season varchar(400),
City varchar(300),
Sport varchar(500),
Event varchar(400),
Medal varchar(200));

select* from olympics;

-- load data

show variables like "secure_file_priv";

load data infile "C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/Athletes_Transformed.csv"
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;


-- SQL PROJECT

-- 1. Show how many medal counts present for entire data
select Medal,count(*) as medal_counts from olympics
where Medal <> "NoMedal"
group by Medal;


-- 2. Show count of unique sports present in Olympics
select count(distinct(Sport)) as unique_sport from olympics;

-- 3. Show how many different medals won by team India
select Team,medal,count(Medal) as Medal_count
from olympics
where Team="India" 
group by medal;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select Team,Event,count(Medal) as medal_count 
from olympics 
where Team="India" and Medal<>"NoMedal"
group by Event
order by medal_count desc
limit 5;




-- 5. Show event wise medals won by India in order of year
select distinct(Year) as year, Team, Event from olympics
where Team="India" and Medal<>"NoMedal"
group by Event,year
order by year
limit 5; 



-- 6. show country who won maximum medals.
select Team, count(Medal) as medalcount
from olympics 
where Medal<>"NoMedal"
group by Team
order by medalcount desc
limit 5;



-- 7.show top 10 countries whowon gold
select Team,count(Medal) as goldcount
 from olympics 
where Medal="Gold"
group by Team
order by goldcount desc
limit 10;



--  8. show in which year did United states won most gold medal
select year,Team,Medal,
count(Medal) as countmedal
from olympics
where Team="United States" 
and Medal="Gold" 
group by year
order by countmedal desc
limit 1;



-- 9. In which sports United States has most medals.
select  Sport,Team,
count(Medal) as medalcount
from olympics
where Medal<>"NoMedal" and 
Team="United states"
group by Sport
order by medalcount desc
limit 5;


-- 10. Find top three players who won most medals along with their sports and country
select Name, Sport,Team,
count(Medal) as medalcounts
from olympics 
where Medal<>"NoMedal"
group by Name,Team,Sport
order by medalcounts desc
limit 3;

-- 11. Find player with most gold medals in cycling along with his country.
select Name,Sport,Team,count(Medal) as medalcount
from olympics 
where Medal="Gold" and
Sport="Cycling"
Group by Name,Sport,Team
order by medalcount desc
limit 1;

-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select Name, count(Medal) as medalcount, Team, Sport
from olympics 
where Medal<>"NoMedal" and
Sport="Basketball"
group by Name,Team,Sport
order by medalcount desc
limit 1;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select distinct(Medal) as medals, count(Medal) as  totalmedals
from olympics 
where Name="Teresa Edwards"
group by medals;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select year,sex,count(*) as medalcounts from olympics 
where Medal<>"NoMedal"
group by year,sex
order by year 
limit 20;



