require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email(domain: 'yopmail.com'), password: "password")
end

t1 = Time.parse("2020-11-01 14:40:34")
t2 = Time.parse("2022-01-01 00:00:00")
10.times do
  Event.create(title: Faker::Lorem.sentence(word_count: 2), user: User.all.sample, start_date: rand(t1..t2), duration: 5, description: Faker::Lorem.sentence(word_count: 10) , price: 5, location: "Paris")
end
