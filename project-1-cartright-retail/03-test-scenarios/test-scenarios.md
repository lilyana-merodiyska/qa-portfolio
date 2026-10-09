# Test Scenarios - CartRight Retail

## Web Application

| ID | Test Scenario | Requirement ID |
|---|---|---|
| TS-01 | Check login behavior with valid credentials | REQ-01 |
| TS-02 | Confirm that login is rejected for invalid credentials | REQ-02 |
| TS-03 | Validate that a locked-out account cannot log in | REQ-03 |
| TS-04 | Test logout and session termination | REQ-12 |
| TS-05 | Confirm correct product listing display after login | REQ-04 |
| TS-06 | Check product sorting by name and by price | REQ-05 |
| TS-07 | Test adding products to the shopping cart | REQ-06 |
| TS-08 | Ensure the cart item count updates correctly | REQ-07 |
| TS-09 | Test removing products from the shopping cart | REQ-08 |
| TS-10 | Validate checkout completion with valid data | REQ-09 |
| TS-11 | Check checkout form validation for incomplete submissions | REQ-10 |
| TS-12 | Confirm that the cart is emptied after a completed order | REQ-11 |

## API Testing

| ID | Test Scenario | Requirement ID |
|---|---|---|
| TS-13 | Test core product API operations (retrieve, create, update, delete) | API-REQ-01–05 |
| TS-14 | Check category listing and filtering endpoints | API-REQ-06–07 |
| TS-15 | Validate API authentication for valid and invalid credentials | API-REQ-08 |
| TS-16 | Test user and cart data retrieval endpoints | API-REQ-09–10 |

## Database Testing

| ID | Test Scenario | Requirement ID |
|---|---|---|
| TS-17 | Check core data storage and relationships (users, products, orders) | DB-REQ-01–04 |
| TS-18 | Validate order status consistency between the UI and the database | DB-REQ-05 |

## Non-Functional & Exploratory

| ID | Test Scenario | Related Area |
|---|---|---|
| TS-19 | Test cross-browser consistency of core user flows | Compatibility |
| TS-20 | Conduct exploratory session covering usability, accessibility, and edge cases (including empty-cart checkout) | Exploratory |
