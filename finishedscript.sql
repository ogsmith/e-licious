USE mydb;
DROP TABLE IF EXISTS `purchases`;
DROP TABLE IF EXISTS `restaurant`;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS `menu_item`;
DROP TABLE IF EXISTS `menu`;
DROP TABLE IF EXISTS `customer`;

CREATE TABLE `menu` (
	`menu_id` INT DEFAULT NULL,
	`menu_category` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `restaurant` (
	`restaurant_id` INT DEFAULT NULL,
	`restaurant_name` VARCHAR(45) NOT NULL,
	`menu_id` INT NOT NULL,
	PRIMARY KEY (`restaurant_id`),
	KEY `restaurant_fk_menu` (`menu_id`),
	CONSTRAINT `restaurant_fk_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menu_item` (
	`menu_item_id` INT DEFAULT NULL, 
	`item_name` VARCHAR(45) NOT NULL, 
	`item_desc` VARCHAR(45) NOT NULL,
	`item_price` INT NOT NULL,
	`menu_id` INT NOT NULL,
	PRIMARY KEY (`menu_item_id`),
	KEY `menu_item_fk_menu` (`menu_id`),
	CONSTRAINT `menu_item_fk_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `customer` (
	`customer_id` INT DEFAULT NULL,
	PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `order` (
	`order_id` INT DEFAULT NULL,
	`menu_item_id` INT NOT NULL,
	`customer_id` INT NOT NULL,
	PRIMARY KEY (`order_id`),
	KEY `order_fk_customer` (`customer_id`),
	CONSTRAINT `order_fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `purchases` (
	`purchase_id` INT DEFAULT NULL,
	`date_order` INT NOT NULL, 
	`order_id` INT NOT NULL,
	`menu_item_id` INT NOT NULL,
	PRIMARY KEY (`purchase_id`),
	KEY `purchase_fk_order` (`order_id`),
	KEY `purchase_fk_menu_item` (`menu_item_id`),
	CONSTRAINT `purchase_fk_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
	CONSTRAINT `purchase_fk_menu_item` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_item` (`menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO menu VALUES (1, "Dinner");
INSERT INTO restaurant VALUES (1, "Bertuccis", 1);



