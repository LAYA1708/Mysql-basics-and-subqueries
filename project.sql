create database project;
use project;
create table salesman (salesman_id int ,name varchar(10),city varchar(10),commission varchar(10));
alter table salesman modify commission decimal(5,2);
insert into salesman(salesman_id, name , city,commission) values (5001,"James Hoog","New York",0.15),(5002,"Nail Knite","Paris",0.13),(5005,"Pit Alex","London",0.11),(5006,"Mc Lyon","Paris",0.14),(5003,"Lauson Hen"," ",0.12),(5007,"Paul Adam","Rome",0.13);
create table customer (customer_id int ,customer_name varchar(10),city varchar(10),grade int,salesman_id int);
insert into customer(customer_id,customer_name , city,grade,salesman_id)values (3005,"Graham","California",200,5002),(3001,"Brad Guran","London",null,null),
(3004,"Fabian ","Paris",300,5006),
(3007,"Brad Davis","New York",200,5001),(3009,"Geoff ","Berlin",100,null),(3008,"Julian","London",300,5002),(3003,"Jozy","Moncow",200,5007);
create table orders(order_id int ,purch_amt decimal(5,2),order_date date,customer_id int,salesman_id int);
insert into orders(order_id,purch_amt,order_date,customer_id,salesman_id)values(70010,193.43,"2016-10-10",3004,5006),(70003,240.4,"2016-10-10",3009,null),(70012,250.45,"2016-06-27",3008,5002),
(70011,75.29,"2016-08-17",3003,5007);
select name, commission from salesman;
select distinct salesman_id from orders;
 SELECT name,city FROM salesman WHERE city='Paris';
  SELECT * FROM customer WHERE grade = 200;
 SELECT ord_no, ord_date, purch_amt FROM orders WHERE salesman_id = 5001;
SELECT * FROM customer WHERE city = 'New York' OR NOT grade > 100 ;
 SELECT salesman_id, name, city, commission FROM salesman WHERE (commission > 0.10 AND commission < 0.12);
  SELECT * FROM customer WHERE cust_name LIKE '%n';
 SELECT * FROM salesman WHERE  name LIKE 'N__l%';
  SELECT * FROM customer WHERE grade is null;
  SELECT sum(purch_amt) FROM orders;
 SELECT count(DISTINCT salesman_id) FROM orders;
  SELECT city, max(grade) FROM customer GROUP BY city;
   SELECT customer_id, MAX(purch_amt) FROM orders GROUP BY customer_id;
    SELECT customer_id, order_date, max(purch_amt) FROM orders GROUP BY customer_id, order_date;
 SELECT salesman_id, max(purch_amt) FROM orders WHERE order_date  =" 2012-08-17" GROUP BY salesman_id; 
  SELECT customer_id, order_date,  MAX(purch_amt) from orders group by customer_id, order_date HAVING MAX(purch_amt) > 2000.00;
 SELECT count(*) FROM orders WHERE order_date="2016-08-17";
 select * from orders;
  SELECT C.customer_name,S.name,S.city from salesman as S, customer AS C WHERE S.city = C.city;
 SELECT customer.customer_name,salesman.name  from customer,salesman WHERE salesman.salesman_id = customer.salesman_id;
 select * from orders;
  SELECT order_id,customer_name,orders.customer_id,orders.salesman_id  FROM salesman,customer,orders WHERE customer.city <> salesman.city
 AND orders.customer_id = customer.customer_id AND orders.salesman_id = salesman.salesman_id;
  SELECT * from orders WHERE salesman_id =(SELECT salesman_id FROM  salesman WHERE name = 'Paul Adam');
SELECT * FROM orders  WHERE purch_amt > (SELECT avg(purch_amt) FROM orders WHERE order_date ="2016-10-10");
SELECT * FROM orders WHERE salesman_id IN(SELECT salesman_id  FROM salesman  where city ='Paris');
 SELECT order_id , purch_amt, order_date, salesman_id FROM orders WHERE salesman_id in(SELECT salesman_id FROM salesman WHERE commission = (SELECT max(commission) FROM salesman));
 SELECT salesman_id, name FROM  salesman AS a 
WHERE 1 < (SELECT COUNT(*) FROM customer AS c WHERE c.salesman_id = a.salesman_id);
 SELECT * FROM salesman WHERE salesman_id IN (SELECT DISTINCT salesman_id FROM customer a 
WHERE NOT EXISTS(SELECT * FROM customer b WHERE a.salesman_id = b.salesman_id AND a.customer_name <> b.customer_name));
 SELECT c.salesman_id, s.name, s.city, s.commission FROM salesman s, customer c  where s.salesman_id = c.salesman_id
 group by c.salesman_id, s.name Having count(c.salesman_id) = 5001;
  SELECT * FROM orders WHERE purch_amt > ANY (SELECT purch_amt FROM orders
 WHERE order_date = '2016-09-10');
  SELECT * FROM customer WHERE grade > ALL(SELECT grade FROM customer WHERE city = 'NewYork');