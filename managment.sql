---- USER MANAGEMENT ----
--- Add new user as a manager ---
begin
    -- ?1 = name
    -- ?2 = email
    -- ?3 = job_title
    -- ?4 = salary
    -- ?5 = street
    -- ?6 = city
    -- ?7 = state
    -- ?8 = zip_code
    --- This magic comment is a Oracle "hint"
    insert/*+ ignore_row_on_dupkey_index(Address, unique_address) */
    into Address(street, city, state, zip_code)
    values (?5, ?6, ?7, ?8);

    insert into Employee (name, address, email, job_title, salary, kind)
    values (?1, (select id from Address where street = ?5), ?2, ?3, ?4, 'm');

    insert into Manager values ((select id from Employee where name = ?1));
end;

--- Add new user as an employee ---
begin
    -- ?1 = name
    -- ?2 = email
    -- ?3 = job_title
    -- ?4 = salary
    -- ?5 = store_id
    -- ?6 = street
    -- ?7 = city
    -- ?8 = state
    -- ?9 = zip_code
    --- This magic comment is a Oracle "hint"
    insert/*+ ignore_row_on_dupkey_index(Address, unique_address) */
    into Address(street, city, state, zip_code)
    values (?6, ?7, ?8, ?9);

    insert into Employee (name, address, email, job_title, salary, kind)
    values (?1, (select id from Address where street = ?6), ?2, ?3, ?4, 'e');

    insert into Salesperson(id, store_id) values ((select id from Employee where name = ?1), ?5);
end;

--- Completely remove employee ---
begin
    -- ?1 = employee_id
    delete Manager where id = ?1;
    delete Salesperson where id = ?1;
    delete Employee where id = ?1;
end;

--- Make manager an employee
begin
    -- ?1 = employee_id
    -- ?2 = store_id
    -- ?3 = replacement_manager -- what manager should replace this employee
    update Store set manager = ?3 where Store.manager = ?1;
    delete Manager where id = ?1;
    update Employee set kind = 's' where Employee.id = ?1;
    insert into Salesperson values (?1, ?2);
end;

--- Make employee a manager ---
begin
    -- ?1 = employee_id
    -- ?2 = store_id
    delete Salesperson where id = ?1;
    insert into MANAGER values (?1);
    update Employee set kind = 'm' where id = ?1;
    update Store set manager = ?1 where Store.id = ?2;
end;

---- Store management ----
--- Create new store ---
-- ?1 = manager
-- ?2 = region
insert into Store(manager, region)
values (?1, ?2);

--- Remove a store ---
-- ?1 = region
delete Store
where id = ?1;

