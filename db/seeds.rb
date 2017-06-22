10.times do
  user = User.create!([{
    username: Faker::Name.unique.name,
    email: Faker::Internet.email,
    password: "qwerty",
    password_confirmation: "qwerty"
  }])
end

p "Date has been seeded with #{User.count} New Users"
