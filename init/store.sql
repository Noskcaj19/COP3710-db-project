-- store ID, address,manager, number of salespersons, region.

create table Store
(
    id      number generated always as identity
        constraint store_pk primary key,
    -- todo: it's a virtual store, does it have an address? no
    -- address varchar2(1000) not null,
    manager number
        constraint store_manager_fk references Manager (id) not null,
    -- todo: should the number of salespersons be stored? or calculated?
    region  number
        constraint store_region_fk references Region (id)   not null
);

insert into Store (manager, region)
values (1, 1);

insert into Store (manager, region)
values (2, 2);
