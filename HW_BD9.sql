/* Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах
 users, catalogs и products в таблицу logs помещается время и дата создания записи,
 название таблицы, идентификатор первичного ключа и содержимое поля name.
 */

CREATE TABLE logs (
tablename VARCHAR(255) COMMENT 'Название таблицы',
extenal_id INT COMMENT 'Первичный ключ таблицы tablename',
name VARCHAR(255) COMMENT 'Поле name таблицы tablename',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) COMMENT = 'Журнал интернет-магазина' ENGINE=Archive;

DELIMITER //
CREATE TRIGGER log_after_insert_to_users AFTER INSERT ON users
FOR EACH ROW BEGIN
	INSERT INTO logs (tablename, extenal_id, name) VALUES('users', NEW.id, NEW.name);
END//

INSERT INTO users (name, birthday_at) VALUES ('Роман', '1995-11-05')//

-- Триггер для таблицы Products
CREATE TRIGGER log_after_insert_to_users AFTER INSERT ON products
FOR EACH ROW BEGIN
	INSERT INTO logs (tablename, extenal_id, name) VALUES('products', NEW.id, NEW.name);
END//

-- Триггер для таблицы Catalogs
CREATE TRIGGER log_after_insert_to_users AFTER INSERT ON catalogs
FOR EACH ROW BEGIN
	INSERT INTO logs (tablename, extenal_id, name) VALUES('catalogs', NEW.id, NEW.name);
END//


