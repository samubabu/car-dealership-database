CREATE TABLE salesperson (
  salesperson_id SERIAL PRIMARY KEY,
  first_name varchar(50) NOT null,
  last_name varchar(50) NOT null
);

INSERT INTO salesperson values(
	1,
	'Michael',
	'Wayne'
);

UPDATE salesperson
SET last_name ='Scott'
WHERE salesperson_id =1;


INSERT INTO salesperson VALUES(
	2,
	'Alan',
	'Johnson'
), (3,
	'Jeremy',
	'Melvin'
);



CREATE TABLE "Car" (
  car_id serial PRIMARY KEY,
  make varchar(20),
  model varchar(20),
  year_ integer,
  color varchar(10),
  "sale_car?" boolean,
  "service_car?" boolean
);

INSERT INTO "Car" values(
	1,
	'Toyota',
	'4runner',
	2020,
	'black',
	TRUE,
	FALSE
), (2,
	'Toyota',
	'Prius',
	2022,
	'silver',
	FALSE,
	TRUE
);


ALTER TABLE "Car"
RENAME TO Cars;


	

CREATE TABLE customer (
  customer_id serial PRIMARY key,
  first_name varchar(50),
  last_name varchar(50),
  phone_number integer,
  address varchar (90),
  city varchar(20),
  state varchar(10),
  Country varchar (20),
  Postal_code integer
);

INSERT INTO customer VALUES(
	1,
	'Alan',
	'Lands',
	654-987-7890,
	'124 Omg St.',
	'Chicago',
	'IL',
	'USA',
	'60607'),
	(2,
	'Brad',
	'Avis',
	123-567-0987,
	'908 Real St.',
	'Chicago',
	'IL',
	'USA',
	'60606');



ALTER TABLE customer
ALTER COLUMN phone_number TYPE varchar(13);



CREATE TABLE salesInvoice (
  invoice_id serial PRIMARY key,
  "invoice_no." integer,
  car_id serial,
  FOREIGN KEY(car_id) REFERENCES "Car"(car_id),
  customer_id serial,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
  salesperson_id serial,
  FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)
);

INSERT INTO salesInvoice values(
	1,
	2345,
	1,
	1,
	1);

INSERT INTO salesInvoice values(
	2,
	2346,
	1,
	2,
	1);
SELECT *
FROM salesInvoice;
	


CREATE TABLE Service(
  service_ticket_id serial PRIMARY key,
  service_ticket_num integer,
  car_id serial,
  FOREIGN KEY(car_id) REFERENCES "Car"(car_id),
  customer_id serial,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
  date_recieved timestamp,
  date_returned timestamp  
);

INSERT INTO Service VALUES (
	1,
	90821950,
	2,
	2,
	'2022-05-07 10:41:37',
	'2022-05-08 10:41:37');

INSERT INTO service VALUES(
	2,
	89078967,
	1,
	1,
	'2022-05-07 08:30:56',
	'2022-05-09 12:21:37'), (
	3,
	908897675,
	2,
	2,
	'2022-06-07 11:01:07',
	'2022-06-08 09:41:17');





CREATE TABLE mechanic (
  mechanic_id serial PRIMARY KEY,
  first_name varchar(50),
  last_name varchar(50)
);

INSERT INTO mechanic values(
	1,
	'Valerie',
	'Hoffman'),(
	2,
	'Dwight',
	'Johnson'),(
	3,
	'John',
	'Smith'),(
	4,
	'Jane',
	'Smith');

CREATE TABLE service_items (
  service_item serial PRIMARY key,
  service_name varchar(50),
  hourly_rate integer
);

INSERT INTO service_items VALUES (
	1,
	'oil change',
	30),(
	2,
	'brake pad change',
	80),(
	3,
	'alternator trouble',
	100),(
	4,
	'engine tuneup',
	110),(
	5,
	'spark plug replace',
	50);


	

CREATE TABLE Repair_Service_log (
  servicelog_id serial PRIMARY key,
  service_ticket_id integer,
  FOREIGN KEY(service_ticket_id) REFERENCES Service(service_ticket_id),
  service_item serial,
  FOREIGN KEY(service_item) REFERENCES service_items(service_item),
  mechanic_id serial,
  FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
  hours_worked integer,
  comments_ varchar(90)
);

INSERT INTO Repair_Service_log values(
	1,
	2,
	5,
	4,
	3,
	'new spark plug installed'),(
	2,
	3,
	4,
	2,
	3,
	'engine leak-need further inspection'),(
	3,
	3,
	3,
	1,
	1,
	'bad battery, recommend replacement');


CREATE OR REPLACE PROCEDURE add_customers(
	first_name varchar (50),
	last_name varchar (50))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customer(first_name,last_name)
	values(first_name, last_name, NOW());
END
$$

CALL add_customers ('Robert','Snaidauf');



DROP FUNCTION IF EXISTS add_customers;






CREATE OR REPLACE PROCEDURE GetServiceHist

AS $$

BEGIN

SET NOCOUNT ON

SELECT Car.car_id, c.make, c.make, Repair_Service_log.Repair_Service_log  FROM 

Car

INNER JOIN Repair_Service_log ON Car.car_id=Repair_Service_log.car_id

END
$$

CALL GetServiceHist;



CREATE OR REPLACE PROCEDURE add_cars(
  car_id serial
  make varchar(20),
  model varchar(20),
  year_ integer,
  color varchar(10),
  "sale_car?" boolean,
  "service_car?" boolean
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO Cars(
  car_id serial,
  make varchar(20),
  model varchar(20),
  year_ integer,
  color varchar(10),
  "sale_car?" boolean,
  "service_car?" boolean
)
values(
  car_id serial,
  make varchar(20),
  model varchar(20),
  year_ integer,
  color varchar(10),
  "sale_car?" boolean,
  "service_car?" boolean
);
END
$$

CALL add_cars(3,'Toyota','RAVA',2021,'red', true, false);






