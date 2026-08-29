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
