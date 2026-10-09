# BUG-006 - "Remove" button on the Products page does not remove products (problem_user)

| Field | Value |
|---|---|
| **Jira key** | CR-7 |
| **Reporter** | Lilyana Merodiyska |
| **Date reported** | 2026-10-07 |
| **Status** | Open |
| **Severity** | Medium |
| **Priority** | Medium |
| **Found in** | Exploratory session 2 (`problem_user`), related test case TC-27 |
| **Related scenario / requirement** | TS-09 / REQ-08 |
| **Environment** | https://www.saucedemo.com |
| **Browser / OS** | Chrome / Windows |
| **Test account** | problem_user |
| **Reproducibility** | Always |

## Description
After a product is added, the "Remove" button on the Products page does not remove it from the cart.

## Preconditions
- Logged in as `problem_user`
- The cart is empty

## Steps to reproduce
1. Open https://www.saucedemo.com
2. Log in as `problem_user` (password: `secret_sauce`)
3. On the Products page click "Add to cart" on Sauce Labs Backpack
4. Click "Remove" on the same product

## Expected result
The product is removed from the cart and the button changes back to "Add to cart" (REQ-08).

## Actual result
The product stays in the cart. It can be removed only from the cart page.

## Evidence
- See the cart screenshot in [BUG-005](BUG-005-problem-user-add-to-cart.md): `screenshots/BUG-005-problem-user-cart.png`

## Additional information
- With `standard_user` the product can be removed from the Products page (TC-27 passed).
- Workaround: remove the product on the cart page, so severity is Medium.

## Retest (fill in after the fix)
| Date | Build / Version | Result | Notes |
|---|---|---|---|
| | | PASS / FAIL | |
