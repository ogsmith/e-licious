DROP PROCEDURE IF EXISTS getMenu;
DELIMITER $$
CREATE PROCEDURE getMenu(menuid int(11))
	BEGIN
		select menu.menu_category from menu;
	END $$
DELIMITER ;
call getMenu(1);

DROP PROCEDURE IF EXISTS getRestaurant;
DELIMITER $$
CREATE PROCEDURE getRestaurant(restaurantid int(11))
	BEGIN
		select restaurant.restaurant_name from restaurant;
	END $$
DELIMITER ;
call getRestaurant(1);

DROP PROCEDURE IF EXISTS getMenuItem;
DELIMITER $$
CREATE PROCEDURE getMenuItem(menuitem int(11))
	BEGIN
		select menu_item.item_name from menu_item;
	END $$
DELIMITER ;
call getMenuItem(1);
