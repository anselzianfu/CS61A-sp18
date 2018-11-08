CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size
      from dogs, sizes
      where dogs.height>sizes.min and dogs.height<=sizes.max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_height AS
  SELECT child from dogs, parents where name = parent order by height desc;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child as name1, b.child as name2 from parents as a, parents as b where a.parent = b.parent and a.child < b.child;


-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT name1 || ' and ' || name2 || ' are ' || size1.size || ' siblings'
  from siblings,size_of_dogs as size1, size_of_dogs as size2
  where name1 = size1.name and name2 = size2.name and size1.size = size2.size;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here



CREATE TABLE stacks AS
  SELECT a.name||', ' ||b.name||', '||c.name||', '||d.name , a.height+b.height+c.height+d.height
  from dogs as a, dogs as b, dogs as c, dogs as d
  where a.height<b.height and b.height <c.height and c.height<d.height and (a.height+b.height+c.height+d.height) > 170
  order by (a.height+b.height+c.height+d.height) ASC;
