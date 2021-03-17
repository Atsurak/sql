drop database if exists `restaurant`;
create database `restaurant`;
use `restaurant`;

create table `persons`(
p_id INT AUTO_INCREMENT PRIMARY KEY,
lastname VARCHAR(20),
firstname VARCHAR(20),
address VARCHAR(50),
city VARCHAR(20)
);

CREATE TABLE `orders`(
o_id INT AUTO_INCREMENT PRIMARY KEY,
orderno INT ,
p_id INT
);

INSERT INTO persons (lastname,firstname,address,city)
VALUES ('Hansen','Ola','Timotevin 10','Sandnes'),
('Svendson','Tove','Borgvn 23','Sandnes'),
('Pettersen','Kari','Storgt 20','Stavanger'),
('smith','eric','thesaint 14','cancan'),
('John','fins' , 'storgt 20','Stavanger');

INSERT INTO orders(orderno,P_Id)
VALUES ('693252','2'),
('856289','4'),
('573962','1'),
('141414','3'),
('545322','7'),
('514143','6'),
('542522','2'),
('572965','1'),
('756802','11'),
('141351','3');



SELECT orders.o_id, persons.lastname, persons.firstname FROM persons
INNER JOIN orders
ON persons.p_id = orders.p_id;

SELECT persons.lastname, persons.firstname, orders.o_id FROM persons
LEFT JOIN orders
ON persons.p_id = orders.p_id;

SELECT orders.o_id, persons.lastname, persons.firstname FROM persons
RIGHT JOIN orders
ON persons.p_id = orders.p_id;