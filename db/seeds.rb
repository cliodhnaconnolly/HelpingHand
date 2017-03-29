# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Cliodhna Connolly",
             email: "cliodhna@connolly.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
5.times do |n|
  title = Faker::Lorem.sentence(5)
  description = Faker::Lorem.sentence(30)
  latitude = Faker::Address.latitude
  longitude = Faker::Address.longitude
  deadline = Faker::Time.forward(60, :afternoon)
  use_location = true
  users.each { |user|
    user.favours.create!(title: title,
                 description: description,
                 latitude: latitude,
                 longitude: longitude,
                 deadline: deadline,
                 use_location: use_location)
  }
end