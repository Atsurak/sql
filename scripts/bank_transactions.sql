DROP DATABASE IF EXISTS `bank_transactions`;
CREATE DATABASE `bank_transactions`; 
USE `bank_transactions`;

CREATE TABLE customer_table (
Customer_name VARCHAR(40),
Customer_street VARCHAR(40),
Customer_city VARCHAR(40));
INSERT INTO customer_table(Customer_name,Customer_street,Customer_city)
VALUES ('Adams','Spring','Pittsfield'),
('Brooks','Senator','Brooklyn'),
('Curry','North','Rye'),
('Glenn','Sand Hill','Woodside'),
('Hayes','Main','Harrison'),
('Green','Walnut','Stamford'),
('Johnson','Alma','Palo Alto'),
('Jones','Main','Harrison'),
('Lindsay','Park','Pittsfield'),
('Smith','North','Rye'),
('Turner','Putnam','Stamford'),
('Williams','Nassau','Princeton');

CREATE TABLE loan_table (Loan_number VARCHAR(40), Branch_name VARCHAR(40), Amount INT);
INSERT INTO loan_table(Loan_number,Branch_name,Amount)
VALUES ('L-11','Round Hill',900),
('L-14','Downtown',1500),
('L-15','Perryridge',1500),
('L-16','Perryridge',1300),
('L-17','Downtown',1000),
('L-23','Redwood',2000),
('L-93','Mianus',500);


CREATE TABLE borrower_table(
Customer_name VARCHAR(50),
Loan_number VARCHAR(50)
);

INSERT INTO borrower_table (Customer_name,Loan_number)
VALUES ('Adams','L-16'),
('Curry','L-93'),
('Hayes','L-15'),
('Jackson','L-14'),
('Jones','L-17'),
('Smith','L-11'),
('Smith','L-23'),
('Williams','L-17');



CREATE TABLE account_table(
Account_number VARCHAR(50),
Branch_name VARCHAR(50),
Balance int
);
INSERT INTO account_table (Account_number,Branch_name,Balance)
VALUES ('A-101','Downtown',500),
('A-215','Mianus',700),
('A-102','Perryridge',400),
('A-305','Round Hill',350),
('A-201','Brighton',900),
('A-222','Redwood',700);

CREATE TABLE depositor_table(
Customer_name VARCHAR(50),
Account_number VARCHAR(50)
);

INSERT INTO depositor_table (Customer_name,Account_number)
VALUES ('Hayes','A-102'),
('Johnson','A-101'),
('Johnson','A-201'),
('Jones','A-217'),
('Lindsay','A-222'),
('Smith','A-215'),
('Turner','A-305');

