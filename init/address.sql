-- Shared address table

create table Address
(
    id       number generated always as identity
        constraint address_pk primary key,
    street   varchar2(1000),
    city     varchar2(1000),
    state    varchar2(1000),
    zip_code number,
    constraint unique_address unique (street, city, state, zip_code)
);

insert into Address(street, city, state, zip_code)
values ('58 Olivard Street', 'Stockton', 'California', 95202);

insert into Address(street, city, state, zip_code)
values ('132 Knoxsvil Blvd', 'Corpus Christi', 'Texas', 25832);

insert into Address(street, city, state, zip_code)
values ('587 Rassiels Street', 'Kansas City', 'Missouri', 12383);

insert into Address(street, city, state, zip_code)
values ('462 Daniels Way', 'Lubbock', 'Texas', 32133);

insert into Address(street, city, state, zip_code)
values ('108 Yardville Blvd', 'Indianapolis', 'Indiana', 32345);

insert into Address(street, city, state, zip_code)
values ('737 Darby Ave', 'Tucson', 'Arizona', 938234);

insert into Address(street, city, state, zip_code)
values ('857 Chesterfield Place', 'Newark', 'New Jersey', 235234);

insert into Address(street, city, state, zip_code)
values ('982 Azusa Place', 'Orlando', 'Florida', 234234);


