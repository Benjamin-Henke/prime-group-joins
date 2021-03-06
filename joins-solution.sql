-- 1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses"
	ON "customers"."id" = "addresses"."customer_id";

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT * FROM "line_items"
JOIN "orders"
	ON "line_items"."order_id" = "orders"."id"
JOIN "products"
	ON "line_items"."product_id" = "products"."id";

-- 3. Which warehouses have cheetos?
SELECT
	"warehouse"."warehouse" AS "warehouseName"
FROM "warehouse"
JOIN "warehouse_product"
	ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products"
	ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."id" = '5';

-- 4. Which warehouses have diet pepsi?
SELECT
	"warehouse"."warehouse" AS "warehouseName"
FROM "warehouse"
JOIN "warehouse_product"
	ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products"
	ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."id" = '6';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT 
	"customers"."first_name",
	"customers"."last_name",
	sum("line_items"."quantity")
FROM "customers"
JOIN "addresses" 
	ON "customers"."id" = "addresses"."customer_id"
JOIN "orders" 
	ON "addresses"."id" = "orders"."address_id"
JOIN "line_items" 
	ON "orders"."id" = "line_items"."order_id"
GROUP BY "line_items"."quantity";
-- stuck


-- 6. How many customers do we have?
SELECT
	count("customers"."id")
FROM "customers";

-- 7. How many products do we carry?
SELECT
	count("products"."id")
FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT * FROM "products"
	"warehouse_product"."on_hand"
JOIN "warehouse_product" 
	ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."id" = '6';
-- not sure what the syntax error is

--Stretch
-- How much was the total cost for each order?
-- How much has each customer spent in total?
-- How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).