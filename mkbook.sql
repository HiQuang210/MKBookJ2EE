Create database mkbook;
use mkbook;
CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL
);
CREATE TABLE book (
    bookId INT PRIMARY KEY AUTO_INCREMENT,
    bookname VARCHAR(100) NOT NULL,
    author VARCHAR(45) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    genres VARCHAR(45),
    bookstatus VARCHAR(20) NOT NULL,
    photo VARCHAR(255),
    email VARCHAR(45),
    quantity INT NOT NULL DEFAULT 0,
    oldcopy INT NOT NULL DEFAULT 0
);

CREATE TABLE item (
    ItemId INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    bookId INT,
    quantity INT NOT NULL DEFAULT 0,
    price DECIMAL(10, 2),
	orderId INT,
    FOREIGN KEY (bookId) REFERENCES book(bookId),
    FOREIGN KEY (userId) REFERENCES user(id)
);
CREATE TABLE `order` (
    orderId INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    orderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2),
    paymentType VARCHAR(50),
    FOREIGN KEY (userId) REFERENCES user(id)
);


SELECT * FROM mkbook.user;
SELECT * FROM mkbook.book;
SELECT * FROM mkbook.order;
SELECT * FROM mkbook.item;


SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

CREATE TRIGGER before_insert_item
BEFORE INSERT ON item
FOR EACH ROW
SET NEW.price = (SELECT price FROM book WHERE book.bookId = NEW.bookId);

DELIMITER //
CREATE TRIGGER before_update_item
BEFORE INSERT ON item
FOR EACH ROW
BEGIN
    DECLARE available_quantity INT;
    SELECT quantity INTO available_quantity
    FROM book
    WHERE book.bookId = NEW.bookId;
    IF NEW.quantity > available_quantity THEN
        SET NEW.quantity = available_quantity;
    END IF;
    SET NEW.price = NEW.quantity * (SELECT price FROM book WHERE book.bookId = NEW.bookId);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_insert_order
BEFORE INSERT ON `order`
FOR EACH ROW
BEGIN
    IF NEW.amount = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Amount must be greater than 0';
    END IF;
END;
//
DELIMITER ;







