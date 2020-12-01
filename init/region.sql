-- Region: region ID, region name, region manager.

create table Region
(
    id      number generated always as identity
        constraint region_pk primary key,
    name    varchar2(500) not null,
    manager number
        constraint region_manager_fk references Manager (id) not null
);

insert into Region (name, manager)
values ('US South', 1);

insert into Region (name, manager)
values ('US North', 2);
