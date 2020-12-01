-- helpers to join related tables

create view ManagerData as
select Employee.id,
       Employee.name,
       street,
       city,
       state,
       zip_code,
       email,
       job_title,
       salary,
       Region.name as "Store Region"
from Manager
         join Employee on Employee.id = Manager.id
         join Region on Manager.id = Region.manager
         join Address on Employee.address = Address.id;

create view SalespersonLeaderboard as
select Employee.id   as "Salesperson ID",
       Employee.name as "Salesperson",
       sum(price)    as "Total sales value"
from Salesperson
         join Employee on Salesperson.id = Employee.id
         join Transaction on Salesperson.id = Transaction.salesperson_id
group by Employee.id, EMPLOYEE.name;

create view SalesPersonView as
select Employee.id,
       name,
       street,
       city,
       state,
       zip_code,
       email,
       job_title,
       salary,
       store_iD
from Salesperson
         join Employee on Salesperson.id = Employee.id
         join Address on Employee.address = Address.id;

create view TaggedProductView as
select Product.*, ProductTag.tag
from Product
         join ProductTag on Product.id = ProductTag.product_id;

create view SaleView as
select order_number,
       Employee.name as "Salesperson Name",
       Customer.name as "Customer name",
       Customer.kind as "Customer kind",
       "date",
       price,
       quantity
from Transaction
         join Employee on Transaction.salesperson_id = Employee.id
         join CUSTOMER on Transaction.customer_id = Customer.ID
order by quantity desc, price desc;

create view BusinessCustomerView as
select Customer.id,
       name,
       street,
       city,
       state,
       zip_code,
       kind,
       category,
       gross_annual_income
from Customer
         join BusinessCustomer on BusinessCustomer.id = Customer.id
         join Address on Address.id = Customer.address;

create view HomeCustomerView as
select Customer.id,
       name,
       street,
       city,
       state,
       zip_code,
       kind,
       marriage_status,
       gender,
       age,
       income
from Customer
         join HomeCustomer on HomeCustomer.id = Customer.id
         join Address on Address.id = Customer.address;

