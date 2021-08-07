
------ QUERIES --------

-- 1- How many bank accounts currently stored are from  ‘Bank Austria’

SELECT COUNT(bank_info.bank_info_ID) FROM bank_info WHERE bank_info.bank_name = 'Bank Austria';

-- 2 - Show all the companies currently shipping for Famazon

SELECT ship_company_name FROM shipping_companies;
 
-- 3 - Show all the products with a price higher than 200€.

SELECT products.product_name, products.price from products where price > 200;

-- 4 - Show the products with a price higher than 200€ and which company sells them

SELECT products.product_name, products.price, sellers.seller_name 
from products
INNER JOIN sellers on products.fk_seller = sellers.seller_ID
where price > 200

-- 5 - Show all the products from ‘TheGreatestShop'

SELECT products.product_name, products.price, sellers.seller_name 
from products
INNER JOIN sellers on products.fk_seller = sellers.seller_ID
where sellers.seller_name = 'TheGreatesShop'

-- 6 - Show the full name and phone number of the customer with customerID 1

SELECT customers.first_name, customers.last_name, contacts.email 
from customers 
INNER JOIN contacts 
on customers.fk_contact_ID = contacts.contact_ID where customers.customer_ID = 1;


----- BONUS QUERIES -------


-- 1 - Show all the orders created, displaying who ordered, and what.

SELECT customers.first_name, customers.last_name, orders.order_ID, products.product_name 
FROM customers 
INNER JOIN orders on customers.customer_ID = orders.fk_customer_ID 
INNER JOIN order_items on order_items.order_items_ID = orders.fk_order_items_ID 
INNER JOIN products on products.product_ID = order_items.fk_product_ID;


-- 2 - Show order '2', who ordered, what product, and its quantity

SELECT customers.first_name, customers.last_name, orders.order_ID, products.product_name, order_items.product_quantity 
FROM customers 
INNER JOIN orders on customers.customer_ID = orders.fk_customer_ID 
INNER JOIN order_items on order_items.order_items_ID = orders.fk_order_items_ID 
INNER JOIN products on products.product_ID = order_items.fk_product_ID WHERE orders.order_ID = '2';

-- 3 - Show all orders, and display the name of the customer, of the product, the seller and of the shipping company

SELECT orders.order_ID, customers.first_name, customers.last_name,  products.product_name, sellers.seller_name, shipping_companies.ship_company_name  
from sellers 
INNER JOIN products on sellers.seller_ID = products.fk_seller 
INNER JOIN order_items on products.product_ID = order_items.fk_product_ID 
INNER JOIN orders on order_items.order_items_ID = orders.fk_order_items_ID 
INNER JOIN shipments on orders.order_ID = shipments.fk_order_ID 
INNER JOIN shipping_companies on shipping_companies.shipping_company_ID = shipments.fk_ship_comp_ID 
INNER JOIN customers on customers.customer_ID = orders.fk_customer_ID;

-- 4 - Show all orders where the bill is higher than 20€

SELECT orders.order_ID, customers.first_name, customers.last_name,  products.product_name, products.price, orders.total, sellers.seller_name, shipping_companies.ship_company_name  
from sellers 
INNER JOIN products on sellers.seller_ID = products.fk_seller 
INNER JOIN order_items on products.product_ID = order_items.fk_product_ID 
INNER JOIN orders on order_items.order_items_ID = orders.fk_order_items_ID 
INNER JOIN shipments on orders.order_ID = shipments.fk_order_ID 
INNER JOIN shipping_companies on shipping_companies.shipping_company_ID = shipments.fk_ship_comp_ID 
INNER JOIN customers on customers.customer_ID = orders.fk_customer_ID
WHERE orders.total > 20;