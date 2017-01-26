## Venter
[![Build Status](https://semaphoreci.com/api/v1/amattrice/reroot/branches/master/badge.svg)](https://semaphoreci.com/amattrice/reroot)

[![Test Coverage](https://codeclimate.com/github/MattRice12/reroot/badges/coverage.svg)](https://codeclimate.com/github/MattRice12/reroot/coverage)

# About
Venter is a simple application where a user inputs text, submits it, and it's contents are displayed on the page. As I adding to the stylistic elements of the app, I decided to give it a cathartic theme--that of a random anonymous message board where people can just unload all of their frustrations in 500 characters or less.

# Features / Process
**Model**: I started by creating single model to store the text that a user inputs. I decided against having multiple models or having a user sign in since I was trying to maintain the simple 1-page/1-button app.

**Validations**: I set up validations in the database and the model, requiring presence and a minimum of 5 and maximum of 500 character prior to submission.

**Controller**: 2 methods -- index and create. Since this is a single-page application, I limited any GET requests to the root index page. Since this is a single-button application, I figured the less clicks the better. So, I decided against a delete option (even though it would have been a link).

**Deleting**: Since the user can't delete his 'vents', I used the whenever gem to delete all vents every day. This also goes with the theme of venting--unload it in a healthy (debatable) way and let it go.

**Character Count**: I set up a character counter similar to how twitter does it--it counts down from 500 as you type. I chose to let the user type more than 500 characters rather than stop for, again, the thematic reason of unloading. However, to submit, the user has to pare the text down. I set this up with jQuery.

**Instructions**: I set up an instructions block (right in desktop; top in mobile) to convey the purpose and make the page look a little more balanced. In mobile view, the instructions block is closed on page load and can be toggled open by tapping on it (while this is an extra click, toggling tightens the mobile view while still allowing instructions to be relevant). I set this up with jQuery.

**Responsive Design**: I used flexbox to stack the content responsively. In tablet/mobile view, the instructions block floats on top because it doesn't fit anywhere else. Moreover, it gave me the opportunity to work with jQuery more as the window size enters mobile mode.

**Testing**: I don't have many model or helper methods or anything else complicated going on, but it was a good opportunity to practice testing anyways. I used the default rails testing environment for model/helper tests and cucumber for integration tests.

**Libraries and Technologies**:
Ruby 2.3.0
Rails 5.0
jQuery
Cucumber
Whenever
