
# Deja View Gem

## Overview

`deja_view` is a Rails engine gem designed to enhance user experience by addressing a common navigational issue. It intelligently detects when a user returns to the 'new' page via the back button after creating a record, and provides clear guidance on their next steps.

## Features

-  **User Action Recognition**: Detects when users hit the back button and land on the 'new' page after record creation.

-  **Clear Notifications**: Informs users that they have returned to the 'new' page and the previous action has been completed.

-  **Navigation Options**: Offers links to either create a new record or edit the one they just created, reducing user confusion and improving workflow.  

## Implementation

Integrating `deja_view` into your Rails application is straightforward. Detailed instructions for setup and configuration will be provided in the subsequent sections of this document.

## Why Deja View?

The `deja_view` gem addresses a specific yet significant user experience challenge in web applications. By providing immediate feedback and clear options upon the unintended use of the back button, it enhances user satisfaction and streamlines the interaction flow within your application.

## Installation

Install the gem and add to the application's Gemfile by executing:

$ bundle add 'deja_view'

## Usage

Add this to the top of the controller you want to use this with:

`require "deja_view/controller_methods"`

...and also include the ControllerMethods in your controller:

`include DejaView::ControllerMethods`

Lastly, use the deja_view_for class method to fetch the model you just created, and indicate whether you plan to use `deja_view` inline (interstitial: false) or as an interstitial page (interstitial: true)

`deja_view_for :recently_created_record, interstitial: false`

Your implementation for the model fetch (in this example: `recently_created_record`)` should return the model that was just created by the user and, critically, should use time-sensitive where-clause to ensure you're only selecting the one you just created. Here's an example:
  
```
User
 .where(created_by: current_user)
 .where("created_at > ?", Time.current - 1.minute)
```

## Inline Usage

If you plan to use `interstitial: false` and make it an inline experience, just add this to the top of your new.html.erb form:

`<%= deja_view_decision_panel %>`