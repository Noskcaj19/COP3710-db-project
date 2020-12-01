-- Transactions: record  of  product  purchased,  including  order  number,
-- date,  salesperson  name,  product information (price, quantity, etc.),
-- customer information.
create table Transaction
(
    order_number   number
        constraint transaction_pk primary key,
    -- todo product foreign key -- what to do if product is removed?
    -- assume products are never removed
    product_id     number
        constraint product_fk references Product (id)                     not null,
    "date"         date                                                   not null,
    salesperson_id number
        constraint transaction_salesperson_fk references Salesperson (id) not null,
    -- total price
    price          number                                                 not null,
    quantity       number                                                 not null,
    customer_id    number
        constraint transaction_customer_fk references Customer (id)       not null
);

-- sample data

insert into Transaction
values (1, (select id from Product where name = 'Bread'), sysdate - 16, 1, 35, 3, 1);

insert into Transaction
values (2, (select id from Product where name = 'Bread'), sysdate - 14, 1, 200, 4, 2);

insert into Transaction
values (3, (select id from Product where name = 'Paper'), sysdate - 19, 1, 200, 5, 3);

insert into Transaction
values (4, (select id from Product where name = 'Paper'), sysdate - 26, 2, 444, 1, 4);

insert into Transaction
values (5, (select id from Product where name = 'Desk Chair'), sysdate - 36, 2, 30, 5, 3);

insert into Transaction
values (6, (select id from Product where name = 'Staples'), sysdate - 33, 1, 90, 500, 2);
