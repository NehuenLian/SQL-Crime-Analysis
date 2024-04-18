/* Use Database */
use chicagocrime;

/* General View of the table */
SELECT * FROM chicago_crimes_2008_to_2011;

/* between 2008 and 2009 there were 547 murders registered in Chicago */
SELECT Primary_Type as Type, count(Primary_Type) as Count
FROM chicago_crimes_2008_to_2011
WHERE year != 2010 AND year != 2011
GROUP BY Primary_Type
ORDER BY Count DESC;

/* 179 of those crimes the offender was arrested and 370 there was no arrest */
SELECT Arrest, count(*) as Quantity
FROM chicago_crimes_2008_to_2011
GROUP BY Arrest;

/* in 2008, there were 224 crimes, 54 with successful arrest and 170 without arrest */
SELECT Arrest, count(*) as Quantity
FROM chicago_crimes_2008_to_2011
WHERE Year = 2008
GROUP BY Arrest;

/* in 2009, there were 323 crimes, 125 with successful arrest and 198 without arrest */
SELECT Arrest, count(*) as Quantity
FROM chicago_crimes_2008_to_2011
WHERE Year = 2009
GROUP BY Arrest;

/* in 2008, these could be the 10 most dangerous areas, considering the number of crimes in each one. */
SELECT Primary_Type, count(Community_Area) as Crimes, Community_Area
FROM chicago_crimes_2008_to_2011
WHERE Year = 2008
GROUP BY Primary_Type, Community_Area
ORDER BY Crimes desc
LIMIT 10;

/* in 2009, these could be the 10 most dangerous areas, considering the number of crimes in each one, and they are all homicides. */
SELECT Primary_Type, Arrest, count(Arrest) Quantity_Arrests
FROM chicago_crimes_2008_to_2011
WHERE year = 2009
GROUP BY Primary_Type, Arrest
ORDER BY Quantity_Arrests DESC;

/* these are the details of the arrests made and not made in 2008 */
SELECT Primary_Type, Arrest, count(Arrest) Quantity_Arrests
FROM chicago_crimes_2008_to_2011
WHERE year = 2008
GROUP BY Primary_Type, Arrest
ORDER BY Quantity_Arrests DESC;

/* these are the details of the arrests made and not made in 2009 */
SELECT Primary_Type, Arrest, count(Arrest) Quantity_Arrests
FROM chicago_crimes_2008_to_2011
WHERE year = 2009
GROUP BY Primary_Type, Arrest
ORDER BY Quantity_Arrests DESC;