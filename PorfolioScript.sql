/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

-- First table 
CREATE TABLE portfolio.owid_covid_data (
	iso_code VARCHAR(50) NULL,
	continent VARCHAR(50) NULL,
	location VARCHAR(50) NULL,
	`date` VARCHAR(50) NULL,
	total_cases REAL NULL,
	new_cases REAL NULL,
	new_cases_smoothed REAL NULL,
	total_deaths REAL NULL,
	new_deaths REAL NULL,
	new_deaths_smoothed REAL NULL,
	total_cases_per_million REAL NULL,
	new_cases_per_million REAL NULL,
	new_cases_smoothed_per_million REAL NULL,
	total_deaths_per_million REAL NULL,
	new_deaths_per_million REAL NULL,
	new_deaths_smoothed_per_million REAL NULL,
	reproduction_rate REAL NULL,
	icu_patients VARCHAR(50) NULL,
	icu_patients_per_million VARCHAR(50) NULL,
	hosp_patients VARCHAR(50) NULL,
	hosp_patients_per_million VARCHAR(50) NULL,
	weekly_icu_admissions VARCHAR(50) NULL,
	weekly_icu_admissions_per_million VARCHAR(50) NULL,
	weekly_hosp_admissions VARCHAR(50) NULL,
	weekly_hosp_admissions_per_million VARCHAR(50) NULL,
	total_tests VARCHAR(50) NULL,
	new_tests VARCHAR(50) NULL,
	total_tests_per_thousand VARCHAR(50) NULL,
	new_tests_per_thousand VARCHAR(50) NULL,
	new_tests_smoothed VARCHAR(50) NULL,
	new_tests_smoothed_per_thousand VARCHAR(50) NULL,
	positive_rate VARCHAR(50) NULL,
	tests_per_case VARCHAR(50) NULL,
	tests_units VARCHAR(50) NULL,
	total_vaccinations VARCHAR(50) NULL,
	people_vaccinated VARCHAR(50) NULL,
	people_fully_vaccinated VARCHAR(50) NULL,
	total_boosters VARCHAR(50) NULL,
	new_vaccinations VARCHAR(50) NULL,
	new_vaccinations_smoothed VARCHAR(50) NULL,
	total_vaccinations_per_hundred VARCHAR(50) NULL,
	people_vaccinated_per_hundred VARCHAR(50) NULL,
	people_fully_vaccinated_per_hundred VARCHAR(50) NULL,
	total_boosters_per_hundred VARCHAR(50) NULL,
	new_vaccinations_smoothed_per_million VARCHAR(50) NULL,
	new_people_vaccinated_smoothed VARCHAR(50) NULL,
	new_people_vaccinated_smoothed_per_hundred VARCHAR(50) NULL,
	stringency_index REAL NULL,
	population_density REAL NULL,
	median_age REAL NULL,
	aged_65_older REAL NULL,
	aged_70_older REAL NULL,
	gdp_per_capita REAL NULL,
	extreme_poverty VARCHAR(50) NULL,
	cardiovasc_death_rate REAL NULL,
	diabetes_prevalence REAL NULL,
	female_smokers VARCHAR(50) NULL,
	male_smokers VARCHAR(50) NULL,
	handwashing_facilities REAL NULL,
	hospital_beds_per_thousand REAL NULL,
	life_expectancy REAL NULL,
	human_development_index REAL NULL,
	population REAL NULL,
	excess_mortality_cumulative_absolute VARCHAR(50) NULL,
	excess_mortality_cumulative VARCHAR(50) NULL,
	excess_mortality VARCHAR(50) NULL,
	excess_mortality_cumulative_per_million VARCHAR(50) NULL
);

