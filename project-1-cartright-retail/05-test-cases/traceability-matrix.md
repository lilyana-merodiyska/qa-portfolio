# Traceability Matrix: Requirements → Test Scenarios → Test Cases

Chain: **Requirement (01) → Test Scenario (03) → Test Case (05)**. Each test case references its scenario; the requirement is reached through the scenario.

| Test Scenario | Scenario description | Requirement | Test Cases | Count |
|---|---|---|---|---|
| TS-01 | Check login behavior with valid credentials | REQ-01 | TC-01, TC-10, TC-12 | 3 |
| TS-02 | Confirm that login is rejected for invalid credentials | REQ-02 | TC-02, TC-03, TC-04, TC-05, TC-06, TC-07, TC-09, TC-11 | 8 |
| TS-03 | Validate that a locked-out account cannot log in | REQ-03 | TC-08 | 1 |
| TS-04 | Test logout and session termination | REQ-12 | TC-13, TC-14, TC-15 | 3 |
| TS-05 | Confirm correct product listing display after login | REQ-04 | TC-16, TC-17, TC-22 | 3 |
| TS-06 | Check product sorting by name and by price | REQ-05 | TC-18, TC-19, TC-20, TC-21 | 4 |
| TS-07 | Test adding products to the shopping cart | REQ-06 | TC-23, TC-25, TC-26 | 3 |
| TS-08 | Ensure the cart item count updates correctly | REQ-07 | TC-24, TC-30 | 2 |
| TS-09 | Test removing products from the shopping cart | REQ-08 | TC-27, TC-28, TC-29 | 3 |
| TS-10 | Validate checkout completion with valid data | REQ-09 | TC-31, TC-32, TC-37, TC-38 | 4 |
| TS-11 | Check checkout form validation for incomplete submissions | REQ-10 | TC-33, TC-34, TC-35, TC-36, TC-42 | 5 |
| TS-12 | Confirm that the cart is emptied after a completed order | REQ-11 | TC-39, TC-40 | 2 |
| TS-13 | Test core product API operations (retrieve, create, update, delete) | API-REQ-01-05 | TC-43, TC-44, TC-45, TC-47, TC-49, TC-51 | 6 |
| TS-14 | Check category listing and filtering endpoints | API-REQ-06-07 | TC-52, TC-53 | 2 |
| TS-15 | Validate API authentication for valid and invalid credentials | API-REQ-08 | TC-55, TC-56 | 2 |
| TS-16 | Test user and cart data retrieval endpoints | API-REQ-09-10 | TC-58, TC-60 | 2 |
| TS-17 | Check core data storage and relationships (users, products, orders) | DB-REQ-01-04 | TC-62, TC-63, TC-64, TC-65, TC-66, TC-67 | 6 |
| TS-18 | Validate order status consistency between the UI and the database | DB-REQ-05 | TC-68 | 1 |
| TS-19 | Test cross-browser consistency of core user flows | Compatibility | **NO TEST CASES YET** | 0 |
| TS-20 | Conduct exploratory session covering usability, accessibility, and edge cases | Exploratory | TC-41 | 1 |

**Scenarios without test cases:** TS-19

> **TS-19 (cross-browser):** no separate test cases. Per the Test Plan, the core flows (TC-01 login, TC-23 add to cart, TC-31 checkout) are re-executed in Firefox and Safari; results are recorded as additional runs in TestRail.

## Requirement coverage (derived)

| Requirement | Test Cases |
|---|---|
| REQ-01 | TC-01, TC-10, TC-12 |
| REQ-02 | TC-02, TC-03, TC-04, TC-05, TC-06, TC-07, TC-09, TC-11 |
| REQ-03 | TC-08 |
| REQ-04 | TC-16, TC-17, TC-22 |
| REQ-05 | TC-18, TC-19, TC-20, TC-21 |
| REQ-06 | TC-23, TC-25, TC-26 |
| REQ-07 | TC-23, TC-24, TC-27, TC-28, TC-29, TC-30 |
| REQ-08 | TC-27, TC-28, TC-29 |
| REQ-09 | TC-31, TC-32, TC-37, TC-38, TC-41 |
| REQ-10 | TC-33, TC-34, TC-35, TC-36, TC-42 |
| REQ-11 | TC-39, TC-40 |
| REQ-12 | TC-13, TC-14, TC-15 |
| API-REQ-01 | TC-43 |
| API-REQ-02 | TC-44, TC-45 |
| API-REQ-03 | TC-47 |
| API-REQ-04 | TC-49 |
| API-REQ-05 | TC-51 |
| API-REQ-06 | TC-52 |
| API-REQ-07 | TC-53 |
| API-REQ-08 | TC-55, TC-56 |
| API-REQ-09 | TC-58 |
| API-REQ-10 | TC-60 |
| DB-REQ-01 | TC-62 |
| DB-REQ-02 | TC-63 |
| DB-REQ-03 | TC-64, TC-66 |
| DB-REQ-04 | TC-65, TC-66, TC-67 |
| DB-REQ-05 | TC-68 |

**Uncovered requirements:** none

Defects found during execution are linked as: `TC-xx → FAIL → BUG-xxx → RETEST → PASS`.
