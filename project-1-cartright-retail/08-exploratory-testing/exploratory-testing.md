# Exploratory Testing - CartRight Retail

Two timeboxed sessions: **Session 1** (checkout edge cases, `standard_user`) and **Session 2** (`problem_user`).

# Session 1 - Checkout edge cases

**Scenario:** TS-20 - Exploratory session covering usability, accessibility and edge cases (including empty-cart checkout)

## Session details

| | |
|---|---|
| **Date** | 2026-10-07 (empty-cart checkout was first found on 2026-10-06 while running TC-41) |
| **Tester** | Lilyana Merodiyska |
| **Timebox** | about 10 minutes |
| **Application** | https://www.saucedemo.com |
| **Browser / OS** | Chrome / Windows |
| **Test account** | standard_user |

## Charter
Explore the checkout flow and its edge cases with unusual input and unusual navigation, to find behaviour that the scripted test cases do not cover.

## Session notes

| # | What was tried | What happened | Assessment |
|---|---|---|---|
| EX-01 | Checkout with an **empty cart** (also covered by TC-41) | The whole flow can be completed; the order total is $0.00 | **Defect** - logged as [BUG-002](../11-bug-reports/BUG-002-checkout-with-empty-cart.md) (CR-3) |
| EX-02 | Checkout form with First Name = three spaces, Last Name = `<b>Test</b>`, Zip = `abc!@#` | No validation error; the user moves on to the Overview step | **Observation** - see below |
| EX-03 | Press the browser **Back** button after completing an order | The completed order is not repeated and the cart stays empty | Works as expected (REQ-11) |
| EX-04 | Open a product detail page with a non-existent id (`inventory-item.html?id=999`) | A clear "ITEM NOT FOUND" message is shown | Works as expected |

## Observation (not logged as a defect)
**EX-02:** the checkout form accepts whitespace-only names and a postal code with letters and symbols. REQ-10 only requires that all fields are filled in, and the requirements do not define the allowed format, so this is **not** a defect against the requirements.

**Recommendation:** clarify the validation rules with the product owner (for example: trim spaces, allow only valid characters in the postal code). If the rules are added, test cases based on equivalence partitioning and boundary values should be created for them.

## Summary
- 4 ideas explored; 1 defect (BUG-002), 1 observation with a recommendation, 2 behaviours confirmed as correct.
- Out of scope for this short session: other user accounts, mobile layouts, screen readers.

---

# Session 2 - `problem_user`

| | |
|---|---|
| **Date** | 2026-10-07 |
| **Tester** | Lilyana Merodiyska |
| **Timebox** | about 15 minutes |
| **Application** | https://www.saucedemo.com |
| **Browser / OS** | Chrome / Windows |
| **Test account** | problem_user |

## Charter
Explore the application as `problem_user` and find behaviour that differs from `standard_user`.

## Session notes

| # | What was tried | What happened | Assessment |
|---|---|---|---|
| EX2-01 | Look at the product images on the Products page | All 6 products show the same picture of a dog | **Defect** - [BUG-003](../11-bug-reports/BUG-003-problem-user-same-image.md) (CR-4) |
| EX2-02 | Sort by "Name (Z to A)" and "Price (low to high)" | The order does not change for either option | **Defect** - [BUG-004](../11-bug-reports/BUG-004-problem-user-sorting.md) (CR-5) |
| EX2-03 | Click "Add to cart" on all 6 products | Bike Light, Fleece Jacket and Test.allTheThings() T-Shirt (Red) are not added | **Defect** - [BUG-005](../11-bug-reports/BUG-005-problem-user-add-to-cart.md) (CR-6) |
| EX2-04 | Click "Remove" on the Products page for an added product | The product is not removed; "Remove" works only on the cart page | **Defect** - [BUG-006](../11-bug-reports/BUG-006-problem-user-remove-on-products-page.md) (CR-7) |

## Summary
- 4 ideas explored; 4 defects found (BUG-003 to BUG-006).
- Not explored in this session: checkout and login as `problem_user`, mobile layouts.
