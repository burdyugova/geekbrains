-- Создайте представление, которое выводит название name товарной позиции 
-- из таблицы products и соответствующее название каталога name из таблицы catalogs.

CREATE OR REPLACE VIEW prod AS
SELECT id, name,
(SELECT name FROM catalogs WHERE id = catalog_id) AS 'catalog'
FROM products;

SELECT * FROM prod;

-- В базе данных shop и sample присутствуют одни и те же таблицы, 
-- учебной базы данных. Переместите запись id = 1 из таблицы shop.users 
-- в таблицу sample.users. Используйте транзакции.

START TRANSACTION;
SELECT * FROM shop.users WHERE id = 1;
SELECT @id = id FROM shop.users WHERE id = 1;
UPDATE shop.users DELETE FROM @id;
UPDATE sample.users SET @id WHERE id IS NULL;