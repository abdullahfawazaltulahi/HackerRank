/*
1- First we need to understand what the question and what method
    that we need it.
    - First output look like this : Ashely(P)
        so we know that we have two columns (name,occupation)
        we know that to extract the first letter from the occupation
        we can use LEFT method to take the first letter.
        we know that the first letter should be in enclosed in parentheses
            so we can use CONCAT for the ()
    -Second output look like this : There are a total of 2 doctors.
        so to do that we can use CONCAT for here 
        we write the string, write the count to figure out the number of occupation
        also we use LOWER for lowercase occupation name
 */ 
 
-- query 1
select 
    concat(name, '(',left(occupation,1), ')' )
from occupations
order by name;
-- query 2
select 
    concat ('There are a total of ',count(occupation),' ',lower(occupation),'s.')
from occupations
group by occupation
order by count(occupation),occupation;