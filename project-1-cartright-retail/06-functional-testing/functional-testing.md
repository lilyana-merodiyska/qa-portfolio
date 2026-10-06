# Functional Testing — CartRight Retail

Execution of the functional test cases (UI) in TestRail. API and database testing are reported separately (folders 09 and 10).

| | |
|---|---|
| **Execution date** | 2026-10-06 |
| **Application** | https://www.saucedemo.com |
| **Browser / OS** | Chrome / Windows (cross-browser check: see `07-non-functional-testing`) |
| **Test accounts** | standard_user (main), locked_out_user (locked-account cases) |
| **Tool** | TestRail (one test run per feature area) |

## Results by test run

| Test run | Test cases | Passed | Failed | Untested | Pass rate |
|---|---|---|---|---|---|
| Run 1 - Authentication (Chrome) | 15 | 15 | 0 | 0 | 100% |
| Products Listing / Sorting | 7 | 6 | 1 | 0 | 86% |
| Shopping cart | 8 | 8 | 0 | 0 | 100% |
| Checkout | 12 | 11 | 1 | 0 | 92% |
| **Total (functional UI)** | **42** | **40** | **2** | **0** | **95%** |

## Failed test cases and defects

| Test case | Run | Defect | Jira | Severity / Priority |
|---|---|---|---|---|
| TC-17 | Products Listing / Sorting | [BUG-001](../11-bug-reports/BUG-001-wrong-tshirt-image.md) - wrong image for "Test.allTheThings() T-Shirt (Red)" | CR-1 | Medium / Medium |
| TC-41 | Checkout | [BUG-002](../11-bug-reports/BUG-002-checkout-with-empty-cart.md) - order can be completed with an empty cart | CR-3 | High / Medium |

Each failed case was linked to its Jira issue from TestRail (Defects field).

## Notes
- All other test cases behaved as expected.
- The retest of both defects is planned after a fix (see `12-execution-retest-regression`). Both defects are in third-party demo software, so a fix is not expected; they remain Open.
