# Non-Functional Testing — CartRight Retail

Basic non-functional checks, as defined in the Test Plan (Test Types): usability, compatibility, accessibility, performance (observation only) and basic security. These are lightweight checks performed manually in the browser, not full test suites.

| | |
|---|---|
| **Date** | 2026-10-07 |
| **Application** | https://www.saucedemo.com |
| **Browser / OS** | Chrome / Windows |
| **Test account** | standard_user |

## Results

| # | Type | Related scenario | Check | Expected result | Actual result | Result |
|---|---|---|---|---|---|---|
| NF-01 | Security | TS-02 (REQ-02) | Log in with an existing username + wrong password, then with a non-existing username + wrong password | Both attempts show the same generic error; the message does not reveal whether the username exists | Both show: "Epic sadface: Username and password do not match any user in this service" | Pass |
| NF-02 | Security | none (not defined in requirements) | Open `/inventory.html` directly without logging in | Access is denied and the user is sent to the login page with a message | Redirected to login: "Epic sadface: You can only access '/inventory.html' when you are logged in." | Pass |
| NF-03 | Performance (observation) | none (general observation) | Observe loading time of login, product page and cart | Pages load without noticeable delay (about 2 seconds or less) | All pages loaded quickly | Pass |
| NF-04 | Accessibility (basic) | TS-01 (REQ-01) | Log in using the keyboard only (Tab, Enter) | Focus moves through Username, Password and Login; Enter submits the form | Login completed with the keyboard only | Pass |
| NF-05 | Usability | TS-02 (REQ-02) | Check password masking and the message for empty fields | Password is hidden; empty submit shows a clear message | Password is masked; message: "Epic sadface: Username is required" | Pass |
| NF-06 | Compatibility | TS-19 | Core flow in Chrome and Firefox | Same behaviour in both browsers | See [cross-browser-testing.md](cross-browser-testing.md) | Pass |

## Traceability
Non-functional checks are not written as TestRail test cases, because the Test Plan defines them as basic checks. They are tracked by their own ID (NF-xx) and linked to the nearest test scenario where one exists. NF-02 and NF-03 are not covered by any requirement; they come from the Test Plan test types (Security, Performance).

## Conclusion
No non-functional defects were found in the checked areas.

## Limitations
- These are basic observations, not load, stress or penetration testing (out of scope, see Test Plan).
- Performance was judged by observation, without measuring tools.
