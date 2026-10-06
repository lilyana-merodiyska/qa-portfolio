# Test Cases — CartRight Retail

**Total test cases:** 61  
**Tracked in:** TestRail (execution results and defect links are maintained there)  
**Web app:** https://www.saucedemo.com  |  **API:** https://fakestoreapi.com

Test case IDs follow the project convention (`TC-xx`). Test cases derived directly from test design techniques keep their technique IDs (`TC-EP-xx`, `TC-DT-xx`) and are mapped to the TestRail cases in the *Technique / Source* column.

**Priority:** Critical = core flow, blocks release; High = important functionality; Medium = secondary behaviour; Low = cosmetic / observation.  
**Nature:** Positive = valid data/flow; Negative = invalid data/flow or undefined behaviour.

**Note:** during planning the API suite was reduced; TC-46, TC-48, TC-50, TC-54, TC-57, TC-59 and TC-61 were merged into other cases or removed, so these numbers are intentionally skipped. All API-REQ requirements remain covered.

## Summary

| Section | Test cases |
|---|---|
| Authentication | 15 |
| Product Listing & Sorting | 7 |
| Shopping Cart | 8 |
| Checkout | 12 |
| API (Fake Store API) | 12 |
| Database (SQLite, simulated schema) | 7 |
| **Total** | **61** |

## Authentication

| ID | Title | Scenario | Priority | Nature | Preconditions | Steps | Expected Result | Technique / Source |
|---|---|---|---|---|---|---|---|---|
| TC-01 | Login with valid credentials | TS-01 | Critical | Positive | Browser open; user is logged out; https://www.saucedemo.com loaded | 1. Enter username: standard_user<br>2. Enter password: secret_sauce<br>3. Click 'Login' | User is redirected to the Products page (/inventory.html); the product list is displayed. | TC-EP-01 / TC-DT-05 |
| TC-02 | Login rejected: invalid username, valid password | TS-02 | High | Negative | https://www.saucedemo.com loaded; user is logged out | 1. Enter username: invaliduser123<br>2. Enter password: secret_sauce<br>3. Click 'Login' | Login is rejected. Error shown: 'Epic sadface: Username and password do not match any user in this service'. User stays on the login page. | TC-EP-02 |
| TC-03 | Login rejected: valid username, invalid password | TS-02 | High | Negative | https://www.saucedemo.com loaded; user is logged out | 1. Enter username: standard_user<br>2. Enter password: invalidpass123<br>3. Click 'Login' | Login is rejected. Error shown: 'Epic sadface: Username and password do not match any user in this service'. | TC-EP-03 |
| TC-04 | Login rejected: empty username | TS-02 | High | Negative | https://www.saucedemo.com loaded; user is logged out | 1. Leave username empty<br>2. Enter password: secret_sauce<br>3. Click 'Login' | Login is rejected. Error shown: 'Epic sadface: Username is required'. | TC-EP-04 / TC-DT-01 |
| TC-05 | Login rejected: empty password | TS-02 | High | Negative | https://www.saucedemo.com loaded; user is logged out | 1. Enter username: standard_user<br>2. Leave password empty<br>3. Click 'Login' | Login is rejected. Error shown: 'Epic sadface: Password is required'. | TC-EP-05 / TC-DT-02 |
| TC-06 | Login rejected: both fields empty | TS-02 | Medium | Negative | https://www.saucedemo.com loaded; user is logged out | 1. Leave username and password empty<br>2. Click 'Login' | Login is rejected. Error shown: 'Epic sadface: Username is required' (username is validated first). | TC-DT-01 |
| TC-07 | Login rejected: invalid username and invalid password | TS-02 | Medium | Negative | https://www.saucedemo.com loaded; user is logged out | 1. Enter username: invaliduser<br>2. Enter password: invalidpass123<br>3. Click 'Login' | Login is rejected. Error shown: 'Epic sadface: Username and password do not match any user in this service'. | TC-DT-03 |
| TC-08 | Locked-out account cannot log in | TS-03 | Critical | Negative | https://www.saucedemo.com loaded; user is logged out | 1. Enter username: locked_out_user<br>2. Enter password: secret_sauce (correct)<br>3. Click 'Login' | Access is denied. Clear message shown: 'Epic sadface: Sorry, this user has been locked out.' User is not redirected to the Products page. | TC-DT-04 |
| TC-09 | Login error message can be dismissed | TS-02 | Low | Positive | An error message is displayed on the login page (e.g. after TC-05) | 1. Click the 'X' icon on the error message | The error message disappears; the red highlighting on the input fields is removed. |  |
| TC-10 | Password field masks the entered characters | TS-01 | Medium | Positive | https://www.saucedemo.com loaded | 1. Type 'secret_sauce' in the password field | Characters are displayed as dots/asterisks and the password is not readable in clear text. |  |
| TC-11 | Error message does not reveal whether a username exists | TS-02 | Medium | Negative | https://www.saucedemo.com loaded | 1. Log in with invalid username + valid password and note the error text<br>2. Log in with valid username + invalid password and note the error text<br>3. Compare the two messages | Both messages are identical ('Username and password do not match any user in this service'); the system does not disclose which field was wrong. | TC-02, TC-03 |
| TC-12 | Direct access to Products page without login is blocked | TS-01 | High | Negative | User is logged out; no active session | 1. Open https://www.saucedemo.com/inventory.html directly in the address bar | The Products page is NOT displayed. User is redirected to the login page with the message 'Epic sadface: You can only access '/inventory.html' when you are logged in.' |  |
| TC-13 | Logout via the menu | TS-04 | Critical | Positive | User is logged in as standard_user and is on the Products page | 1. Click the burger menu (top-left)<br>2. Click 'Logout' | User is redirected to the login page; the username and password fields are empty. |  |
| TC-14 | Session is terminated after logout (browser Back button) | TS-04 | High | Negative | User has just logged out (TC-13) | 1. Click the browser 'Back' button | The Products page is not accessible; user remains on / is returned to the login page. |  |
| TC-15 | Logout is available from the cart and checkout pages | TS-04 | Medium | Positive | User is logged in and has at least 1 item in the cart | 1. Open the cart page; open the burger menu; click 'Logout'<br>2. Log in again, go through checkout to step 'Your Information'; open the burger menu; click 'Logout' | Logout works from every page ('at any time'); user is redirected to the login page each time. |  |

