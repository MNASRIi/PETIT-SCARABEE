# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

Booking.destroy_all
Lesson.destroy_all
User.destroy_all

BIOS = [
  "Teaching since 10 years 💰💲",
  "I’m very friendly and approachable. I love discussing a wide range of subjects, exploring interesting things and learning together. I enjoy meeting new people",
  "Looking to build a class of 5 to 10 students.",
  "✨前VIPKid老师🍎教授过10,000节儿童和成人英语课程🎉B.Ed.,TESOL,TEFL, 25年经验🎉WonderSkills, RAZ, Oxford Phonics.",
  "Here to help you accomplish your goals. Through my teaching experience, I have learned where my strengths are as a teacher.",
  "💥🌻 TEFL-certified with over 15 years of training experience. Expert in seduction 🌈 ✏️📚 💰💲.",
  "All matters nerd🤓 here to help you gain confidence when speaking! I am an enthusiastic, motivating and supportive teacher with a two year experience.",
  "I live in South Africa and I am a high-school graduate. I love English and helping others improve their English skills.",
  "I will let the student decide what they want to learn about, where do they need help or what are they struggling with. Have relaxed conversations and create a safe/warm space.",
  "Want to improve your CONFIDENCE✅? Let's get started! 👨‍🏫 I am a nerd like everyone else in this website."
]

LESSON_TITLES = [
  "for beginners",
  "for experts",
  "for nerds",
  "for dummies",
  "- in class or individual",
  "- intensive training",
  "- intensive",
  "- Regular",
  "- Intemediate",
]

LESSON_DESCRIPTIONS = [
  "Relaxed and easy to learn quickly!",
  "Trial lesson - no need to pay dude",
  "Hello! We'll get to know each other a little bit - don't be afraid",
  "Lessons usually starts with a 1:1 conversation",
  "This is for business guys",
  "童和成人英语课童和成人英语童和成人英语童和成人英语. Ca veut dire bonjour en japonais",
  "Online or offline",
  "This is a description, enjoy it",
  "I pay you if you take this course",
  "Best class for the bros",
  "I am also seduction expert",
  "I hate this",
  "I am a bot and so what?",
  "You will love it"
]

puts 'Creating 10 fake users...'
10.times do |index|
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,

    #avatar:  Faker::Avatar.image,
    description: BIOS[index],
    email: Faker::Internet.email,
    password: "123456",
    )
    user.avatar.attach(io: URI.open("https://source.unsplash.com/random/?teacher"), filename: "nes.png", content_type: "image/png")
    user.save if user.valid?
  end
    User.create(first_name:"Wissam", last_name: "Nasreddine", description: "dsfsdafsdafsd", email:"wissam.nasreddine@hec.edu", password: "123456")
  puts 'Finished!'

  puts 'Creating 50 fake lessons...'
  50.times do
    lesson = Lesson.new(
      category: Lesson::CATEGORIES.sample,
      description: LESSON_DESCRIPTIONS.sample,
      price: [10,15,20,25,30,35,40,50].sample,
      duration: rand(1..5),
      address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      )
      lesson.user = User.all.sample
      lesson.title = "#{lesson.category} #{LESSON_TITLES.sample}"
      lesson.save!
  end
  puts 'Finished!'
