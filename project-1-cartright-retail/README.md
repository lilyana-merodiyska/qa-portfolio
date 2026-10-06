# CartRight Retail — QA Portfolio Project

A manual QA project that follows the full testing process: from requirements to the final test summary report. The testing is done on the public demo web shop [SauceDemo](https://www.saucedemo.com) (treated as "CartRight Retail"), the [Fake Store API](https://fakestoreapi.com) and a simulated SQL database.

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
| [08-exploratory-testing](08-exploratory-testing) | Exploratory session report |
| 09-api-testing | *In progress* (see Status) |
| [10-sql-queries](10-sql-queries) | Database schema, SQL queries and results |
| [11-bug-reports](11-bug-reports) | Defect reports with screenshots |
| [12-execution-retest-regression](12-execution-retest-regression) | Defect retest, smoke / sanity / regression suites |
| [13-test-summary-report](13-test-summary-report) | Final report with metrics and recommendation |

## Results at a glance

| | |
|---|---|
| Test cases | 61 (49 executed, 47 passed, 2 failed) |
| Defects found | 2 (1 High, 1 Medium), both still open |
| Test techniques | Equivalence Partitioning, Boundary Value Analysis, Decision Table, State Transition |
| Other testing | Exploratory, cross-browser (Chrome, Firefox), basic non-functional, SQL |

Defects found:
- [BUG-001](11-bug-reports/BUG-001-wrong-tshirt-image.md) (CR-1) - wrong image for "Test.allTheThings() T-Shirt (Red)"
- [BUG-002](11-bug-reports/BUG-002-checkout-with-empty-cart.md) (CR-3) - an order can be completed with an empty cart

## Status and limitations
- **API testing (12 test cases) is not executed yet**: the Fake Store API was unavailable during the testing window.
- The SQL database is simulated and is not connected to SauceDemo; it demonstrates database testing methodology.
- Safari was not tested (testing was done on Windows).

Full details: [Test Summary Report](13-test-summary-report/test-summary-report.md).