## Product Listing & Sorting

| ID | Title | Scenario | Priority | Nature | Preconditions | Steps | Expected Result | Technique / Source |
|---|---|---|---|---|---|---|---|---|
| TC-16 | Products page displays the full product list | TS-05 | Critical | Positive | User is logged in as standard_user and is on the Products page | 1. Observe the product list | 6 products are displayed. Each shows: name, image, price and an 'Add to cart' button. |  |
| TC-17 | Product images load and match the product names | TS-05 | High | Positive | User is logged in as standard_user and is on the Products page | 1. Check the image of every product against its name | Every product has a loaded (not broken) image that corresponds to the product name. |  |
| TC-18 | Sort products by Name (A to Z) | TS-06 | High | Positive | User is logged in as standard_user and is on the Products page | 1. Open the sort dropdown<br>2. Select 'Name (A to Z)' | Products are ordered alphabetically A→Z by name. The same 6 products remain displayed. |  |
| TC-19 | Sort products by Name (Z to A) | TS-06 | High | Positive | User is logged in as standard_user and is on the Products page | 1. Open the sort dropdown<br>2. Select 'Name (Z to A)' | Products are ordered alphabetically Z→A by name. |  |
| TC-20 | Sort products by Price (low to high) | TS-06 | High | Positive | User is logged in as standard_user and is on the Products page | 1. Open the sort dropdown<br>2. Select 'Price (low to high)' | Products are ordered by ascending price (first: $7.99, last: $49.99). |  |
| TC-21 | Sort products by Price (high to low) | TS-06 | High | Positive | User is logged in as standard_user and is on the Products page | 1. Open the sort dropdown<br>2. Select 'Price (high to low)' | Products are ordered by descending price (first: $49.99, last: $7.99). |  |
| TC-22 | Open the product detail page | TS-05 | Medium | Positive | User is logged in as standard_user and is on the Products page | 1. Click the name (or image) of any product | The detail page of that product opens, showing the same name, price and image as in the list, with an 'Add to cart' button and a 'Back to products' link. |  |

## Shopping Cart