-- Second table
CREATE TABLE portfolio.covidVaccinations (
	iso_code VARCHAR(50) NULL,
	continent VARCHAR(50) NULL,
	location VARCHAR(50) NULL,
	`date` VARCHAR(50) NULL,
	population REAL NULL,
	new_cases REAL NULL,
	new_cases_smoothed BIGINT NULL,
	total_deaths REAL NULL,
	new_deaths REAL NULL,
	new_deaths_smoothed BIGINT NULL,
	total_cases_per_million BIGINT NULL,
	new_cases_per_million BIGINT NULL,
	new_cases_smoothed_per_million BIGINT NULL,
	total_deaths_per_million BIGINT NULL,
	new_deaths_per_million BIGINT NULL,
	new_deaths_smoothed_per_million BIGINT NULL,
	reproduction_rate REAL NULL,
	icu_patients VARCHAR(50) NULL,
	icu_patients_per_million VARCHAR(50) NULL,
	hosp_patients VARCHAR(50) NULL,
	hosp_patients_per_million VARCHAR(50) NULL,
	weekly_icu_admissions VARCHAR(50) NULL,
	weekly_icu_admissions_per_million VARCHAR(50) NULL,
	weekly_hosp_admissions VARCHAR(50) NULL,
	weekly_hosp_admissions_per_million VARCHAR(50) NULL,
	total_tests VARCHAR(50) NULL,
	new_tests VARCHAR(50) NULL,
	total_tests_per_thousand VARCHAR(50) NULL,
	new_tests_per_thousand VARCHAR(50) NULL,
	new_tests_smoothed VARCHAR(50) NULL,
	new_tests_smoothed_per_thousand VARCHAR(50) NULL,
	positive_rate VARCHAR(50) NULL,
	tests_per_case VARCHAR(50) NULL,
	tests_units VARCHAR(50) NULL,
	total_vaccinations VARCHAR(50) NULL,
	people_vaccinated VARCHAR(50) NULL,
	people_fully_vaccinated VARCHAR(50) NULL,
	total_boosters VARCHAR(50) NULL,
	new_vaccinations VARCHAR(50) NULL,
	new_vaccinations_smoothed VARCHAR(50) NULL,
	total_vaccinations_per_hundred VARCHAR(50) NULL,
	people_vaccinated_per_hundred VARCHAR(50) NULL,
	people_fully_vaccinated_per_hundred VARCHAR(50) NULL,
	total_boosters_per_hundred VARCHAR(50) NULL,
	new_vaccinations_smoothed_per_million VARCHAR(50) NULL,
	new_people_vaccinated_smoothed VARCHAR(50) NULL,
	new_people_vaccinated_smoothed_per_hundred VARCHAR(50) NULL,
	stringency_index REAL NULL,
	Column49 VARCHAR(50) NULL,
	population_density INTEGER NULL,
	median_age REAL NULL,
	aged_65_older INTEGER NULL,
	aged_70_older INTEGER NULL,
	gdp_per_capita INTEGER NULL,
	extreme_poverty VARCHAR(50) NULL,
	cardiovasc_death_rate INTEGER NULL,
	diabetes_prevalence REAL NULL,
	female_smokers VARCHAR(50) NULL,
	male_smokers VARCHAR(50) NULL,
	handwashing_facilities INTEGER NULL,
	hospital_beds_per_thousand REAL NULL,
	life_expectancy REAL NULL,
	human_development_index INTEGER NULL,
	excess_mortality_cumulative_absolute VARCHAR(50) NULL,
	excess_mortality_cumulative VARCHAR(50) NULL,
	excess_mortality VARCHAR(50) NULL,
	excess_mortality_cumulative_per_million VARCHAR(50) NULL
)
-- ---------- 

SELECT *
FROM portfolio.owid_covid_data ocd 
WHERE continent IS NOT NULL 
ORDER BY 3,4;

-- Select Data that we are going to be starting with
SELECT Location, date, total_cases_per_million , new_cases, total_deaths, population
FROM portfolio.owid_covid_data ocd  
WHERE continent IS NOT NULL
ORDER BY 1,2;

-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country
SELECT Location, date, total_cases_per_million ,total_deaths, (total_deaths/total_cases_per_million)*100 as DeathPercentage
FROM portfolio.owid_covid_data ocd 
WHERE location LIKE '%Australia%'
AND continent IS NOT NULL
ORDER BY 1,2;

-- Total Cases vs Population
-- Shows what percentage of population infected with Covid
SELECT Location, date, population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
FROM portfolio.owid_covid_data ocd 
WHERE location LIKE '%states%'
ORDER BY 1,2;

-- Select highest infection rates
SELECT Location, population, MAX(total_cases) as maximumCases,  MAX((total_cases /population))*100 as populationInfected
FROM portfolio.owid_covid_data ocd
-- WHERE location LIKE '%Australia'
GROUP BY location, population  
ORDER BY 1,2 DESC;

-- Select highest cases in Italy
SELECT location, population, MAX(total_cases) as maximumCases, MAX((total_cases/population))*100 AS populationInfected
FROM owid_covid_data ocd 
WHERE location = 'italy'
GROUP BY location, population
ORDER BY 1,2 DESC;

-- Looking at countries with highest infection rate compared to population
SELECT location, population, MAX(total_cases) as maximumCases, MAX((total_cases/population))*100 AS populationInfected
FROM owid_covid_data ocd 
-- WHERE location = 'united states'
GROUP BY location, population
ORDER BY location ASC;

-- Highest death count per population
SELECT location, MAX(total_deaths) as maxDeaths
FROM owid_covid_data ocd 
-- WHERE location = 'italy'
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY 1,2 DESC;

-- Break things down by continent 
SELECT continent , MAX(total_deaths) as maxDeaths
FROM owid_covid_data ocd 
-- WHERE location = 'italy'
WHERE continent IS NOT NULL
GROUP BY continent  
ORDER BY maxDeaths DESC;

