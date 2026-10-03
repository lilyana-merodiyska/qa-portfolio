# Decision Table Testing — Login Form

## What is Decision Table Testing

Decision Table Testing is a black-box test design technique used when a
system's behavior depends on a **combination** of multiple conditions,
rather than a single input in isolation. It is especially useful when
different combinations of conditions produce **distinct outcomes**, since
it makes the decision logic explicit and visible, rather than relying on
separate, disconnected test cases.

## Why This Technique Applies Here

The SauceDemo login form was tested with Equivalence Partitioning first
(see `equivalence-partitioning.md`), which identified valid/invalid input
classes for the username and password fields individually. However,
manual exploration of the application revealed that different
**combinations** of empty/invalid credentials and account status produce
**distinct, specific error messages** — this combinational behavior is
exactly what Decision Table Testing is designed to capture.

## Conditions

- Username empty?
- Password empty?
- Credentials valid (do they match a known user)?
- Account locked?

## Decision Table

| Rule | Username empty? | Password empty? | Credentials valid? | Account locked? | Expected Result |
|---|---|---|---|---|---|
| R1 | Y | - | - | - | `Epic sadface: Username is required` |
| R2 | N | Y | - | - | `Epic sadface: Password is required` |
| R3 | N | N | N | - | `Epic sadface: Username and password do not match any user in this service` |
| R4 | N | N | Y | Y | `Epic sadface: Sorry, this user has been locked out.` |
| R5 | N | N | Y | N | User is redirected to the products page (successful login) |

*(`-` indicates the condition is not evaluated, because an earlier
condition in the rule already determines the outcome.)*

## Test Cases Derived From This Table

| Test Case ID | Username | Password | Expected Result |
|---|---|---|---|
| TC-DT-01 | *(empty)* | *(empty)* | `Epic sadface: Username is required` |
| TC-DT-02 | standard_user | *(empty)* | `Epic sadface: Password is required` |
| TC-DT-03 | invaliduser | invalidpass123 | `Epic sadface: Username and password do not match any user in this service` |
| TC-DT-04 | locked_out_user | secret_sauce | `Epic sadface: Sorry, this user has been locked out.` |
| TC-DT-05 | standard_user | secret_sauce | User is redirected to the products page |

## Notes

- Rules R3 and R4 are the key insight of this table: both involve
  non-empty username and password fields, but produce **different**
  outcomes depending on whether the credentials match a known user
  first, and whether that account is locked. This priority/order of
  evaluation would not be visible through Equivalence Partitioning
  alone, which tests each field independently.
- TC-DT-05 is the only positive test case in this table; TC-DT-01
  through TC-DT-04 are negative test cases — demonstrating how
  positive/negative testing is applied *through* the technique, not as
  a separate technique itself.
