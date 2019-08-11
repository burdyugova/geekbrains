-- Составьте список пользователей users, 
-- которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT * FROM users
WHERE EXISTS (SELECT * FROM orders WHERE user_id = users.id);

-- Выведите список товаров products и разделов catalogs, 
-- который соответствует товару.

SELECT
id,
name,
(SELECT name FROM catalogs WHERE id = catalog_id) AS 'catalog'
FROM
products;

 


