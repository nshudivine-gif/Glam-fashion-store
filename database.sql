-- ============================================
--  GLAM FASHION STORE - DATABASE SCRIPT
--  Run this in MySQL Workbench
-- ============================================

CREATE DATABASE IF NOT EXISTS glam_fashion;
USE glam_fashion;

-- ============================================
-- TABLE: categories
-- ============================================
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- TABLE: products
-- ============================================
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image VARCHAR(300),
    category_id INT,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- ============================================
-- TABLE: customers
-- ============================================
CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- TABLE: orders
-- ============================================
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status ENUM('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- ============================================
-- TABLE: order_items
-- ============================================
CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- ============================================
-- SAMPLE DATA: Categories
-- ============================================
INSERT INTO categories (name, slug) VALUES
('Dresses', 'dresses'),
('Tops', 'tops'),
('Bottoms', 'bottoms'),
('Accessories', 'accessories'),
('Shoes', 'shoes');

-- ============================================
-- SAMPLE DATA: Products
-- ============================================
INSERT INTO products (name, description, price, image, category_id, stock) VALUES
('Floral Wrap Dress', 'Elegant floral print wrap dress perfect for any occasion.', 45000, 'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=400', 1, 20),
('Summer Midi Dress', 'Lightweight midi dress ideal for warm Kigali days.', 38000, 'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?w=400', 1, 15),
('Elegant Evening Gown', 'Stunning full-length gown for special occasions.', 120000, 'https://images.unsplash.com/photo-1566174053879-31528523f8ae?w=400', 1, 8),
('Lace Blouse', 'Delicate lace blouse for a feminine look.', 25000, 'https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?w=400', 2, 30),
('Silk Camisole', 'Smooth silk camisole, versatile for day or night.', 20000, 'https://images.unsplash.com/photo-1598554747436-c9293d6a588f?w=400', 2, 25),
('High-Waist Trousers', 'Tailored high-waist trousers for a chic silhouette.', 35000, 'https://images.unsplash.com/photo-1594938298603-c8148c4b4357?w=400', 3, 18),
('Denim Mini Skirt', 'Classic denim mini skirt, a wardrobe essential.', 28000, 'https://images.unsplash.com/photo-1583496661160-fb5886a0aaaa?w=400', 3, 22),
('Pearl Necklace', 'Lustrous pearl necklace for timeless elegance.', 15000, 'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=400', 4, 40),
('Gold Hoop Earrings', 'Classic gold hoops that complement every outfit.', 12000, 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=400', 4, 50),
('Strappy Heels', 'Chic strappy heels with a comfortable block heel.', 55000, 'https://images.unsplash.com/photo-1543163521-1bf539c55dd2?w=400', 5, 12);

-- ============================================
-- Verify data
-- ============================================
SELECT 'Categories:' AS info, COUNT(*) AS total FROM categories
UNION ALL
SELECT 'Products:', COUNT(*) FROM products;
