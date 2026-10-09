# Boundary Value Analysis - Exploration Findings

## What is Boundary Value Analysis

Boundary Value Analysis is a black-box testing technique that tests the
edges of equivalence classes, based on the observation that errors are
more likely to occur at the boundaries of valid input ranges than in
the middle of them. It typically involves testing values at, just
below, and just above each boundary (e.g. minimum length, minimum
length minus one, minimum length plus one)

## Why This Technique Was Investigated

Boundary values are important to test because errors are statistically
more likely to occur at the edges of valid input ranges than within
them. In a production system, a field without proper length or format
validation could lead to serious issues: database storage errors,
broken UI rendering, degraded performance, or increased vulnerability
to security attacks (e.g. injection). For this reason, boundary testing
was applied across the checkout form and cart, even though the project
requirements do not explicitly define boundary limits.

## Fields Investigated

| Field | Expected Boundary Behavior | Actual Behavior Found |
|---|---|---|
| Checkout — Zip Code | A reasonable maximum length and numeric format validation | Accepts any input of any length and format; only "empty vs not empty" validation exists |
| Checkout — First Name | A reasonable maximum length | Accepts any input of any length; only "empty vs not empty" validation exists |
| Checkout — Last Name | A reasonable maximum length | Accepts any input of any length; only "empty vs not empty" validation exists |
| Cart — Item Quantity | A configurable quantity with a sensible upper limit | No quantity selector exists; each item is fixed at quantity 1, so this field could not be boundary-tested |

## Testing Observation

No field investigated in this application enforces meaningful length or
format restrictions beyond basic "required" validation. While this may
be an intentional simplification of a demo application, in a real
production system this would be considered a validation gap and a
potential risk — for example, an unrestricted zip code or name field
could accept excessively long input, leading to database, UI, or
security issues. This finding is documented here as a testing
observation rather than a defect, since it falls outside the explicitly
defined requirements, but it demonstrates the value of applying test
design techniques beyond what is formally specified.

