# Equivalence Partitioning — Login Form

## What is Equivalence Partitioning

Equivalence Partitioning is a black-box test design technique that splits
the possible input data into valid and invalid partitions (classes). It
selects one representative value from each partition, based on the
assumption that the system will behave consistently for all values within
the same class — allowing thorough coverage without testing every
possible input value individually.

## Why This Technique Applies Here

The username and password fields technically accept an unlimited number
of possible character combinations, making it impractical to test every
possible value. Equivalence Partitioning addresses this by grouping the
infinite input space into a small number of logical classes, within
which the system is expected to behave consistently. Testing one
representative value from each class provides confidence that the
system handles the entire class correctly, without requiring exhaustive
testing of every possible input.

## Input Field: Username

| Partition | Description | Representative Value |
|---|---|---|
| Valid | An existing, correctly spelled username | standard_user |
| Invalid | A username that does not exist in the system | invaliduser123 |
| Empty | No value entered | *(empty)* |

## Input Field: Password

| Partition | Description | Representative Value |
|---|---|---|
| Valid | The correct password for the given username | secret_sauce |
| Invalid | An incorrect password for the given username | invalidpass123 |
| Empty | No value entered | *(empty)* |

## Test Cases Derived From This Technique

Following the Equivalence Partitioning principle, each test case varies
**only one** field to an invalid/empty partition at a time, while the
other field remains valid. Test cases combining multiple invalid
conditions at once (e.g. invalid username **and** invalid password
together, or the locked account scenario) are covered separately in
`decision-table-testing.md`, since that behavior depends on the
combination of conditions rather than a single field in isolation.

| Test Case ID | Username | Password | Expected Result |
|---|---|---|---|
| TC-EP-01 | standard_user (valid) | secret_sauce (valid) | User is redirected to the products page (successful login) |
| TC-EP-02 | invaliduser123 (invalid) | secret_sauce (valid) | `Epic sadface: Username and password do not match any user in this service` |
| TC-EP-03 | standard_user (valid) | invalidpass123 (invalid) | `Epic sadface: Username and password do not match any user in this service` |
| TC-EP-04 | *(empty)* | secret_sauce (valid) | `Epic sadface: Username is required` |
| TC-EP-05 | standard_user (valid) | *(empty)* | `Epic sadface: Password is required` |

**Note:** TC-EP-04 and TC-EP-05 intentionally overlap with rules R1 and R2
in `decision-table-testing.md`. This is expected: when the username or
password field is empty, the outcome depends on a single condition only
— the decision table's combinational logic effectively "collapses" to a
simple equivalence class in these two cases. The overlap confirms that
both techniques produce consistent expected results, rather than
indicating duplicated or conflicting test design.
