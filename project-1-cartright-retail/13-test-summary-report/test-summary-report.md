# Test Summary Report — CartRight Retail

| | |
|---|---|
| **Project** | CartRight Retail (web app: https://www.saucedemo.com; API: https://fakestoreapi.com) |
| **Prepared by** | Lilyana Merodiyska |
| **Report date** | 2026-10-07 |
| **Testing period** | 2026-10-06 - 2026-10-07 |
| **Tools** | TestRail, Jira, Postman, SQLite, Chrome, Firefox |

## 1. Summary
Functional UI testing, database testing, basic non-functional checks and an exploratory session were completed. **2 defects** were found and both are still open. **API testing was not executed**: the Fake Store API was unavailable (HTTP 521 - web server is down) during the testing window.

## 2. Test execution results

| Area | Test cases | Executed | Passed | Failed | Not executed |
|---|---|---|---|---|---|
| Authentication | 15 | 15 | 15 | 0 | 0 |
| Products and sorting | 7 | 7 | 6 | 1 | 0 |
| Shopping cart | 8 | 8 | 8 | 0 | 0 |
| Checkout | 12 | 12 | 11 | 1 | 0 |
| **UI total** | **42** | **42** | **40** | **2** | **0** |
| Database (SQL) | 7 | 7 | 7 | 0 | 0 |
| API (Postman) | 12 | 0 | 0 | 0 | 12 |
| **Total** | **61** | **49** | **47** | **2** | **12** |

- Execution: 49 of 61 test cases (80%).
- Pass rate of executed test cases: 47 of 49 (96%).

Details: `06-functional-testing`, `10-sql-queries`.

## 3. Other testing performed
- **Non-functional:** 6 basic checks (security, performance observation, accessibility, usability, compatibility) - all passed. See `07-non-functional-testing`.
- **Exploratory:** one timeboxed session; 1 defect, 1 observation (the checkout form accepts whitespace-only names and a postal code with letters/symbols; the requirements do not define the format). See `08-exploratory-testing`.
- **Cross-browser:** core flow (TC-01, TC-23, TC-31) passed in Chrome and Firefox.

## 4. Defects

| Bug | Jira | Title | Severity | Priority | Found in | Status |
|---|---|---|---|---|---|---|
| [BUG-001](../11-bug-reports/BUG-001-wrong-tshirt-image.md) | CR-1 | Wrong image for "Test.allTheThings() T-Shirt (Red)" | Medium | Medium | TC-17 | Open (retest failed) |
| [BUG-002](../11-bug-reports/BUG-002-checkout-with-empty-cart.md) | CR-3 | Order can be completed with an empty cart | High | Medium | TC-41 | Open (retest failed) |

Open defects by severity: High 1, Medium 1, Critical 0, Low 0. The retest of both defects failed (see `12-execution-retest-regression`).

## 5. Exit criteria (from the Test Plan)

| Criterion | Status |
|---|---|
| All planned test cases have been executed | **Not met** - 12 API test cases not executed |
| No open Critical or High defects | **Not met** - BUG-002 (High) is open |
| Retesting and regression activities completed | Met - retest done; no regression cycle needed because no fix was delivered |
| Test Summary Report finalized | Met - this document |

## 6. Limitations and risks
- **API testing not executed** because of the unavailable service. The Fake Store API is also a mock: write operations (POST/PUT/DELETE) return a fabricated success response and are not persisted, which must be documented once API testing is done.
- **The database is simulated** and not connected to SauceDemo, so the SQL tests demonstrate database testing methodology, not real UI-to-database consistency.
- Safari was not tested (Windows only); Firefox was checked only for the core flow.
- Only `standard_user` was used for most scenarios; `problem_user` was not tested in depth.
- Performance and accessibility were checked by basic observation only.

## 7. Conclusion and recommendation
The core user flows (login, product listing and sorting, cart, checkout) work as specified, with two defects. **The application is not recommended for release until BUG-002 (High) is fixed and the API tests are executed.** BUG-001 is a minor visual defect and could be fixed in a later release.

## 8. Next steps
1. Execute the 12 API test cases when the service is available and add the results to `09-api-testing`.
2. Retest BUG-001 and BUG-002 after fixes and run the regression suite.
3. Clarify the checkout form validation rules with the product owner.
