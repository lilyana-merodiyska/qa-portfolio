# CartRight Retail — QA Portfolio Project

A manual QA project that follows the full testing process: from requirements to the final test summary report. The testing is done on the public demo web shop [SauceDemo](https://www.saucedemo.com) (treated as "CartRight Retail"), the [DummyJSON API](https://dummyjson.com) and a simulated SQL database.

**Author:** Lilyana Merodiyska

## Tools
TestRail (test cases, runs) · Jira (defects) · Postman (API) · SQLite (database) · Chrome, Firefox · GitHub (documentation)

## Process

`Requirement → Test Scenario → Test Case → Execution → Bug → Retest`

Every test case is linked to a test scenario and every scenario to a requirement (see the [traceability matrix](05-test-cases/traceability-matrix.md)).

## Contents

| Folder | What is inside |
|---|---|
| [01-requirements](01-requirements) | Web, API and database requirements |
| [02-test-planning](02-test-planning) | Test Plan: scope, strategy, environment, entry/exit criteria, risks |
| [03-test-scenarios](03-test-scenarios) | 20 test scenarios linked to requirements |
| [04-test-design-techniques](04-test-design-techniques) | Equivalence Partitioning, Boundary Value Analysis, Decision Table, State Transition |
| [05-test-cases](05-test-cases) | 61 test cases and the traceability matrix |
| [06-functional-testing](06-functional-testing) | Execution results of the UI test cases |
| [07-non-functional-testing](07-non-functional-testing) | Basic non-functional checks and cross-browser testing |
| [08-exploratory-testing](08-exploratory-testing) | Two exploratory sessions (standard_user and problem_user) |
| [09-api-testing](09-api-testing) | Postman API tests with results and screenshots |
| [10-sql-queries](10-sql-queries) | Database schema, SQL queries and results |
| [11-bug-reports](11-bug-reports) | Defect reports with screenshots |
| [12-execution-retest-regression](12-execution-retest-regression) | Defect retest, smoke / sanity / regression suites |
| [13-test-summary-report](13-test-summary-report) | Final report with metrics and recommendation |

## Results at a glance

| | |
|---|---|
| Test cases | 61 (all executed: 59 passed, 2 failed) |
| Defects found | 6 (3 High, 3 Medium), all still open |
| Test techniques | Equivalence Partitioning, Boundary Value Analysis, Decision Table, State Transition |
| Other testing | Exploratory, cross-browser (Chrome, Firefox), basic non-functional, SQL |

Defects found:
- [BUG-001](11-bug-reports/BUG-001-wrong-tshirt-image.md) (CR-1) - wrong image for "Test.allTheThings() T-Shirt (Red)"
- [BUG-002](11-bug-reports/BUG-002-checkout-with-empty-cart.md) (CR-3) - an order can be completed with an empty cart
- [BUG-003](11-bug-reports/BUG-003-problem-user-same-image.md) (CR-4) - all products show the same image (problem_user)
- [BUG-004](11-bug-reports/BUG-004-problem-user-sorting.md) (CR-5) - sorting does not work (problem_user)
- [BUG-005](11-bug-reports/BUG-005-problem-user-add-to-cart.md) (CR-6) - "Add to cart" does nothing for some products (problem_user)
- [BUG-006](11-bug-reports/BUG-006-problem-user-remove-on-products-page.md) (CR-7) - "Remove" on the Products page does not work (problem_user)

## Status and limitations
- The API under test was changed from Fake Store API to **DummyJSON** because Fake Store API was down (HTTP 521) during testing. DummyJSON is a mock: write operations are not persisted.
- The SQL database is simulated and is not connected to SauceDemo; it demonstrates database testing methodology.
- Safari was not tested (testing was done on Windows).

Full details: [Test Summary Report](13-test-summary-report/test-summary-report.md).
