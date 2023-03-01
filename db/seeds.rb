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

    #avatar:  Faker::Avatar.image,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    password: "123456",


    )
    user.save if user.valid?
  end
  puts 'Finished!'

  puts 'Creating 50 fake lessons...'
  50.times do
    lesson = Lesson.new(
      title:    Faker::Educator.subject,
      description: Faker::Lorem.paragraph_by_chars(number: 200),
      price: rand(10..100),
      duration: rand(1..5),
      category: Lesson::CATEGORIES.sample,
      address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    )
    lesson.user = User.all.sample
    lesson.save if lesson.valid?
  end
  puts 'Finished!'
