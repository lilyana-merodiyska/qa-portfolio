# Cross-Browser Testing - CartRight Retail

**Scenario:** TS-19 (application works in more than one browser)
**Approach (see Test Plan - Risks):** the full suite is executed in Chrome (primary browser); the core user flow is re-checked in Firefox instead of repeating every test case.

| | |
|---|---|
| **Date** | 2026-10-07 |
| **OS** | Windows |
| **Application** | https://www.saucedemo.com |
| **Test account** | standard_user |
| **Browsers** | Chrome (primary), Firefox |

## Results

| Test case | Title | Chrome | Firefox |
|---|---|---|---|
| TC-01 | Login with valid credentials | Pass | Pass |
| TC-23 | Add one product to the cart from the product list | Pass | Pass |
| TC-31 | Complete checkout with valid data (end-to-end) | Pass | Pass |

## Conclusion
The core flow (login → add to cart → checkout) behaves the same in Chrome and Firefox. No browser-specific defects were found.

## Limitations
- Safari was not tested: it is available only on macOS, and testing was done on Windows.
- Only the core flow was checked in Firefox, not the whole suite.
