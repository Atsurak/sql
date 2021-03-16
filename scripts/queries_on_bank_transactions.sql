-- DBMS LAB Assignment 
-- IIT2019062
-- Based on Databases Created during first Lab Assignment


/* 1 */
SELECT borrower_table.customer_name,loan_table.Loan_number
FROM borrower_table
INNER JOIN loan_table
ON borrower_table.Loan_number = loan_table.Loan_number
WHERE loan_table.Branch_name = 'Perryridge'
ORDER BY customer_name;


/* 2 */
SELECT SUM(Amount)
FROM loan_table
WHERE Branch_name LIKE 'R%';

/* 3 */
SELECT DISTINCT depositor_table.Customer_name,account_table.balance
FROM depositor_table,account_table
WHERE account_table.Account_number = depositor_table.Account_number
ORDER BY Balance desc
LIMIT 1;

/* 4 */
SELECT DISTINCT depositor_table.Customer_name,account_table.balance
FROM depositor_table,account_table
WHERE account_table.Account_number = depositor_table.Account_number
ORDER BY Balance desc
LIMIT 1,1
;

/* 5 */
SELECT DISTINCT depositor_table.Customer_name,account_table.balance
FROM depositor_table,account_table
WHERE account_table.Account_number = depositor_table.Account_number
ORDER BY Balance
LIMIT 3;

/* 6 */
ALTER TABLE customer_table 
ADD id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

SELECT id, Customer_name  AS "Even Customer"
FROM customer_table
WHERE (id % 2) = 0;

SELECT id, Customer_name  AS "ODD Customer"
FROM customer_table
WHERE (id % 2) = 1;

/*7*/
SELECT * FROM loan_table
LIMIT n-1,1;

/* 8 */
	-- a 
    SELECT Customer_name
    FROM depositor_table
	UNION
	SELECT Customer_name
	FROM borrower_table;
    -- b
    SELECT DISTINCT Customer_name
    FROM depositor_table
	WHERE Customer_name IN (
	SELECT Customer_name FROM borrower_table);
    /* INTERSECT not supported in mysql */
    SELECT DISTINCT
		Customer_name
	FROM depositor_table
		INNER JOIN borrower_table USING(Customer_name);
    -- c
    SELECT Customer_name
    FROM depositor_table
	EXCEPT
	SELECT Customer_name
	FROM borrower_table;

/* 9 */
	-- a
    SELECT Branch_name, COUNT(DISTINCT Customer_name)
	FROM depositor_table, account_table
	WHERE depositor_table.account_number = account_table.account_number
	GROUP BY branch_name;
    -- b
    SELECT Branch_name, AVG(balance)
    FROM account_table
	GROUP BY branch_name
	HAVING AVG(balance) > 1200;
    -- c
    SELECT Branch_name AS bank_name, COUNT(DISTINCT customer_name)
	FROM depositor_table, account_table
	WHERE depositor_table.account_number = account_table.account_number
	GROUP BY branch_name;

/* 10 */
	-- a
    SELECT Customer_name, Balance
	FROM depositor_table, account_table
	WHERE depositor_table.Account_number = account_table.Account_number
	AND Balance < (SELECT AVG(Balance) FROM account_table);
    -- b
    SELECT DISTINCT customer_name FROM depositor_table
	INNER JOIN borrower_table USING (Customer_name);
    -- c
    SELECT Customer_name
	FROM account_table
	NATURAL JOIN depositor_table
	WHERE Branch_name = "Round%"
	GROUP BY Customer_name
	HAVING COUNT(Account_number) >= 2;

/* 11 */
	-- a
    SELECT RPAD(customer_table.customer_name, 30, "Less Balance") AS 'Right Pad Customer Name'
	FROM customer_table,account_table,depositor_table
    WHERE customer_table.Customer_name = depositor_table.Customer_name AND account_table.Account_number = depositor_table.Account_number;
    -- b
    SET foreign_key_checks=0;
	UPDATE bank_transactions.account_table SET Account_number = '101' WHERE  Account_number='A-101';
	UPDATE bank_transactions.depositor_table
	SET Account_number = '101' WHERE Account_number='A-101';
    -- c
    UPDATE bank_transactions.customer_table
	SET customer_name = CONCAT(UPPER(LEFT(customer_name, 1)), SUBSTRING(customer_name, 2));
	SELECT customer_name from bank_transactions.customer_table;
    -- d
    SET @s = CONVERT('DBMS lab' USING latin1);
	SELECT CHAR_LENGTH(@s);
    -- e
    SELECT substring(customer_name,2,3) AS Substring FROM bank_transactions.customer_table;
    -- f
    SELECT LEFT(customer_name,1) AS first_letter, RIGHT(customer_name,1) AS last_letter FROM bank_transactions.customer_table;
    -- g
    SELECT customer_name, customer_street FROM bank_transactions.customer_table WHERE CHAR_LENGTH(CONVERT(customer_name  USING latin1))=CHAR_LENGTH(CONVERT(customer_street USING latin1));
    
    
/*12*/
    -- a
	SELECT TIMESTAMPDIFF(MONTH, "2012-04-12" , SYSDATE());
	-- b 
	SELECT 4*4+5;
	-- c 
	SELECT DATE_ADD(sysdate(), INTERVAL 5 MONTH);
	-- d 
	SELECT date(now() + INTERVAL 10 - weekday(now()) DAY) as next_wednesday;
	-- e 
	SELECT USER(),CURRENT_USER();