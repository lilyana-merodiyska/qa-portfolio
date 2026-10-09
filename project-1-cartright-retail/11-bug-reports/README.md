# Bug Reports - CartRight Retail

Defects are logged in **Jira** (one issue per defect); this folder holds the portfolio copy of each report
plus its screenshots, so the evidence is visible on GitHub.


## Naming and linking

- Defect ID: `BUG-001`, `BUG-002`, ... (use the same number as the Jira key where possible, e.g. `CR-1`)
- Screenshot: `BUG-001-<short-description>.png` — one screenshot per key observation (actual result, console/network if relevant)
- Link chain (see Test Plan - Traceability): `TC-xx → FAIL → BUG-xxx → RETEST → PASS`
- Every defect is logged **from the failed test in TestRail** (Push Defects / "Add Result → Defects" field), so the case and the Jira issue are linked.

## Severity vs. Priority

| | Meaning | Who decides |
|---|---|---|
| **Severity** | How badly the defect affects the system/function (technical impact) | QA |
| **Priority** | How soon it should be fixed (business urgency) | Product owner / team lead (QA proposes) |

| Severity | Example in CartRight |
|---|---|
| Critical | Cannot log in at all / cannot complete an order |
| High | A core function gives wrong results (e.g. cart counter wrong, sorting does not work) |
| Medium | Feature works but with a noticeable flaw (e.g. wrong image on a product) |
| Low | Cosmetic issue, no functional impact |

## Bug index

| Bug ID | Jira key | Title | Severity | Priority | Found in (TC) | Status |
|---|---|---|---|---|---|---|
| [BUG-001](BUG-001-wrong-tshirt-image.md) | CR-1 | Product "Test.allTheThings() T-Shirt (Red)" displays an image of an orange long-sleeve shirt | Medium | Medium | TC-17 | Open |
| [BUG-002](BUG-002-checkout-with-empty-cart.md) | CR-3 | User can complete an order with an empty cart | High | Medium | TC-41 | Open |
| [BUG-003](BUG-003-problem-user-same-image.md) | CR-4 | All products show the same dog image (problem_user) | Medium | Medium | Exploratory (TC-16/17) | Open |
| [BUG-004](BUG-004-problem-user-sorting.md) | CR-5 | Product sorting does not work (problem_user) | High | Medium | Exploratory (TC-19/20) | Open |
| [BUG-005](BUG-005-problem-user-add-to-cart.md) | CR-6 | "Add to cart" does nothing for some products (problem_user) | High | High | Exploratory (TC-23) | Open |
| [BUG-006](BUG-006-problem-user-remove-on-products-page.md) | CR-7 | "Remove" button on the Products page does not remove products (problem_user) | Medium | Medium | Exploratory (TC-27) | Open |
| *(add a row after each defect is logged)* | | | | | | |

## Jira screenshots

![Bug list in Jira](screenshots/jira-bug-list.png)

![CR-3 in Jira](screenshots/jira-CR-3.png)
