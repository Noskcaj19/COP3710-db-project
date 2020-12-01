-- subtype of employee
create table Manager
(
    id number
        constraint manager_pk primary key
        constraint manager_id_fk references Employee (id)
);

insert into Manager (id)
values (1);

insert into Manager (id)
values (2);
