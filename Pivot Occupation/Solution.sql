/* 
pivots the data based on the assigned row numbers,So checks if the occupation is 'Doctor, Professor,Singer, Actor'.
If it is, it returns the name; otherwise, it returns NULL. The MAX function ensures that only the name with 
the highest row number (i.e., the last name alphabetically) is displayed for each occupation in each row.
*/

SELECT
Max(CASE WHEN occupation = 'Doctor' THEN name end) as doctor,
Max(CASE WHEN occupation = 'Professor' THEN name end) as professor,
Max(CASE WHEN occupation = 'Singer' THEN name end) as Singer,
Max(CASE WHEN occupation = 'Actor' THEN name end) as Actor
FROM 
    (
        /* 
        - In this subquery need to assign a unique row number 
            to each name within occupation by:
                * selecting all columns from the 'occupations' table
                * using Windows function to assign sequential number to each row within partition of occupation 
        */
        select 
            o.*,
            ROW_NUMBER() over (partition by occupation order by name) as rn 
        from occupations o
    ) as sub
    
    group  by rn;