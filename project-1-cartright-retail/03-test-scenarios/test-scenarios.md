# Test Scenarios — CartRight Retail

## 1. Web Application

| ID    | Test Scenario                                                               | Requirement ID | Priority |
| ----- | --------------------------------------------------------------------------- | -------------- | -------- |
| TS-01 | Verify user authentication and access with valid and invalid credentials    | REQ-01, REQ-02 | High     |
| TS-02 | Confirm locked account handling and access restrictions                     | REQ-03         | High     |
| TS-03 | Check logout functionality and post-logout access                           | REQ-12         | Medium   |
| TS-04 | Verify product catalog availability and displayed product information       | REQ-04         | High     |
| TS-05 | Check product sorting by name and price                                     | REQ-05         | Medium   |
| TS-06 | Confirm product details and navigation between product views                | REQ-04, REQ-06 | Medium   |
| TS-07 | Verify adding products to the shopping cart                                 | REQ-06         | High     |
| TS-08 | Check cart item count and cart contents                                     | REQ-07         | High     |
| TS-09 | Confirm removing products from the shopping cart                            | REQ-08         | High     |
| TS-10 | Verify the checkout process from cart to order confirmation                 | REQ-09         | High     |
| TS-11 | Check checkout form validation and required information                     | REQ-10         | High     |
| TS-12 | Confirm order information during the review and completion stages           | REQ-09         | High     |
| TS-13 | Ensure the cart is cleared after successful order completion                | REQ-11         | High     |
| TS-14 | Assess main application functionality across supported browsers             | REQ-01–REQ-12  | Medium   |
| TS-15 | Check usability and accessibility of the main user flows                    | REQ-01–REQ-12  | Medium   |
| TS-16 | Perform exploratory testing of the complete shopping journey and edge cases | REQ-01–REQ-12  | Medium   |

---

## 2. API Testing — Fake Store API

| ID    | Test Scenario                                                                    | Requirement ID        | Priority |
| ----- | -------------------------------------------------------------------------------- | --------------------- | -------- |
| TS-17 | Verify product API operations including retrieval, creation, update and deletion | API-REQ-01–API-REQ-05 | High     |
| TS-18 | Check product category, filtering, authentication and user data endpoints        | API-REQ-06–API-REQ-09 | High     |
| TS-19 | Confirm cart retrieval and API response behavior for valid and invalid requests  | API-REQ-10            | Medium   |

**Note:** Write operations on Fake Store API return simulated success responses but do not persist changes. Test Cases will explicitly distinguish between response validation and actual data persistence.

---

## 3. Database Testing — Simulated Schema

| ID    | Test Scenario                                                                           | Requirement ID       | Priority |
| ----- | --------------------------------------------------------------------------------------- | -------------------- | -------- |
| TS-20 | Verify user, product and order data storage and relationships                           | DB-REQ-01–DB-REQ-03  | High     |
| TS-21 | Check order item relationships, data integrity and consistency with the completed order | DB-REQ-04, DB-REQ-05 | High     |

---



