SELECT h.hacker_id, h.name, COUNT(c.challenge_id)
FROM hackers h 
JOIN challenges c
ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING 
COUNT(c.challenge_id) = (SELECT MAX(COUNT(c1.challenge_id)) 
FROM challenges c1
GROUP BY c1.hacker_id)
OR COUNT(c.challenge_id) IN (SELECT c_count AS c_unique
FROM (SELECT h2.hacker_id, h2.name, COUNT(c2.challenge_id) AS c_count
FROM hackers h2 
JOIN challenges c2
ON h2.hacker_id = c2.hacker_id
GROUP BY h2.hacker_id, h2.name)
GROUP BY c_count
HAVING COUNT(c_count)=1)
ORDER BY COUNT(c.challenge_id) DESC, h.hacker_id;