| ID | Title | Scenario | Priority | Nature | Preconditions | Steps | Expected Result | Technique / Source |
|---|---|---|---|---|---|---|---|---|
| TC-23 | Add one product to the cart from the product list | TS-07 | Critical | Positive | User is logged in as standard_user; the cart is empty | 1. Click 'Add to cart' on 'Sauce Labs Backpack' | The button changes to 'Remove'; the cart icon badge shows '1'. |  |
| TC-24 | Add multiple products - cart counter is accurate | TS-08 | High | Positive | User is logged in as standard_user; the cart is empty | 1. Click 'Add to cart' on three different products<br>2. Observe the cart badge after each click | Badge shows 1, then 2, then 3 - always equal to the number of items added. |  |
| TC-25 | Add a product to the cart from its detail page | TS-07 | High | Positive | User is logged in as standard_user; the cart is empty | 1. Open the detail page of any product<br>2. Click 'Add to cart' | The button changes to 'Remove'; the cart badge shows '1'; the item appears in the cart. |  |
| TC-26 | Cart page shows correct item details | TS-07 | High | Positive | User has added 2 known products to the cart | 1. Click the cart icon | The cart lists exactly the added products with correct name, description, price and quantity 1; no extra or missing items. |  |
| TC-27 | Remove a product from the product list page | TS-09 | High | Positive | User has added 2 products to the cart | 1. On the Products page click 'Remove' on one of the added products | The button returns to 'Add to cart'; the badge decreases from 2 to 1; the other product stays added. |  |
| TC-28 | Remove a product from the cart page | TS-09 | Critical | Positive | User has added 2 products to the cart; cart page is open | 1. Click 'Remove' on one item in the cart | The item disappears from the cart; the badge decreases from 2 to 1; the remaining item is unchanged. |  |
| TC-29 | Remove the last item - cart returns to empty state | TS-09 | High | Positive | User has exactly 1 item in the cart; cart page is open | 1. Click 'Remove' on the only item | The cart is empty; the badge is no longer displayed (S1 → S0). | State transition S1→S0 |
| TC-30 | Cart contents persist while navigating | TS-08 | Medium | Positive | User has 2 items in the cart | 1. Open the cart<br>2. Click 'Continue Shopping'<br>3. Open a product detail page and go back<br>4. Observe the badge on each page | The badge shows '2' on every page and the cart still contains both items. |  |

## Checkout

| ID | Title | Scenario | Priority | Nature | Preconditions | Steps | Expected Result | Technique / Source |
|---|---|---|---|---|---|---|---|---|
| TC-31 | Complete checkout with valid data (end-to-end) | TS-10 | Critical | Positive | User is logged in; 2 products are in the cart; cart page is open | 1. Click 'Checkout'<br>2. Enter First Name: Lilyana, Last Name: Test, Zip/Postal Code: 1000<br>3. Click 'Continue'<br>4. Review the order summary<br>5. Click 'Finish' | The 3 steps are completed in order (information → overview → confirmation). Confirmation page shows 'Thank you for your order!'. | State transition S1→S2→S3 |
| TC-32 | Order overview shows correct items and totals | TS-10 | High | Positive | User is on checkout step 2 (Overview) with 2 known products | 1. Compare the listed items and prices with what was added<br>2. Check Item total, Tax and Total | Items and prices match the cart; Item total = sum of item prices; Total = Item total + Tax. |  |
| TC-33 | Checkout rejected: empty First Name | TS-11 | High | Negative | User is on checkout step 1 with at least 1 item in the cart | 1. Leave First Name empty<br>2. Enter Last Name: Test and Zip: 1000<br>3. Click 'Continue' | User cannot proceed. Error shown: 'Error: First Name is required'. |  |
| TC-34 | Checkout rejected: empty Last Name | TS-11 | High | Negative | User is on checkout step 1 with at least 1 item in the cart | 1. Enter First Name: Lilyana<br>2. Leave Last Name empty<br>3. Enter Zip: 1000<br>4. Click 'Continue' | User cannot proceed. Error shown: 'Error: Last Name is required'. |  |
| TC-35 | Checkout rejected: empty Zip/Postal Code | TS-11 | High | Negative | User is on checkout step 1 with at least 1 item in the cart | 1. Enter First Name: Lilyana and Last Name: Test<br>2. Leave Zip/Postal Code empty<br>3. Click 'Continue' | User cannot proceed. Error shown: 'Error: Postal Code is required'. |  |
| TC-36 | Checkout rejected: all fields empty | TS-11 | Medium | Negative | User is on checkout step 1 with at least 1 item in the cart | 1. Leave all fields empty<br>2. Click 'Continue' | User cannot proceed. Error shown: 'Error: First Name is required' (first missing field is reported). |  |
| TC-37 | Cancel on checkout step 1 returns to the cart | TS-10 | Medium | Positive | User is on checkout step 1 with 2 items in the cart | 1. Click 'Cancel' | User is returned to the cart page; both items are still in the cart. |  |
| TC-38 | Cancel on the order overview keeps the cart | TS-10 | Medium | Positive | User is on checkout step 2 (Overview) with 2 items in the cart | 1. Click 'Cancel' | User leaves checkout (Products page); the order is NOT placed; the cart still holds both items and the badge shows '2'. |  |
| TC-39 | Cart is emptied after a completed order | TS-12 | Critical | Positive | User has just completed an order (TC-31) | 1. Observe the cart badge on the confirmation page<br>2. Click 'Back Home'<br>3. Open the cart | The cart badge is not displayed; the cart page shows no items. | State transition S3→S0 |
| TC-40 | New order can be started after a completed order | TS-12 | Medium | Positive | User has just completed an order and is on the Products page | 1. Add 1 product to the cart<br>2. Open the cart | Cart contains only the newly added product; no items from the previous order; badge shows '1'. |  |
| TC-41 | Checkout with an empty cart (undefined behaviour) | TS-20 | Medium | Negative | User is logged in as standard_user; the cart is empty | 1. Open the cart page<br>2. Click 'Checkout'<br>3. Fill in valid data and continue<br>4. Click 'Finish' | Not defined in the requirements. Expected from a business point of view: an order with no items should not be possible. Record the ACTUAL behaviour and raise a defect/observation if the order is completed. | TS-20 (exploratory) |
| TC-42 | Zip/Postal Code accepts non-numeric and very long values (observation) | TS-11 | Low | Negative | User is on checkout step 1 with at least 1 item in the cart | 1. Enter First Name and Last Name with valid values<br>2. Enter Zip: 'ABC!@#' and click 'Continue'<br>3. Repeat with a 200-character Zip value | Not defined in the requirements (see boundary-value-analysis.md). Record the ACTUAL behaviour as an observation, not as a defect. | BVA doc |

