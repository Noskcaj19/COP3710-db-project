-- Salespersons: name, address, e-mail, job title, store assigned, salary.
-- subtype of employee
create table Salesperson
(
    id       number
        constraint salesperson_pk primary key
        constraint salesperson_id_fk references Employee (id),
    store_id number
        constraint salesperson_store_fk references Store (id) not null
);

-- sample data

insert into Salesperson (id, store_id)
values ((select id from Employee where name = 'Laurice Karl'),
        1);

insert into Salesperson (id, store_id)
values ((select id from Employee where name = 'Dean Bollich'),
        1);

insert into Salesperson (id, store_id)
values ((select id from Employee where name = 'Milo Manoni'),
        2);

insert into Salesperson(id, store_id)
values ((select id from Employee where name = 'Gricelda Luebbers'),
        2);
