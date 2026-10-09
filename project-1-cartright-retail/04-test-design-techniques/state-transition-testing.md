# State Transition Testing - Shopping Cart

## What is State Transition Testing

State Transition Testing is a black-box test design technique that
models a system as a set of distinct states and the transitions between
them, triggered by specific user actions. Unlike techniques that focus
only on input values (such as Equivalence Partitioning), this technique
also considers the system's current state, since the same action can
produce different results depending on what state the system is in
beforehand. It also verifies that invalid transitions - actions that
should not be possible in a given state - are correctly prevented.

## States Identified

| State | Description |
|---|---|
| S0 - Empty Cart | The cart contains no items |
| S1 - Cart with Items | The cart contains one or more items |
| S2 - Checkout In Progress | The user has entered the checkout flow, items are still held in the cart |
| S3 - Order Completed | The order has been successfully placed |

## Valid Transitions

| From State | Action | To State |
|---|---|---|
| S0 | User clicks "Add to Cart" on a product | S1 |
| S1 | User removes the only item in the cart | S0 |
| S1 | User removes one of several items (others remain) | S1 (count decreases, state unchanged) |
| S1 | User clicks "Checkout" | S2 |
| S2 | User completes all checkout steps and clicks "Finish" | S3 |
| S3 | System automatically empties the cart (REQ-11) | S0 |
| S2 | User clicks "Cancel" (on the information step or on the order overview) | S1 (items are kept in the cart) |

## Invalid Transitions

These are actions that should **not** be possible in the given state. The test checks that the system prevents them.

| From State | Action | Expected behaviour |
|---|---|---|
| S0 - Empty Cart | User clicks "Checkout" | The system prevents checkout and shows a message (an order without items must not be possible) |
| S0 - Empty Cart | User tries to remove an item | Not possible: there is no item and no "Remove" button |
| S3 - Order Completed | User repeats the order (e.g. browser "Back" button, then "Finish" again) | The completed order is not repeated; the cart stays empty |
| S1 - Cart with Items | User opens the order confirmation without going through checkout | Not possible without completing the checkout steps |

## Test Cases Derived from the Transitions

| Transition | Test case | Result |
|---|---|---|
| S0 → S1: add a product | TC-23, TC-24 | Pass |
| S1 → S1: remove one of several items | TC-28 | Pass |
| S1 → S0: remove the only item | TC-29 | Pass |
| S1 → S2: click "Checkout" | TC-31 (step 1) | Pass |
| S2 → S3: complete all checkout steps | TC-31 | Pass |
| S2 → S1: cancel checkout | TC-37, TC-38 | Pass |
| S3 → S0: cart is emptied after the order | TC-39 | Pass |
| **Invalid:** S0 → S2, checkout with an empty cart | TC-41 | **Fail** - the system allows it, see [BUG-002](../11-bug-reports/BUG-002-checkout-with-empty-cart.md) (CR-3) |
| **Invalid:** S3, repeat the order with the browser "Back" button | Exploratory EX-03 | Pass - see `08-exploratory-testing` |

## Result
The valid transitions work as specified. One invalid transition is not prevented: the user can go from the empty-cart state straight to a completed order (BUG-002).
