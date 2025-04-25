use E_commerce_db;

-- Brand Table
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
);

INSERT INTO brand (brand_name) VALUES 
('Nike'),
('Samsung'),
('Apple'),
('Adidas');

-- Product Table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2),
    brand_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

INSERT INTO product (product_name, price, brand_id) VALUES 
('Nike Air Max', 120.00, 1),
('Galaxy S22', 999.99, 2),
('iPhone 14', 1099.00, 3),
('Adidas Ultraboost', 150.00, 4);

-- Product Image Table
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO product_image (product_id, image_url) VALUES 
(1, 'https://example.com/images/nike-air-max.jpg'),
(2, 'https://example.com/images/galaxy-s22.jpg'),
(3, 'https://example.com/images/iphone14.jpg'),
(4, 'https://example.com/images/adidas-ultraboost.jpg');

-- Product Category Table
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

INSERT INTO product_category (category_name) VALUES 
('Footwear'),
('Electronics'),
('Mobile Phones'),
('Sportswear');

-- Link Product to Category (Many-to-Many)
CREATE TABLE product_category_link (
    product_id INT,
    category_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id),
    PRIMARY KEY (product_id, category_id)
);

INSERT INTO product_category_link (product_id, category_id) VALUES 
(1, 1), -- Nike Air Max -> Footwear
(2, 2), -- Galaxy S22 -> Electronics
(2, 3), -- Galaxy S22 -> Mobile Phones
(3, 2), -- iPhone 14 -> Electronics
(3, 3), -- iPhone 14 -> Mobile Phones
(4, 1), -- Adidas Ultraboost -> Footwear
(4, 4); -- Adidas Ultraboost -> Sportswear

-- Color Table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL
);

INSERT INTO color (color_name) VALUES 
('Black'),
('White'),
('Red'),
('Blue');

-- Product Variation Table
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

INSERT INTO product_variation (product_id, color_id, size_option_id) VALUES 
(1, 1, 1), -- Nike Air Max, Black, Size 42
(1, 2, 2), -- Nike Air Max, White, Size 43
(4, 3, 1), -- Adidas Ultraboost, Red, Size 42
(4, 4, 3); -- Adidas Ultraboost, Blue, Size 44

-- Size Category Table
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_name VARCHAR(100) NOT NULL
);

INSERT INTO attribute_category (attribute_category_name) VALUES 
('Physical'),
('Technical');

INSERT INTO size_category (size_category_name) VALUES 
('Clothing Size'),
('Shoe Size');

-- Size Option Table
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT,
    size_value VARCHAR(50),
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

INSERT INTO size_option (size_category_id, size_value) VALUES 
(2, '42'),
(2, '43'),
(2, '44'),
(1, 'M'),
(1, 'L');

-- Attribute Category Table
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    attribute_category_name VARCHAR(100)
);

-- Attribute Type Table
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) -- text, number, boolean
);

-- Attribute Table
CREATE TABLE attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    attribute_name VARCHAR(100),
    attribute_category_id INT,
    attribute_type_id INT,
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

INSERT INTO attribute (attribute_name, attribute_category_id, attribute_type_id) VALUES 
('Material', 1, 1),
('Weight', 1, 2),
('Wireless', 2, 3);
