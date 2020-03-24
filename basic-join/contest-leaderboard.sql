SELECT h.hacker_id, h.name, SUM(max_score) AS total_score
FROM hackers h
INNER JOIN (SELECT hacker_id, MAX(submissions.SCORE) AS max_SCORE FROM SUBMISSIONS
GROUP BY hacker_id, challenge_id) MAX_SCORES
ON max_scores.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(max_score)<>0
ORDER BY SUM(max_score) DESC, H.hacker_id;
