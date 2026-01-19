-- CampusHub Database Schema (Java DB / Derby Compatible)
-- Re-run this script to reset the database.

-- Drop tables in reverse dependency order to avoid constraint errors
-- (Derby doesn't support DROP TABLE IF EXISTS properly in all versions, so we use standard DROP)
-- Ignore errors if tables don't exist yet.

DROP TABLE Message;
DROP TABLE Cart_Item;
DROP TABLE Cart;
DROP TABLE Review;
DROP TABLE Orders;
DROP TABLE Product;
DROP TABLE Category;
DROP TABLE Users;

-- 1. Users Table ("User" is a reserved word, quoting it or using plural "Users")
CREATE TABLE Users (
    user_id VARCHAR(50) NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    university VARCHAR(100),
    student_id_number VARCHAR(50),
    profile_image VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rating DOUBLE DEFAULT 0.0
);

-- 2. Category Table
CREATE TABLE Category (
    category_id VARCHAR(50) NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    icon VARCHAR(255),
    item_count INT DEFAULT 0
);

-- 3. Product Table
CREATE TABLE Product (
    product_id VARCHAR(50) NOT NULL PRIMARY KEY,
    seller_id VARCHAR(50) NOT NULL,
    category_id VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(3200), -- Long VARCHAR for Derby
    price DECIMAL(10, 2) NOT NULL,
    "condition" VARCHAR(50), -- Reserved word
    status VARCHAR(50) DEFAULT 'AVAILABLE',
    image_url CLOB,
    listed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_product_seller FOREIGN KEY (seller_id) REFERENCES Users(user_id),
    CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- 4. Orders Table ("Order" is reserved)
CREATE TABLE Orders (
    order_id VARCHAR(50) NOT NULL PRIMARY KEY,
    buyer_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    seller_id VARCHAR(50) NOT NULL,
    quantity INT DEFAULT 1,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'PENDING',
    ordered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_order_buyer FOREIGN KEY (buyer_id) REFERENCES Users(user_id),
    CONSTRAINT fk_order_product FOREIGN KEY (product_id) REFERENCES Product(product_id),
    CONSTRAINT fk_order_seller FOREIGN KEY (seller_id) REFERENCES Users(user_id)
);

-- 5. Review Table
CREATE TABLE Review (
    review_id VARCHAR(50) NOT NULL PRIMARY KEY,
    reviewer_id VARCHAR(50) NOT NULL,
    seller_id VARCHAR(50) NOT NULL,
    order_id VARCHAR(50) NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment VARCHAR(1000),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_reviewer FOREIGN KEY (reviewer_id) REFERENCES Users(user_id),
    CONSTRAINT fk_review_seller FOREIGN KEY (seller_id) REFERENCES Users(user_id),
    CONSTRAINT fk_review_order FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 6. Cart Table
CREATE TABLE Cart (
    cart_id VARCHAR(50) NOT NULL PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- 7. Cart_Item Table
CREATE TABLE Cart_Item (
    cart_item_id VARCHAR(50) NOT NULL PRIMARY KEY,
    cart_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    quantity INT DEFAULT 1,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_cartitem_cart FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
    CONSTRAINT fk_cartitem_product FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 8. Message Table
CREATE TABLE Message (
    message_id VARCHAR(50) NOT NULL PRIMARY KEY,
    sender_id VARCHAR(50) NOT NULL,
    receiver_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(50),
    content VARCHAR(3200),
    is_read BOOLEAN DEFAULT FALSE,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_msg_sender FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    CONSTRAINT fk_msg_receiver FOREIGN KEY (receiver_id) REFERENCES Users(user_id),
    CONSTRAINT fk_msg_product FOREIGN KEY (product_id) REFERENCES Product(product_id)
);


-- Default Categories (Student-focused items)
INSERT INTO Category (category_id, name, icon) VALUES
('c1', 'Textbooks & Notes', 'icon-book.png'),
('c2', 'Electronics & Gadgets', 'icon-electronics.png'),
('c3', 'Room & Dorm Essentials', 'icon-home.png'),
('c4', 'Stationery & Supplies', 'icon-pencil.png'),
('c5', 'Sports & Fitness', 'icon-sports.png'),
('c6', 'Clothing & Accessories', 'icon-clothing.png'),
('c7', 'Food & Kitchen', 'icon-food.png'),
('c8', 'Tickets & Vouchers', 'icon-ticket.png'),
('c9', 'Services & Tutoring', 'icon-service.png'),
('c10', 'Others', 'icon-other.png');

