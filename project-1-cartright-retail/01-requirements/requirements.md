# CartRight Retail — Requirements

**Test environment:** https://www.saucedemo.com

**Test accounts:**

| Username | Password | Purpose |
|---|---|---|
| standard_user | secret_sauce | Normal user flow |
| locked_out_user | secret_sauce | Negative testing — locked account |
| problem_user | secret_sauce | UI bugs for bug report examples |

## Requirements

**REQ-01:** User must be able to log in with valid credentials (username + password).

**REQ-02:** The system must reject login with invalid credentials and display an appropriate error message.

**REQ-03:** Locked out accounts must not have access, even with a correct password, and must see a clear message explaining why.

**REQ-04:** After successful login, the user sees a list of available products (name, image, price, "Add to cart" button).

**REQ-05:** The user can sort products (by name A-Z/Z-A, by price low-high/high-low).

**REQ-06:** The user can add products to the cart from the product list or from a product detail page.

**REQ-07:** The cart icon must accurately show the number of items added at all times.

**REQ-08:** The user can remove products from the cart.

**REQ-09:** The user goes through a 3-step checkout process: enter information (first name, last name, zip code) → order review (summary) → confirmation.

**REQ-10:** The checkout form must validate that all fields are filled in before allowing the user to proceed.

**REQ-11:** After a completed order, the cart must be emptied.

**REQ-12:** The user can log out at any time via the menu.

## API Requirements (Fake Store API)


**API-REQ-01:** The API must return a list of all products via `GET /products`.

**API-REQ-02:** The API must return the details of a specific product by ID via `GET /products/:id`.

**API-REQ-03:** The API must support creating a new product via `POST /products`.

**API-REQ-04:** The API must support updating an existing product via `PUT` or `PATCH /products/:id`.

**API-REQ-05:** The API must support deleting a product via `DELETE /products/:id`.

**API-REQ-06:** The API must return all available product categories via `GET /products/categories`.

**API-REQ-07:** The API must return products filtered by a specific category via `GET /products/category/:category`.

**API-REQ-08:** The API must support user login via `POST /auth/login`, returning a token for valid credentials and an appropriate error response for invalid credentials.

**API-REQ-09:** The API must return user data via `GET /users` and `GET /users/:id`.

**API-REQ-10:** The API must support cart retrieval by user via `GET /carts/user/:id`.

> **Note:** Fake Store API is a mock service — write operations (POST/PUT/PATCH/DELETE) return a fabricated success response but do **not** persist changes on the server. This is an important behavior to document explicitly when writing test cases, since "success response" does not mean "data actually changed."


## Database Requirements (Simulated Schema)

**DB-REQ-01:** The database must store user account records in a `Users` table (`user_id`, `username`, `email`, `created_at`).

**DB-REQ-02:** The database must store product records in a `Products` table (`product_id`, `name`, `price`, `category`).

**DB-REQ-03:** The database must store order records in an `Orders` table (`order_id`, `user_id`, `order_date`, `status`), where `user_id` must reference a valid record in `Users`.

**DB-REQ-04:** The database must store order line items in an `Order_Items` table (`order_item_id`, `order_id`, `product_id`, `quantity`, `price_at_purchase`), where `order_id` and `product_id` must reference valid records.

**DB-REQ-05:** The order status stored in the `Orders` table must match the order status shown to the user after checkout completion.
