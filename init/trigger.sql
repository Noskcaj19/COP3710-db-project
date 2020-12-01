-- Prevent negative inventory
create or replace trigger product_trigger
    before insert or update
    on Product
    for each row
begin
    if :new.inventory < 0 then
        raise_application_error(-20001, 'Attempted to remove more items than are in inventory');
    end if;
end product_trigger;