SELECT location, MAX(total_deaths) as maxDeaths
FROM owid_covid_data ocd 
-- WHERE location = 'italy'
WHERE continent IS NULL
GROUP BY location 
ORDER BY maxDeaths DESC;

-- Showing continents with highest death count
SELECT continent, MAX(total_deaths) AS totalDeathCount
FROM portfolio.owid_covid_data ocd 
WHERE continent is not NULL 
GROUP BY continent 
ORDER BY totalDeathCount DESC;

-- GLOBAL NUMBERS
SELECT date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM portfolio.owid_covid_data ocd 
-- WHERE location LIKE '%Australia%'
WHERE continent IS NOT NULL
GROUP BY date, total_cases, total_deaths, DeathPercentage 
ORDER BY 1,2;

--- 
SELECT date, SUM(new_cases) AS totalCases, SUM(new_deaths) AS totalDeaths, SUM(new_deaths)/SUM(new_cases)*100 AS deathPercentage
FROM portfolio.owid_covid_data ocd 
-- WHERE location like "%brazil%"
WHERE continent IS NOT NULL
-- GROUP BY date
ORDER BY 1, 2;

SELECT SUM(new_cases) AS totalCases, SUM(new_deaths) AS totalDeaths, SUM(new_deaths)/SUM(new_cases)*100 AS deathPercentage
FROM portfolio.owid_covid_data ocd 
-- WHERE location like "%brazil%"
WHERE continent IS NOT NULL
-- GROUP BY date
ORDER BY 1, 2;

--- Most important query so far

-- Population vs Vaccinations
SELECT vd.continent, vd.location, vd.date, vd.population, vcd.new_vaccinations
, SUM(vcd.new_vaccinations) OVER (PARTITION BY vd.location ORDER BY vd.location,
vd.date)AS Summing 
FROM portfolio.owid_covid_data vd 
JOIN portfolio.covidVaccinations vcd 
	ON vd.location = vcd.location 
	AND vd.date = vcd.date
WHERE vd.continent IS NOT NULL 
ORDER BY 2, 3;

-- CTE TABLE IMPORTANT!

WITH pplVsVax (continent, location , date, population, new_vaccinations, RollingVax) 
AS
(
SELECT vd.continent, vd.location, vd.date, vd.population, vcd.new_vaccinations
, SUM(vcd.new_vaccinations) OVER (PARTITION BY vd.location ORDER BY vd.location,
vd.date)AS RollingVax
FROM portfolio.owid_covid_data vd 
JOIN portfolio.covidVaccinations vcd 
	ON vd.location = vcd.location 
	AND vd.date = vcd.date
WHERE vd.location = "united states"
ORDER BY 2, 3
)
SELECT *, (RollingVax/Population)*100 AS BIG_QUERY
FROM pplVsVax

-- TEMP TABLE
DROP TABLE PPLVAXED;

CREATE temporary TABLE PPLVAXED
(
continent VARCHAR(225),
location VARCHAR(225),
date datetime,
population numeric,
new_vaccinations VARCHAR(250),
RollingVax numeric
);

INSERT INTO PPLVAXED
SELECT vd.continent, vd.location, vd.date, vd.population, vcd.new_vaccinations
, SUM(vcd.new_vaccinations) OVER (PARTITION BY vd.location ORDER BY vd.location,
vd.date)AS RollingVax
FROM portfolio.owid_covid_data vd 
JOIN portfolio.covidVaccinations vcd 
	ON vd.location = vcd.location 
	AND vd.date = vcd.date
WHERE vd.location = "united states"
ORDER BY 2, 3;

SELECT *, (RollingVax/Population)*100 AS BIG_QUERY
FROM PPLVAXED; 

/* --

Tables within this comment line are stated above already, these are test queries:

SELECT vd.continent, vd.location, vd.date, vd.population, vcd.new_vaccinations
, SUM(vcd.new_vaccinations) OVER (PARTITION BY vd.location ORDER BY vd.location,
vd.date)AS Summing 
FROM portfolio.owid_covid_data vd 
JOIN portfolio.covidVaccinations vcd 
	ON vd.location = vcd.location 
	AND vd.date = vcd.date
WHERE vd.continent IS NOT NULL 
ORDER BY 2, 3;

CREATE VIEW percentPopulationVaxed as
SELECT vd.continent, vd.location, vd.date, vd.population, vcd.new_vaccinations
, SUM(vcd.new_vaccinations) OVER (PARTITION BY vd.location ORDER BY vd.location,
vd.date)AS RollingVax
FROM portfolio.owid_covid_data vd 
JOIN portfolio.covidVaccinations vcd 
	ON vd.location = vcd.location 
	AND vd.date = vcd.date
WHERE vd.location = "united states"
ORDER BY 2, 3;

 -- */

