# Test Plan — CartRight Retail

## Scope

### In Scope

- **User Authentication** — REQ-01, REQ-02, REQ-03, REQ-12
- **Product Listing & Sorting** — REQ-04, REQ-05
- **Shopping Cart** — REQ-06, REQ-07, REQ-08
- **Checkout Flow** — REQ-09, REQ-10, REQ-11
- **API Testing** — API-REQ-01 through API-REQ-10
- **Database Testing** — DB-REQ-01 through DB-REQ-05

The testing will cover both positive and negative scenarios where applicable.

### Out of Scope

- Real payment processing — SauceDemo's checkout form only collects and validates input data; it does not connect to an actual payment gateway or process real transactions.
- Real customer data — all testing is performed using predefined test accounts and fictional data; no real personal or financial customer information is used or exposed.
- Backend/server-side code testing — testing is performed exclusively as black-box testing, without access to the application's source code or internal architecture.
- Advanced security or penetration testing — this project is scoped for a Junior Manual QA level.
- Load and stress testing with multiple concurrent users — testing is performed manually by a single tester.
- Production monitoring and infrastructure testing — this project is a QA testing exercise, not a live production system; infrastructure and monitoring are typically owned by DevOps/Infrastructure roles, not QA.
- Mobile application testing — testing is performed on desktop browsers only (see Test Environment section); no native or mobile-responsive testing is included at this stage.
