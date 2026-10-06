# Execution, Retest and Regression — CartRight Retail

## 1. Retest of defects

| | |
|---|---|
| **Retest date** | 2026-10-07 |
| **Application** | https://www.saucedemo.com (third-party demo app, no new build is delivered) |
| **Browser / OS** | Chrome / Windows |
| **Test account** | standard_user |

| Defect | Jira | Failed test case | Retest steps | Result | Status |
|---|---|---|---|---|---|
| [BUG-001](../11-bug-reports/BUG-001-wrong-tshirt-image.md) - wrong image for "Test.allTheThings() T-Shirt (Red)" | CR-1 | TC-17 | Log in, open the Products page, check the image of the product | **FAIL** - the orange long-sleeve shirt image is still shown | Open |
| [BUG-002](../11-bug-reports/BUG-002-checkout-with-empty-cart.md) - order can be completed with an empty cart | CR-3 | TC-41 | Log in with an empty cart, go through Checkout and click Finish | **FAIL** - the order is still completed with a total of $0.00 | Open |

Both defects are reproducible on the current version of the application, so they stay **Open**. The retest result is recorded in the "Retest" table of each bug report.

## 2. Smoke, sanity and regression testing

The Test Plan defines these activities to be performed around builds and fixes. The application under test is a third-party site and **no new build or fix was delivered**, so no regression cycle was needed in this project. The suites below are defined so they can be executed as soon as a fix appears.

| Activity | When | Test cases |
|---|---|---|
| Smoke | Before each test session / on a new build | TC-01 (login), TC-23 (add to cart), TC-31 (checkout end-to-end) |
| Sanity | After each defect fix | Retest of the fixed defect only (TC-17 for BUG-001, TC-41 for BUG-002) |
| Regression | After fixes, to check that nothing else broke | Products and Cart runs (TC-16 ... TC-30) and the Checkout run (TC-31 ... TC-42) |

The three smoke test cases were also executed on 2026-10-07 in Chrome and Firefox (see `07-non-functional-testing/cross-browser-testing.md`) and passed.
