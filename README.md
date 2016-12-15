# sql_queries

Find out who made what ratings.
If you look at the Ratings table, you'll see that it contains just a bunch of numbers. This is good for being compact, but hard to work out what it all means for users. Write an SQL query that will put together the data from the Ratings table with the Taster and Beer tables so that you get a better idea of who rated which beer. The result should display the taster's name (given and family names, separated by a single space. Use the string concatenation operator || to join two strings together), along with the name of the beer, its brewer and the rating. The table should be sorted by the tasters' family names; for a given taster, sort in de-creasing order of rating (i.e. highest-rated beer first).

Place your query into a view definition like this:

    create or replace view MyVeryOwnAllRatings(taster,beer,brewer,rating) AS
Note that the attributes to the view definitions supply names for whatever values appear in the select clause of the SQL query. If you want to think of the view as a virtual table, then these represent the names of the attributes of that table.
When you run the view with the following column format statements, you should see output that looks like this:

    sql> column taster format a15;
    sql> column beer format a25;
    sql> column brewer format a25;
    sql> column rating format 99;
    sql> select * from MyVeryOwnAllRatings ;
         taster      |          beer          |          brewer          | rating 
    -----------------+------------------------+--------------------------+--------

     Sarah Claughton | Victoria Bitter        | Carlton and United       |      5
     Sarah Claughton | Burragorang Bock       | Scharer's Little Brewery |      4
     Sarah Claughton | Old                    | Toohey's                 |      3
     Sarah Claughton | Scharer's Lager        | Scharer's Little Brewery |      3
     Sarah Claughton | James Squire Amber Ale | Maltshovel Brewery       |      3
     Sarah Claughton | James Squire Pilsener  | Maltshovel Brewery       |      3
     Sarah Claughton | New                    | Toohey's                 |      2
     John Shepherd   | Sierra Nevada Pale Ale | Sierra Nevada            |      5
     John Shepherd   | Burragorang Bock       | Scharer's Little Brewery |      4
     John Shepherd   | Rasputin               | North Coast Brewing      |      4
     John Shepherd   | 80/-                   | Calendonian Brewing      |      4
     John Shepherd   | Empire                 | Carlton and United       |      3
     John Shepherd   | Chimay Red             | Chimay                   |      3
     John Shepherd   | James Squire Amber Ale | Maltshovel Brewery       |      3
     John Shepherd   | James Squire Pilsener  | Maltshovel Brewery       |      3
     John Shepherd   | Victoria Bitter        | Carlton and United       |      1
     Jeff Ullman     | Sierra Nevada Pale Ale | Sierra Nevada            |      4
     Jeff Ullman     | Burragorang Bock       | Scharer's Little Brewery |      3
     Jeff Ullman     | Rasputin               | North Coast Brewing      |      1
     Adam Wiggins    | Old                    | Toohey's                 |      4
     Adam Wiggins    | Victoria Bitter        | Carlton and United       |      1
     Adam Wiggins    | New                    | Toohey's                 |      1
    (22 rows)
Find out what is Jeff Ullman's favorite beer.
Clearly, you can work out the answer to this once you've solved the query above. However, try to write a query that returns the name of the beer(s) and brewer(s) for the beer(s) that Jeff Ullman rated highest.

Place your query into a view definition like this:

    create or replace view MyVeryOwnFavoriteBeer(beer,brewer) AS
When you invoke the view, you should see output that looks like this:
     select * from MyVeryOwnFavoriteBeer ;
              beer          |    brewer     
    ------------------------+---------------
     Sierra Nevada Pale Ale | Sierra Nevada
    (1 row)
(Note: You can use the view from the previous question in defining this query if you absolutely have to).
Find the beer that had the top rating (Hint: This involves the use of subquery). To produce the most general solution to this query, you should not hardwire the actual rating in the query. For example, the brewer might introduce '6' as the highest score a month later or use a different rating scheme.
Place your query into a view definition like this:

   create or replace view MyVeryOwnTopRatedBeer (beer,score) AS
When you invoke the view, you should see output that looks like this:
     select * from MyVeryOwnTopRatedBeer; 
             BEER                           SCORE
             ------------------------- ----------
             Victoria Bitter                    5
             Sierra Nevada Pale Ale             5

             2 rows selected.

For each brewer, list the rating of the lowest rated beer?
Place your query into a view definition like this:

   create or replace view MyLowestRating (brewer, LowestRating) AS
     your query
When you invoke the view, you should see output that looks like this:
   select * from MyLowestRating; 

brewer                                               LowestRating 
-------------------------------------------------- ------------
Toohey's                                                      1
North Coast Brewing                                           1
Scharer Little Brewing                                        3
Calendonian Brewing                                           4
Chimay                                                        3
Sierra Nevada                                                 4
Carlton and United                                            1
Maltshovel Brewing                                            3

8 rows selected.

Bonus Query. Find the beer that had the top and the second top rating (Hint: This involves the use of subquery and the result of your top rated query). To produce the most general solution to this query, you should not hardwire the actual rating in the query.
Place your query into a view definition like this:

   create or replace view MyTopAndSecondTopRatedBeer (beer, score) AS
     your query
When you invoke the view, you should see output that looks like this:

SQL>  select * from MyFirstAndSecondTopRatedBeer

BEER			       SCORE
------------------------- ----------
Rasputin			   4
80/-				   4
Sierra Nevada Pale Ale		   5
Burragorang Bock		   4
Old				   4
Sierra Nevada Pale Ale		   4
Burragorang Bock		   4
Victoria Bitter 		   5

8 rows selected.

