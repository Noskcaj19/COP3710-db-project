---- EDITING ----
--- New product ---
insert into Product (name, inventory, price)
values (?, ?, ?);

--- Add inventory ---
-- ?1 = quantity to add
-- ?2 = product_id
update Product
set inventory = inventory + ?1
where id = ?2;

--- Remove inventory ---
-- ?1 = quantity to remove
-- ?2 = product_id
update Product
set inventory = inventory - ?1
where id = ?2;

--- Process product transaction ---
-- ?1 = quantity
-- ?2 = product_id
-- ?3 = order_number
-- ?4 = date
-- ?5 = salesperson_id
-- ?6 = customer_id
begin
    update Product
    set inventory = inventory - ?1
    where id = ?2;

    insert into Transaction
    values (?3, -- order_number,
            ?2, -- product_id,
            ?4, -- date,
            ?5, -- salesperson_id,
            (select price * ?1
             from Product
             where id = ?2),
            ?1, -- quantity,
            ?6); -- customer_id);
end;

---- QUERIES ----
--- simple tag query ---
select Product.*
from Product
         join ProductTag on Product.id = ProductTag.product_id
where Tag = ?;

--- simple product name search ---
select *
from (select Product.*,
             utl_match.jaro_winkler_similarity(name, ?) as str_sim
      from Product)
where str_sim > 50
order by str_sim desc;

--- Simple product browsing, "popular, in stock items" ---
select *
from Product
order by inventory desc;

--- List tags ---
select tag
from ProductTag;

