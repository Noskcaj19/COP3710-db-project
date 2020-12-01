-- supertype for salesperson and manager
create table Employee
(
    id        number generated always as identity
        constraint employee_pk primary key,
    name      varchar2(1000) not null,
    address
        constraint employee_address_fk references Address (id)
                             not null,
    email     varchar2(1000),
    job_title varchar2(1000),
    salary    number         not null,
    kind      char(1)        not null -- m[anager] or s[alesperson]
);

insert into Employee (name,
                      address,
                      email,
                      job_title,
                      salary,
                      kind)
values ('Laurice Karl',
        (select id from Address where street = '108 Yardville Blvd'),
        'gricelda.luebbers@aaab.com',
        'In faucibus. Ut id nulla ac sapien suscipit tristique ac volutpat risus.Phasellus vitae ligula.',
        72,
        'm');

insert into Employee (name,
                      address,
                      email,
                      job_title,
                      salary,
                      kind)
values ('Dean Bollich',
        (select id from Address where street = '737 Darby Ave'),
        'dean.bollich@aaac.com',
        'Ac sapien suscipit tristique ac volutpat risus.Phasellus vitae ligula commodo, dictum lorem sit amet, imperdiet ex. Etiam cursus porttitor tincidunt. Vestibulum ante ipsumprimis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vulputate placerat pellentesque. Proin viverra lacinialectus, quis consectetur mi venenatis nec. Donec convallis sollicitudin elementum. Nulla.',
        58,
        'm');

insert into Employee (name,
                      address,
                      email,
                      job_title,
                      salary,
                      kind)
values ('Milo Manoni',
        (select id from Address where street = '857 Chesterfield Place'),
        'milo.manoni@aaad.com',
        'Elementum. Nulla facilisi. In posuere blandit leoeget malesuada. Vivamus efficitur ipsum tellus, quis posuere mi maximus vitae. Quisque tortor odio, feugiat eget sagittisvel, pretium ut metus. Duis et commodo arcu, in vestibulum tellus. In sollicitudin nisi mi, pharetra gravida ex semper ut.Donec nibh sapien, hendrerit quis varius.',
        15,
        's');

insert into Employee (name,
                      address,
                      email,
                      job_title,
                      salary,
                      kind)
values ('Gricelda Luebbers',
        (select id from Address where street = '982 Azusa Place'),
        'laurice.karl@aaae.com',
        'Ut id nulla ac sapien suscipit tristique ac volutpat risus.Phasellus vitae ligula commodo, dictum lorem sit amet, imperdiet ex. Etiam cursus porttitor tincidunt. Vestibulum ante ipsumprimis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vulputate placerat pellentesque. Proin viverra lacinialectus, quis consectetur mi venenatis nec. Donec convallis.',
        9,
        's');