## API (Fake Store API)

| ID | Title | Scenario | Priority | Nature | Preconditions | Steps | Expected Result | Technique / Source |
|---|---|---|---|---|---|---|---|---|
| TC-43 | GET /products returns the product list | TS-13 | Critical | Positive | Postman is open; base URL https://fakestoreapi.com | 1. Send GET /products | Status 200 OK. Body is a JSON array of products; each has id, title, price, description, category, image. Response time is reasonable. |  |
| TC-44 | GET /products/:id returns the correct product | TS-13 | Critical | Positive | Postman is open; base URL https://fakestoreapi.com | 1. Send GET /products/1 | Status 200 OK. Body is a single product object with id = 1 and all expected fields. |  |
| TC-45 | GET /products/:id with a non-existent id | TS-13 | High | Negative | Postman is open; base URL https://fakestoreapi.com | 1. Send GET /products/9999 | Expected per REST conventions: 404 Not Found with an error message. Verify the body as well as the status code (a 200 with an empty/null body is a silent failure) and document the ACTUAL behaviour. |  |
| TC-47 | POST /products creates a product (mock API: change is not persisted) | TS-13 | High | Positive | Postman is open; base URL https://fakestoreapi.com | 1. Send POST /products with a JSON body: title, price, description, image, category<br>2. Note the id from the response<br>3. Send GET /products/{id from the previous response} | POST returns status 200/201 with the submitted fields and a new id. The following GET does NOT return the new product: Fake Store API does not persist writes. Document this explicitly - a success response does not mean the data changed. |  |
| TC-49 | PUT /products/:id updates a product | TS-13 | High | Positive | Postman is open; base URL https://fakestoreapi.com | 1. Send PUT /products/1 with a full JSON body and a changed title | Status 200 OK. Response contains the data sent, with id 1. |  |
| TC-51 | DELETE /products/:id removes a product | TS-13 | High | Positive | Postman is open; base URL https://fakestoreapi.com | 1. Send DELETE /products/1 | Status 200 OK; the deleted product is returned. Document that a following GET /products/1 still returns the product (not persisted). |  |
| TC-52 | GET /products/categories returns all categories | TS-14 | High | Positive | Postman is open; base URL https://fakestoreapi.com | 1. Send GET /products/categories | Status 200 OK. Body is a JSON array of category names (4 categories). |  |
| TC-53 | GET /products/category/:category filters correctly | TS-14 | High | Positive | Postman is open; base URL https://fakestoreapi.com | 1. Send GET /products/category/electronics | Status 200 OK. Every returned product has category = 'electronics'; no other category appears. |  |
| TC-55 | POST /auth/login with valid credentials | TS-15 | Critical | Positive | Postman is open; use a valid user from GET /users (e.g. mor_2314) | 1. Send POST /auth/login with body {"username": "mor_2314", "password": "83r5^_"} | Status 200 OK. Body contains a non-empty 'token'. |  |
| TC-56 | POST /auth/login with invalid credentials | TS-15 | High | Negative | Postman is open; base URL https://fakestoreapi.com | 1. Send POST /auth/login with body {"username": "wrong", "password": "wrong"} | Status 401 Unauthorized with an error message; NO token is returned. |  |
| TC-58 | GET /users and GET /users/:id return user data | TS-16 | High | Positive | Postman is open; base URL https://fakestoreapi.com | 1. Send GET /users<br>2. Send GET /users/1 | GET /users: status 200 OK, JSON array of users (id, username, email, name, address, phone). GET /users/1: status 200 OK, a single user object with id = 1. |  |
| TC-60 | GET /carts/user/:id returns the carts of a user | TS-16 | High | Positive | Postman is open; base URL https://fakestoreapi.com | 1. Send GET /carts/user/1 | Status 200 OK. Array of carts, each with userId = 1, a date and a products list (productId, quantity). |  |

