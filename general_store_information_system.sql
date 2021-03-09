DROP DATABASE IF EXISTS `general_store_information`;
CREATE DATABASE `general_store_information`; 
USE `general_store_information`;

CREATE TABLE items (
item_no INT AUTO_INCREMENT PRIMARY KEY,
item_id VARCHAR(50) UNIQUE,
item_name VARCHAR(50),
manufacturer_name VARCHAR(50),
item_rate FLOAT,
selling_price FLOAT,
item_description VARCHAR(50)
);

INSERT INTO items (item_id,item_name,manufacturer_name,item_rate,selling_price,item_description)
VALUES ('i001','lux_soap','lux_company','15.67','20.43','soap'),
('i002','copy','royal_notebook','14.80','16.40','copy'),
('i003','goodday_biscuit','britania_stores','2218.80','2220.40','biscuit'),
('i004','reynolds_pen','pen_parker','2015.67','2120.43','pen'),
('i005','sql_books','book_bpb',' 5104.80','5116.40','book'),
('i006','tata_steel','tata_sons','5118.80','5120.40','tata'),
('i007','seagate_hdd','hp_world','5104.80','5116.40','HDD1034'),
('i008','dvd_writer','moserbear_org','5118.80','5120.40','DVDRW');

CREATE TABLE customers (
customer_no INT AUTO_INCREMENT PRIMARY KEY,
customer_id VARCHAR(50) UNIQUE,
customer_name VARCHAR(50),
address VARCHAR(255),
city VARCHAR(50),
pin INT,
state VARCHAR(50), 
bal_due FLOAT);

INSERT INTO customers (customer_id,customer_name,address,city,pin,state,bal_due)
VALUES ('cu01001','alak roy','b.d.para','patna','800015','Bihar','0'),
('cu01002','suman roy','puk para','patna','800132','Bihar','2390.9'),
('cu01004','priya das','chora para','Gaya','800010','Bihar','1390.9'),
('cu01005','rina raj','kamal para','patna','800001','Bihar','0'),
('cu01006','pulak roy','bircity','lucknow','226012','uttar pradesh','110.9'),
('cu01007','priyanka das','nappam','lucknow','226005','uttar pradesh','190.9'),
('cu01008','kusum roy','Jhalwa','allahabad','211012','uttar pradesh','110.9'),
('cu01009','mina das','naini','allahabad','211078','uttar pradesh','0'),
('cu01003','nidhi mishra','naini','allahabad','212079','uttar pradesh','9990.9'),
('cu01010','kamal yadav','naini','allahabad','211037','uttar pradesh','2990.9');

CREATE TABLE salesman(
salesman_no INT AUTO_INCREMENT PRIMARY KEY,
salesman_id VARCHAR(50),
salesman_name VARCHAR(50),
address VARCHAR(255),
city VARCHAR(50),
pin INT,
state VARCHAR(50),
salary FLOAT);

INSERT INTO salesman(salesman_id,salesman_name,address,city,pin,state,salary)
VALUES ('s001','rohan singh','rajapur','allahabad','212098','uttar pradesh','8000'),
('s002','rohan singh','naini','allahabad ','212096',' uttar pradesh','9800'),
('s003','smita roy','indira nagar','lucknow','226078','uttar pradesh','3400'),
('s004','kabir bora','vikas nagar','lucknow','226045','uttar pradesh','6700'),
('s005','neha singh','gomti nagar','lucknow','226032','uttar pradesh','9600'),
('s006','priya agarwal','gandhi road','32 district','799750','delhi','9900'),
('s007','ashok paul','filmcity','munnabari','799740','mumbai','8900');

CREATE TABLE sales_order(
sales_order_no VARCHAR(50),
sales_order_date VARCHAR(50),
cust_id VARCHAR(50),
salesman_id VARCHAR(50),
bill_payby_party VARCHAR(50),
delivery_date VARCHAR(50),
item_rate VARCHAR(50),
tot_quantity_order INT,
cancel_date VARCHAR(50));

INSERT INTO sales_order (sales_order_no,sales_order_date,cust_id,salesman_id,bill_payby_party,delivery_date,item_rate,tot_quantity_order,cancel_date)
VALUES ('son01001', '01-aug-2008', 'cu01001', 's001', 'yes', '20-aug-2008', '2220.40', 50, 'null'),
('son01002', '12-aug-2008', 'cu01004', 's001', 'yes', '23-aug-2008', '2220.40', 15, 'null'),
('son01003', '12-aug-2008', 'cu01005', 's002', 'yes', '26-aug-2008', '2220.40', 10, 'null'),
('son01004', '13-aug-2008', 'cu01004', 's001', 'yes', '20-aug-2008', '2220.40', 15, 'null'),
('son01005', '14-aug-2008', 'cu01002', 's002', 'no', '30-aug-2008', '2220.40', 52, '28-march-2008'),
('son01006', '15-aug-2008', 'cu01001', 's001', 'yes', '31-aug-2008', '2220.40', 43, 'null'),
('son01007', '16-aug-2008', 'cu01003', 's004', 'yes', '28-aug-2008', '2220.40', 54, 'null'),
('son01008', '16-jan-2008', 'cu01004', 's003', 'yes', '02-aug-2008', '2390.00', 34, 'null'),
('son01009', '01-feb-2008', 'cu01004', 's003', 'no', '28-aug-2008', '8220.40', 54, '18-march-2008');