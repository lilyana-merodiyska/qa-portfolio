# Test Plan — CartRight Retail

## Scope

### In Scope

- **User Authentication** - REQ-01, REQ-02, REQ-03, REQ-12
- **Product Listing & Sorting** - REQ-04, REQ-05
- **Shopping Cart** - REQ-06, REQ-07, REQ-08
- **Checkout Flow** - REQ-09, REQ-10, REQ-11
- **API Testing** - API-REQ-01 through API-REQ-10
- **Database Testing** - DB-REQ-01 through DB-REQ-05

The testing will cover both positive and negative scenarios where applicable.

### Out of Scope

- Real payment processing - SauceDemo's checkout form only collects and validates input data; it does not connect to an actual payment gateway or process real transactions.
- Real customer data - all testing is performed using predefined test accounts and fictional data; no real personal or financial customer information is used or exposed.
- Backend/server-side code testing - testing is performed exclusively as black-box testing, without access to the application's source code or internal architecture.
- Advanced security or penetration testing - this project is scoped for a Junior Manual QA level.
- Load and stress testing with multiple concurrent users - testing is performed manually by a single tester.
- Production monitoring and infrastructure testing - this project is a QA testing exercise, not a live production system; infrastructure and monitoring are typically owned by DevOps/Infrastructure roles, not QA.
- Mobile application testing - testing is performed on desktop browsers only (see Test Environment section); no native or mobile-responsive testing is included at this stage.


## Test Approach / Strategy

**Overall approach:** A combination of requirements-based (analytical) testing,
since all test design starts from the documented requirements, and a
dynamic/heuristic approach for the exploratory testing sessions on the cart
and checkout flow.

Testing will be performed using a black-box approach, without access to the
application's source code or internal architecture.

**Testing type:** Manual testing (no automation for this phase).

**Test Types:**
- Functional Testing — covering all in-scope functional areas (see Scope
  section)
- Non-Functional Testing:
  - Usability
  - Compatibility (cross-browser)
  - Accessibility (basic)
  - Performance (basic observation only, not load/stress testing)
  - Security (basic — e.g. verifying that error messages don't reveal
    whether a username exists)

**Testing methods applied:**
- Positive testing - verifying core flows work as expected with valid data
  (login, product browsing, cart, checkout)
- Negative testing - invalid credentials and locked account behavior
  (REQ-02, REQ-03), and checkout form validation with missing/invalid
  fields (REQ-10)
- Boundary Value Analysis - zip code field in the checkout form
- Equivalence Partitioning - login fields (valid, invalid, empty
  username/password combinations)
- Decision Table Testing - login form, since different combinations of
  empty/invalid username and password fields, plus locked account status,
  produce distinct error messages (full decision table documented in
  Section 04)
- State Transition Testing - shopping cart state changes (empty → has
  items → checkout → empty again)

**Additional testing activities during execution:**
- Smoke Testing - performed before each major test execution session, to
  verify basic application stability (detailed suite in Section 12)
- Sanity Testing - performed after each bug fix, to quickly verify the
  specific fixed area (detailed suite in Section 12)
- Regression Testing - performed after fixes, to verify surrounding
  functionality remains unaffected (detailed in Section 12)
- Exploratory Testing - performed as a separate, timeboxed session
  (detailed in Section 08)

## Test Environment

### Application
**Application:** CartRight Retail
**Test URL:** https://www.saucedemo.com

### Operating System
Windows

### Browsers
- Google Chrome (primary)
- Mozilla Firefox(cross-browser check of core flows)


### Test Accounts
See `requirements.md` for the full list of test accounts and credentials.

### Testing Tools
- TestRail - test case management and execution
- Jira - defect reporting and tracking
- Postman - API testing (DummyJSON API)
- SQLite (via sqliteonline.com) - database testing (simulated schema)
- GitHub — project documentation


## Entry Criteria

Testing can begin when:

- The `requirements.md` file (including API and Database requirements) has been reviewed and finalized.
- The test environment is available: https://www.saucedemo.com and https://dummyjson.com are accessible, and Chrome, Firefox are available for testing.
- All test accounts (`standard_user`, `locked_out_user`, `problem_user`) have been verified and are working as expected.
- Test cases covering the planned scope have been written and are ready for execution.
- All required testing tools (TestRail, Jira, Postman, SQLite) are set up and accessible.

## Exit Criteria

Testing can be considered complete when:

- All planned test cases have been executed.
- No open Critical or High severity defects remain unresolved.
- All retesting and regression testing activities have been completed.
- The Test Summary Report has been finalized.

  ## Risks

| Risk | Impact | Mitigation |
|---|---|---|
| Test environment is unavailable | High | Verify environment availability before execution |
| Predefined test accounts become unavailable | High | Verify all accounts before testing; if an account is unavailable, continue testing with the remaining accounts and document the limitation in the Test Summary Report |
| Being the sole tester increases the risk of overlooking issues that a team with multiple testers might catch through cross-checking | Medium | Apply structured test design techniques (Equivalence Partitioning, Boundary Value Analysis, Decision Table Testing) to reduce reliance on ad-hoc judgment, maintain full requirements-to-test-case traceability to ensure no requirement is missed, and dedicate separate exploratory testing sessions specifically to catch issues that scripted test cases might not reveal |
| Undetected browser-specific behavior (e.g. layout issues, buttons or elements rendering incorrectly, or functionality not responding as expected in one browser but not others) | Medium | Execute the full test suite in Chrome as the primary browser; perform a focused cross-browser check of the core user flows (login, add to cart, checkout) in Firefox , rather than repeating every test case in all three browsers |
| The SQL database schema is simulated and not actually connected to SauceDemo, so database queries demonstrate methodology rather than verifying real data consistency between the UI and a live database | Medium | Clearly document this limitation in the Test Summary Report, framing the SQL section as a demonstration of database testing skills and query-writing ability rather than a claim of end-to-end UI-to-database verification |

## Roles and Responsibilities

### QA Tester

**Role:** Manual QA Tester

**Responsibilities:**
- Review and analyze requirements
- Design test scenarios and test cases
- Apply appropriate test design techniques
- Execute test cases
- Perform exploratory testing
- Report defects in Jira
- Retest fixed defects
- Perform regression testing
- Document test results
- Prepare the final Test Summary Report

**Tester:** Lilyana Merodiyska

## Test Deliverables

- Requirements document
- Test Plan
- Test Design Technique examples (Equivalence Partitioning, Boundary Value Analysis, Decision Table, State Transition)
- Test Cases (in TestRail)
- Test Execution results
- Bug Reports (in Jira)
- Exploratory Testing session report
- Regression/Smoke/Sanity test suites
- Test Summary Report

## Traceability

Requirements are linked to their corresponding test cases to ensure full
coverage of the planned scope.

Example: `REQ-01 → TC-01, TC-02, TC-03`

Defects identified during execution are linked to the test case that
uncovered them.

Example: `TC-15 → FAIL → BUG-001 → RETEST → PASS`
