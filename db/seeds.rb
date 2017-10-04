# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include Faker
# require 'random_data'

5.times do
   user = User.create!(
   first_name:   Faker::Name.first_name,
   last_name:    Faker::Name.last_name,
   email:        Faker::Internet.email,
   password:     Faker::Internet.password,
   confirmed_at: Time.now
   )
 end
 users = User.all

 50.times do
   item = Item.create!(
     user:  users.sample,
     name:  Faker::Lorem.sentence
   )
 end

 30.times do
   item = Item.create!(
   user: users.sample,
   name: Faker::Lorem.sentence,
   created_at: 3.months.ago
   )
 end

puts "Seed finished"
puts "#{Item.count} items created"
puts "#{User.count} users created"
