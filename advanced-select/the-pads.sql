SELECT NAME||'('|| SUBSTR(OCCUPATION,1,1) ||')' FROM OCCUPATIONS ORDER BY NAME ASC;
SELECT 'There are a total of '|| COUNT(*)||' '||LOWER(OCCUPATION)||'s.' FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY COUNT(*) ASC, OCCUPATION ASC;