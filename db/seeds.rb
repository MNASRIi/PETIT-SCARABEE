# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Booking.destroy_all
Lesson.destroy_all
User.destroy_all


puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    #avatar:  Faker::Avatar.image,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    password: Faker::Internet.password,


    )
    user.save!
  end
  puts 'Finished!'

  puts 'Creating 50 fake lessons...'
  50.times do
    lesson = Lesson.new(
      title:    Faker::Game.title,
      description: Faker::Lorem.paragraph,
      price: rand(1..500),
      duration: rand(1..5),
      category:
    )
    lesson.user = User.all.sample
    lesson.save!
  end
  puts 'Finished!'