## Database (SQLite, simulated schema)

| ID | Title | Scenario | Priority | Nature | Preconditions | Steps | Expected Result | Technique / Source |
|---|---|---|---|---|---|---|---|---|
| TC-62 | Users table has the required structure | TS-17 | High | Positive | Simulated schema created in SQLite (sqliteonline.com) | 1. Run: PRAGMA table_info(Users); | Columns user_id, username, email, created_at exist; user_id is the primary key. | 10-sql-queries |
| TC-63 | Products table has the required structure | TS-17 | High | Positive | Simulated schema created in SQLite | 1. Run: PRAGMA table_info(Products); | Columns product_id, name, price, category exist; product_id is the primary key. | 10-sql-queries |
| TC-64 | Order cannot reference a non-existent user | TS-17 | High | Negative | Schema created; PRAGMA foreign_keys = ON; user_id 9999 does not exist | 1. Run: INSERT INTO Orders (user_id, order_date, status) VALUES (9999, date('now'), 'Pending'); | The insert is rejected with a FOREIGN KEY constraint failure; no order row is created. | 10-sql-queries |
| TC-65 | Order item cannot reference a non-existent order or product | TS-17 | High | Negative | Schema created; PRAGMA foreign_keys = ON | 1. Run: INSERT INTO Order_Items with a non-existent order_id<br>2. Run: INSERT INTO Order_Items with a non-existent product_id | Both inserts are rejected with a FOREIGN KEY constraint failure. | 10-sql-queries |
| TC-66 | No orphan records exist in Orders / Order_Items | TS-17 | Medium | Positive | Schema populated with test data | 1. Run: SELECT * FROM Orders WHERE user_id NOT IN (SELECT user_id FROM Users);<br>2. Run: SELECT * FROM Order_Items WHERE order_id NOT IN (SELECT order_id FROM Orders);<br>3. Run: SELECT * FROM Order_Items WHERE product_id NOT IN (SELECT product_id FROM Products); | All three queries return 0 rows. | 10-sql-queries |
| TC-67 | Order total is consistent with its line items | TS-17 | Medium | Positive | Schema populated with at least one order with 2+ items | 1. Run: SELECT order_id, SUM(quantity * price_at_purchase) FROM Order_Items GROUP BY order_id;<br>2. Compare with the total shown in the UI overview (Item total) for the same order | The calculated total equals the Item total shown to the user; price_at_purchase is stored for every line. | 10-sql-queries |
| TC-68 | Order status in the DB matches the status shown to the user | TS-18 | High | Positive | An order was completed in the UI; the matching order exists in the simulated DB | 1. Note the status shown after checkout<br>2. Run: SELECT status FROM Orders WHERE order_id = <id>; | The status stored in Orders equals the status shown in the UI. NOTE: the DB is simulated and not connected to SauceDemo (see Test Plan - Risks). | 10-sql-queries |
