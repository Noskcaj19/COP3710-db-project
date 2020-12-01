-- Total sales
select sum(price) "Total sales"
from Transaction;

-- Sales per tag
select ProductTag.tag, sum(T.price) as "Total sales"
from ProductTag
         join Transaction T on ProductTag.product_id = T.product_id
group by ProductTag.tag;

-- Quantity of products sold per tag
select ProductTag.tag, sum(T.quantity) as "Total items sold"
from ProductTag
         join Transaction T on ProductTag.product_id = T.product_id
group by ProductTag.tag;

-- Aggregate sum of product sales
select name, sum(Transaction.price) as "Total sales", sum(Transaction.quantity)
from Transaction
         join Product
              on Product.id = Transaction.product_id
group by name;

-- Business leaderboard for each product (by quantity)
select P.name, T.quantity
from Transaction T
         join Customer C on T.customer_id = C.id
         join Product P on T.product_id = P.id
where kind = 'business'
  and C.name = ?
order by quantity desc;
