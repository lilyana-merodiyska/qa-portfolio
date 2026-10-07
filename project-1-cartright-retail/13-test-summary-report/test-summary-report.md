# Test Summary Report — CartRight Retail

| | |
|---|---|
| **Project** | CartRight Retail (web app: https://www.saucedemo.com; API: https://dummyjson.com) |
| **Prepared by** | Lilyana Merodiyska |
| **Report date** | 2026-10-07 |
| **Testing period** | 2026-10-06 - 2026-10-07 |
| **Tools** | TestRail, Jira, Postman, SQLite, Chrome, Firefox |

## 1. Summary
Functional UI testing, database testing, basic non-functional checks and two exploratory sessions were completed. **6 defects** were found and all are still open. **API testing was completed** on DummyJSON: the originally planned Fake Store API was unavailable (HTTP 521 - web server is down), so the API requirements were mapped to the equivalent DummyJSON endpoints.

## 2. Test execution results

| Area | Test cases | Executed | Passed | Failed | Not executed |
|---|---|---|---|---|---|
| Authentication | 15 | 15 | 15 | 0 | 0 |
| Products and sorting | 7 | 7 | 6 | 1 | 0 |
| Shopping cart | 8 | 8 | 8 | 0 | 0 |
| Checkout | 12 | 12 | 11 | 1 | 0 |
| **UI total** | **42** | **42** | **40** | **2** | **0** |
| Database (SQL) | 7 | 7 | 7 | 0 | 0 |
| API (Postman, DummyJSON) | 12 | 12 | 12 | 0 | 0 |
| **Total** | **61** | **61** | **59** | **2** | **0** |

- Execution: 61 of 61 test cases (100%).
- Pass rate: 59 of 61 (97%).

Details: `06-functional-testing`, `09-api-testing`, `10-sql-queries`.

## 3. Other testing performed
- **Non-functional:** 6 basic checks (security, performance observation, accessibility, usability, compatibility) - all passed. See `07-non-functional-testing`.
- **Exploratory:** two timeboxed sessions. Session 1 (`standard_user`): 1 defect and 1 observation (the checkout form accepts whitespace-only names and a postal code with letters/symbols; the requirements do not define the format). Session 2 (`problem_user`): 4 defects. See `08-exploratory-testing`.
- **Cross-browser:** core flow (TC-01, TC-23, TC-31) passed in Chrome and Firefox.

## 4. Defects

| Bug | Jira | Title | Severity | Priority | Found in | Status |
|---|---|---|---|---|---|---|
| [BUG-001](../11-bug-reports/BUG-001-wrong-tshirt-image.md) | CR-1 | Wrong image for "Test.allTheThings() T-Shirt (Red)" | Medium | Medium | TC-17 | Open (retest failed) |
| [BUG-002](../11-bug-reports/BUG-002-checkout-with-empty-cart.md) | CR-3 | Order can be completed with an empty cart | High | Medium | TC-41 | Open (retest failed) |
| [BUG-003](../11-bug-reports/BUG-003-problem-user-same-image.md) | CR-4 | All products show the same dog image (problem_user) | Medium | Medium | Exploratory | Open |
| [BUG-004](../11-bug-reports/BUG-004-problem-user-sorting.md) | CR-5 | Product sorting does not work (problem_user) | High | Medium | Exploratory | Open |
| [BUG-005](../11-bug-reports/BUG-005-problem-user-add-to-cart.md) | CR-6 | "Add to cart" does nothing for some products (problem_user) | High | High | Exploratory | Open |
| [BUG-006](../11-bug-reports/BUG-006-problem-user-remove-on-products-page.md) | CR-7 | "Remove" on the Products page does not remove products (problem_user) | Medium | Medium | Exploratory | Open |

Open defects by severity: High 3, Medium 3, Critical 0, Low 0. The retest of BUG-001 and BUG-002 failed (see `12-execution-retest-regression`). BUG-003 to BUG-006 were found on 2026-10-07 with the `problem_user` account and have not been retested yet.

## 5. Exit criteria (from the Test Plan)

| Criterion | Status |
|---|---|
| All planned test cases have been executed | Met - 61 of 61 executed |
| No open Critical or High defects | **Not met** - BUG-002, BUG-004 and BUG-005 (High) are open |
| Retesting and regression activities completed | Met - retest done; no regression cycle needed because no fix was delivered |
| Test Summary Report finalized | Met - this document |

## 6. Limitations and risks
- **The API under test was changed** from Fake Store API to DummyJSON because of the outage (HTTP 521). DummyJSON is a mock: write operations (POST/PUT/DELETE) return a success response but are not persisted (documented in `09-api-testing`).
- API observation: `GET /users/1` returns password, card number and SSN in plain text (fictional data; a security concern on a real system).
- **The database is simulated** and not connected to SauceDemo, so the SQL tests demonstrate database testing methodology, not real UI-to-database consistency.
- Safari was not tested (Windows only); Firefox was checked only for the core flow.
- `standard_user` was used for the scripted test cases. `problem_user` was tested only in a short exploratory session (products page and cart); its checkout and login were not tested.
- Performance and accessibility were checked by basic observation only.

## 7. Conclusion and recommendation
The core user flows (login, product listing and sorting, cart, checkout) work as specified for `standard_user`. The `problem_user` account shows 4 additional defects (images, sorting, add to cart, remove). **The application is not recommended for release until the High defects (BUG-002, BUG-004, BUG-005) are fixed.** BUG-001, BUG-003 and BUG-006 are lower impact and could follow in a later release.

## 8. Next steps
1. Retest all defects (BUG-001 to BUG-006) after fixes and run the regression suite.
2. Clarify the checkout form validation rules with the product owner.
