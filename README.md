# README wearaway_demo
This is a simple Rails 5 app that is designed to return JSON responses only (no HTML/CSS user interface). It has a User controller that handles CRUD requests for a User object with the following attributes:

• ID
• Username
• Email
• Password
• Password Confirmation

It validates attributes based on below:

1. Presence of all attributes
2. Username length can't be less than 5 Characters only after presence is validated.
3. Email format only after presence is validated
4. Unique username and email
5. Password and password_confirmation match.

Any validation failures return a personalized 422 status code and JSON error message (for example: { errors: [ "Username can't be blank", "Password_confirmation doesn't match Password ] })

RSpec tests have been created for the User model & UsersController for validations/attributes as well as status returned for all success case and errors.

Database used is MySQL.

Setting up.

1. Fork repo
2. Please run the below commands in your terminal
  1. rails db:create
  2. rails db:migrate
  3. rails db:seed
      (This will seed your development environment with fake data)
3. Since everything is set up. Let's set up your testing environment. Please run the below commands
   in your terminal.
  1. rails db:migrate RAILS_ENV=test
  2. rails db:seed RAILS_ENV=test

    To make sure that your testing database was created with fake data. Go into it with the below command
    and see if all users are present
  3. rails console --environment=test
