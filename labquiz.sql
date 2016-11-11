-- C4332 Lab Quiz (compulsory lab) 
-- Written by: Adriana Rios
-- default column statements here for pretty output
column taster format a15;
column beer format a25;
column brewer format a25;
column rating format 99;
create or replace view MyVeryOwnAllRatings(taster,beer,brewer,rating)
as
SELECT 
	taster.given || ' ' || taster.family as taster,
	beer.name as beer,
	brewer.name as brewer,
	ratings.score as rating
FROM taster, beer, brewer, ratings
WHERE taster.id = ratings.taster
AND beer.id = ratings.beer
AND brewer.id = beer.brewer
ORDER BY taster.family asc, ratings.score desc
;
create or replace view MyVeryOwnFavoriteBeer(beer,brewer)
as
SELECT beer, brewer
FROM myveryownallratings
WHERE rating = (
	SELECT MAX(rating) 
	FROM myveryownallratings
	WHERE taster = 'Jeff Ullman' 
)
AND taster = 'Jeff Ullman'
;
create or replace view MyVeryOwnTopRatedBeer(beer,score)
as
SELECT beer, rating as score
FROM myveryownallratings
WHERE rating = (
	SELECT MAX(rating) from myveryownallratings
)
;
create or replace view MyLowestRating(brewer,lowestrating)
as
SELECT brewer, MIN(rating) 
FROM myveryownallratings
GROUP BY brewer
;
---Bonus question
create or replace view MyFirstAndSecondTopRatedBeer(beer, score) 
as 
SELECT beer, rating AS score
FROM myveryownallratings 
WHERE rating = (
	SELECT MAX(rating) 
	FROM myveryownallratings
	WHERE rating < (
		SELECT MAX(rating)
		FROM myveryownallratings
	)
)
UNION
SELECT * from myveryowntopratedbeer 
/
