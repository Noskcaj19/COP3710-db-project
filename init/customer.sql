-- customer ID, name, address (street, city, state, zip code),
-- kind (home/business). If business, then  business  category,
-- company  gross  annual  income,etc.

create table Customer
(
    id   number generated always as identity
        constraint customer_pk primary key,
    name varchar2(1000) not null,
    address
        constraint customer_address_fk references Address (id)
                        not null,
    kind varchar2(20) -- home or business
);

create table BusinessCustomer
(
    id                  number
        constraint business_customer_pk primary key
        constraint business_customer_id_fk references Customer (id),
    category            varchar2(200) not null,
    gross_annual_income number        not null
);

create table HomeCustomer
(

    id              number
        constraint home_customer_pk primary key
        constraint home_customer_id_fk references Customer (id),
    marriage_status char(1) not null, -- M or S
    gender          char(1) not null, -- M or F
    age             number  not null,
    income          number  not null
);


-- sample data
insert into Customer(name, address, kind)
values ('Samantha Hendricksen',
        (select id from Address where street = '58 Olivard Street'),
        'home');
insert into HomeCustomer(id, marriage_status, gender, age, income)
values ((select id from Customer where name = 'Samantha Hendricksen'),
        'M',
        'F',
        29,
        39);

insert into Customer (name, address, kind)
values ('Incorporated Manufacturing',
        (select id from Address where street = '132 Knoxsvil Blvd'),
        'business');
insert into BusinessCustomer(id, category, gross_annual_income)
values ((select id from Customer where name = 'Incorporated Manufacturing'),
        'Manufacturing',
        120);

insert into Customer (name, address, kind)
values ('Processed Textiles',
        (select id from Address where street = '587 Rassiels Street'),
        'business');
insert into BusinessCustomer(id, category, gross_annual_income)
values ((select id from Customer where name = 'Processed Textiles'),
        'Textiles',
        99);

insert into Customer (name, address, kind)
values ('Fred Novacheck',
        (select id from Address where street = '462 Daniels Way'),
        'home');
insert into HomeCustomer(id, marriage_status, gender, age, income)
values ((select id from Customer where name = 'Fred Novacheck'),
        'S',
        'M',
        44,
        51);

