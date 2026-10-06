-- =====================================================================
-- CartRight Retail - Database testing (simulated schema, SQLite)
-- Run in https://sqliteonline.com  (choose SQLite)
-- NOTE: the schema is simulated and NOT connected to SauceDemo.
--       It demonstrates database testing methodology (see Test Plan - Risks).
-- Covers: TC-62 .. TC-68  (TS-17, TS-18)  |  DB-REQ-01 .. DB-REQ-05
-- =====================================================================

-- ---------------------------------------------------------------------
-- PART 1: SETUP  (run once)
-- ---------------------------------------------------------------------
PRAGMA foreign_keys = ON;   -- SQLite does NOT enforce foreign keys unless this is ON

CREATE TABLE Users (
    user_id     INTEGER PRIMARY KEY,
    username    TEXT NOT NULL UNIQUE,
    email       TEXT NOT NULL,
    created_at  TEXT NOT NULL
);

CREATE TABLE Products (
    product_id  INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    price       REAL NOT NULL CHECK (price > 0),
    category    TEXT NOT NULL
);

CREATE TABLE Orders (
    order_id    INTEGER PRIMARY KEY,
    user_id     INTEGER NOT NULL,
    order_date  TEXT NOT NULL,
    status      TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Order_Items (
    order_item_id      INTEGER PRIMARY KEY,
    order_id           INTEGER NOT NULL,
    product_id         INTEGER NOT NULL,
    quantity           INTEGER NOT NULL CHECK (quantity > 0),
    price_at_purchase  REAL NOT NULL,
    FOREIGN KEY (order_id)   REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Test data (fictional)
INSERT INTO Users (user_id, username, email, created_at) VALUES
 (1, 'standard_user',   'standard.user@example.com',   '2026-01-10'),
 (2, 'locked_out_user', 'locked.user@example.com',     '2026-01-11'),
 (3, 'problem_user',    'problem.user@example.com',    '2026-01-12');

INSERT INTO Products (product_id, name, price, category) VALUES
 (1, 'Sauce Labs Backpack',                 29.99, 'Accessories'),
 (2, 'Sauce Labs Bike Light',                9.99, 'Accessories'),
 (3, 'Sauce Labs Bolt T-Shirt',             15.99, 'Clothing'),
 (4, 'Sauce Labs Fleece Jacket',            49.99, 'Clothing'),
 (5, 'Sauce Labs Onesie',                    7.99, 'Clothing'),
 (6, 'Test.allTheThings() T-Shirt (Red)',   15.99, 'Clothing');

INSERT INTO Orders (order_id, user_id, order_date, status) VALUES
 (1, 1, '2026-10-01', 'Completed'),
 (2, 3, '2026-10-02', 'Pending');

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price_at_purchase) VALUES
 (1, 1, 1, 1, 29.99),
 (2, 1, 2, 1,  9.99),
 (3, 2, 4, 1, 49.99);


-- ---------------------------------------------------------------------
-- TC-62  Users table structure (DB-REQ-01)
-- Expected: user_id (PK), username, email, created_at
-- ---------------------------------------------------------------------
PRAGMA table_info(Users);

-- ---------------------------------------------------------------------
-- TC-63  Products table structure (DB-REQ-02)
-- Expected: product_id (PK), name, price, category
-- ---------------------------------------------------------------------
PRAGMA table_info(Products);

-- ---------------------------------------------------------------------
-- TC-64  Order cannot reference a non-existent user (DB-REQ-03)
-- Expected: ERROR - FOREIGN KEY constraint failed; no row inserted
-- ---------------------------------------------------------------------
INSERT INTO Orders (user_id, order_date, status) VALUES (9999, '2026-10-03', 'Pending');

-- Verify nothing was inserted (expected count = 2, the original orders)
SELECT COUNT(*) AS orders_count FROM Orders;

-- ---------------------------------------------------------------------
-- TC-65  Order item cannot reference a non-existent order or product (DB-REQ-04)
-- Expected: both statements fail with FOREIGN KEY constraint failed
-- ---------------------------------------------------------------------
-- (a) non-existent order
INSERT INTO Order_Items (order_id, product_id, quantity, price_at_purchase) VALUES (9999, 1, 1, 29.99);
-- (b) non-existent product
INSERT INTO Order_Items (order_id, product_id, quantity, price_at_purchase) VALUES (1, 9999, 1, 29.99);

-- ---------------------------------------------------------------------
-- TC-66  No orphan records (DB-REQ-03, DB-REQ-04)
-- Expected: every query returns 0 rows
-- ---------------------------------------------------------------------
-- Orders whose user does not exist in Users
SELECT * FROM Orders WHERE user_id NOT IN (SELECT user_id FROM Users);

-- Order items whose order does not exist in Orders
SELECT * FROM Order_Items WHERE order_id NOT IN (SELECT order_id FROM Orders);

-- Order items whose product does not exist in Products
SELECT * FROM Order_Items WHERE product_id NOT IN (SELECT product_id FROM Products);

-- ---------------------------------------------------------------------
-- TC-67  Order total is consistent with its line items (DB-REQ-04)
-- Expected: order 1 -> 39.98 (= Item total shown in the UI overview)
--           order 2 -> 49.99
-- ---------------------------------------------------------------------
SELECT order_id,
       ROUND(SUM(quantity * price_at_purchase), 2) AS item_total
FROM Order_Items
GROUP BY order_id
ORDER BY order_id;

-- price_at_purchase should match the current catalogue price (no price drift)
-- Expected: 0 rows
SELECT * FROM Order_Items
WHERE price_at_purchase NOT IN (SELECT price FROM Products);

-- ---------------------------------------------------------------------
-- TC-68  Order status in DB matches the status shown to the user (DB-REQ-05)
-- Steps: complete an order in the UI, note the status shown, then compare.
-- Example: UI showed "Completed" for order 1
-- Expected: status = 'Completed'
-- ---------------------------------------------------------------------
SELECT order_id, status FROM Orders WHERE order_id = 1;

-- Orders whose status is not one of the allowed values
-- Expected: 0 rows
SELECT * FROM Orders WHERE status NOT IN ('Pending', 'Completed', 'Cancelled');
