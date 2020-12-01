-- Products: product ID, name, inventory amount, price, product kind w.r.t. some classification.
create table Product
(
    id        number generated always as identity
        constraint product_pk primary key,
    name      varchar2(255)  not null,
    inventory number         not null,
    -- price per unit
    price     decimal(13, 2) not null
);

create table ProductTag
(
    product_id number
        constraint product_tag_id_fk references Product (id),
    tag        varchar2(1000) not null,
    constraint product_tags_pk
        primary key (product_id, tag)
);


-- sample data
insert into Product (name, inventory, price)
values ('Bread',
        1000,
        15.2);

insert into Product (name, inventory, price)
values ('Paper',
        2000,
        5.0);

insert into Product (name, inventory, price)
values ('Staples',
        5000,
        1.0);

insert into Product (name, inventory, price)
values ('Desk Chair',
        500,
        87.0);

insert into ProductTag(product_id, tag)
values ((select id from Product where name = 'Bread'),
        'consumable');
insert into ProductTag(product_id, tag)
values ((select id from Product where name = 'Bread'),
        'food');

insert into ProductTag(product_id, tag)
values ((select id from Product where name = 'Paper'),
        'consumable');
insert into ProductTag(product_id, tag)
values ((select id from Product where name = 'Paper'),
        'productivity');

insert into ProductTag(product_id, tag)
values ((select id from Product where name = 'Staples'),
        'consumable');
insert into ProductTag(product_id, tag)
values ((select id from Product where name = 'Staples'),
        'productivity');

insert into ProductTag(product_id, tag)
values ((select id from Product where name = 'Desk Chair'),
        'productivity');


