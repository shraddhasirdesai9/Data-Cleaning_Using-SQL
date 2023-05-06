#---selecting the database to do data cleaning---
use superstore;


#---disables the SQL safe updates mode
SET SQL_SAFE_UPDATES = 0;


#---removing null values and blanks---
DELETE FROM store 
WHERE Discount = '' OR Discount IS NULL;

DELETE FROM store 
WHERE profit = '' OR profit IS NULL;

DELETE FROM store 
WHERE category = '' OR category IS NULL;

DELETE FROM store 
WHERE "sub-category" = '' OR "sub-category" IS NULL;

DELETE FROM store 
WHERE quantity = '' OR quantity IS NULL;


#---data accuracy(updating profit column with correct formula)
UPDATE store
SET profit = sales - (sales * discount);


#---data formatting(having sales representing in dollars currency)
ALTER TABLE store MODIFY COLUMN Sales VARCHAR(20);

UPDATE store
SET Sales = CONCAT('$', Sales);


#---data consistency and accuracy(modifying the data type os discount from text to decimal)
ALTER TABLE store 
MODIFY Discount DECIMAL(3,2);

#---checking the cleaned table 
select * from store;









