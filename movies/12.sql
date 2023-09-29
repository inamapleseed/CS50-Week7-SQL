SELECT title FROM movies
WHERE id IN (SELECT DISTINCT(movies.id) FROM movies
JOIN stars ON stars.movie_id = movies.id
JOIN people ON people.id = stars.person_id
WHERE name = 'Johnny Depp')
AND id IN (SELECT DISTINCT(movies.id) FROM movies
JOIN stars ON stars.movie_id = movies.id
JOIN people ON people.id = stars.person_id
WHERE name = 'Helena Bonham Carter');



