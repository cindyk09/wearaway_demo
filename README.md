# README wearaway_demo

For the code test, I'd like you to build a Rails application that is designed to return JSON responses only (no HTML/CSS user interface). Please create a controller that handles CRUD requests for a User object with the following attributes:

• ID
• Username
• Email
• Password
• Password Confirmation

The app should validate length/presence of all of these fields (use some sensible default for length). Additionally, it should validate that the password and password confirmation match (you do not have to save the password confirmation, and you don't have to hash the password for this exercise). Any validation failures should return a 422 status code and some reasonable JSON error message (for example: { errors: [ "Username is required", "Password does not match confirmation" ] })

The requests that the application controller should handle are:

GET /users(.:format) -> returns JSON for a list of users and a 200 OK status
POST /users(.:format) -> returns JSON for newly created user and a 201 Created status

Your applications should include RSpec tests for the User model (and it's validations/attributes) and the two UsersController actions. Feel free to store the data any way you want as long as it's a database that supports SQL queries (SQLite/PostgreSQL/MySQL, etc.). I'll be running the RSpec tests for the app and also using cURL to make some requests manually. For example, if you have your app running on localhost:3000, I'd do something like this:

curl -X GET http://localhost:3000/users

And I'd expect to see a JSON response that is an array of users, like this:

[
  {
     id: 1,
     username: 'cliff',
     password: 'secret',
     email: 'cliff@wearaway.com'
  }
]
