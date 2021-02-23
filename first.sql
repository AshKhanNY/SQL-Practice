-- This is a comment!

-- We need the RDBMS to create a database for us to keep all of our relations (tables).
-- We want to name it 'Example', but we may want to edit this file and then run it again.
-- To make sure that we can always edit and rerun, we delete any database named Example
-- that already exists, and then create a new, empty database.
DROP DATABASE IF EXISTS Example;
CREATE DATABASE Example;

-- The "USE" statement just tells the RDBMS that any relation names that appear in our
-- statements and queries can be found in the Example database.
USE Example;
-- Technically we don't need to do this, we could instead use fully qualified names like:
-- SELECT * FROM Example.Phonebook;

-- We know that there is not already a table named Phonebook, because we just created this
-- database, and when we rerun the file then there still won't be a table named Phonebook.
-- But, this is a good practice to get into, and it makes certain debugging tactics more feasible
-- (we will talk more about debugging latter).
DROP TABLE IF EXISTS Phonebook;
CREATE TABLE Phonebook(
    phone VARCHAR(32),
    name VARCHAR(32),
    address VARCHAR(64)
);

-- Insert a record:
INSERT INTO Phonebook
VALUES (
    '+1 555 555 5555',
    'Jane',
    'Somewhere In North America'
);

-- Insert a record using a default value for "address":
INSERT INTO Phonebook(phone, name)
VALUES ('+1 123 456 7890', 'John');

-- Insert several records using a default value for "address":
INSERT INTO Phonebook(phone, name)
VALUES ('+1 111 111 1111', 'Kim'),
       ('+2 222 222 2222', 'Vlad');

-- Make sure to triple check that you have enough commas, semicolons, etc.
-- MySql is NOT your friend when it comes to syntax.

SELECT phone, name, address FROM Phonebook;

-- Tables (and some other sorts of things) are usually stored as files on disk,
-- and these files have names based on the name of the table.
-- This means that if you are on Windows or a Mac OS, table names will be case insensitive,
-- and the following query will work:

-- SELECT phone, name, address FROM phonebook;

-- You should make sure you are consistent in your names when working on such a system,
-- otherwise your code will not be portable.

-- We can rename columns like so:
SELECT phone AS phone_number, name, address FROM Phonebook;

-- We can "pretty print" a relation by putting "\G" at the end of the query:
SELECT phone AS phone_number, name, address FROM Phonebook;

-- We can also print simple messages like so:
SELECT 'Hello World';


-- Note the duplication?  That's because the output is a relation with a single row and column,
-- and by default the column name is the expression.

-- Most expressions can go after a "SELECT":
SELECT 1 + 2 * 3 / 4 - 1;

-- Most "bad" things will just get you a NULL.
SELECT 1/0; -- gives NULL

-- Other things:
SELECT NOW(); -- gets you a timestamp for the current time.

-- You can create and use variables too:
set @a_little_while_ago = NOW();
SELECT @a_little_while_ago;


-- There are many builtin functions and operators.
-- For example, we can add one hour to the current time:
SELECT DATE_ADD(NOW(), INTERVAL 1 HOUR);

-- There is an id associated with each connection to the database (like a pid (process id)).
-- You can see it like so:
SELECT connection_id();

-- And even (if you have permission) terminate it:
KILL CONNECTION_ID();
mysql