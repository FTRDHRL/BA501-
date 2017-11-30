-- select the names of all the actors in the movie 'Death to Smoochy'
SELECT CONCAT(A.first,' ',A.last)
from Actor A, MovieActor B
where B.aid = A.id and B.mid = (SELECT id
                                from Movie
                                where title = 'Death to Smoochy');

-- select the count of all the directors who directed at least 4 movies
SELECT COUNT(id)
FROM Director
WHERE id in (SELECT did
             FROM MovieDirector
             group by did
             HAVING COUNT(mid)>=4);

-- Select the deceased directors' first names with last names, and the date he/she died. 
SELECT CONCAT(A.first,' ',A.last), A.dod
from Director A
where A.dod IS NOT NULL;

-- Select the movie with best rating in 2002 on imDB, showing with its id and title
SELECT id, title
from Movie
where year = 2002 and id in (SELECT mid
             from MovieRating
             WHERE imdb = (SELECT MAX(imdb)
             	           FROM MovieRating));