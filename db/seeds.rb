# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
require 'open-uri'

puts "Reset users and Sheep..."
  # Supprimer les users
  User.destroy_all
  # Supprimer les Sheeps
  Sheep.destroy_all
  # Créer les 3 utilisateurs Matti, Celia , David

  file_matti = URI.open('https://avatars3.githubusercontent.com/u/50374101?s=400&u=ee79a434fdd6a1d001644b6dc221670289e7102a&v=4')
  file_patrick = URI.open('https://ca.slack-edge.com/T02NE0241-USTMQQUCT-b8513b00ea1c-512')
  file_celia = URI.open('https://avatars0.githubusercontent.com/u/58769219?v=4')
  file_david = URI.open('https://avatars1.githubusercontent.com/u/59261819?s=460&v=4')

  matti   = User.create!(email: 'matti@matti.fr',password: 'password', first_name:"Matti",last_name:"Benoliel",bio:"Ma bio",phone_number:Faker::PhoneNumber.cell_phone,address: "Marseille")
  sleep(1)
  matti.photo.attach(io: file_matti, filename: 'matti.jpg', content_type: 'image/jpg')
  celia   = User.create!(email: 'celia@celia.com',password: 'password', first_name:"Celia",last_name:"Franceschi",bio:"Ma bio",phone_number:Faker::PhoneNumber.cell_phone,address:"Cassis")
  sleep(1)
  celia.photo.attach(io: file_celia, filename: 'matti.jpg', content_type: 'image/jpg')
  david   = User.create!(email: 'peuks@peuks.com',password: 'password', first_name:"David",last_name:"Vanmak",bio:"Ma bio", phone_number:Faker::PhoneNumber.cell_phone,address:"Paris")
  sleep(1)
  david.photo.attach(io: file_david, filename: 'matti.jpg', content_type: 'image/jpg')
  patrick = User.create!(email: 'patrick@patrick.net',password: 'password', first_name:"Patrick",last_name:"Blanc",bio:"Ma bio", phone_number:Faker::PhoneNumber.cell_phone,address:"Lyon")
  patrick.photo.attach(io: file_patrick, filename: 'matti.jpg', content_type: 'image/jpg')


  users = [matti, celia, david, patrick]


puts "Creating our seed..."

10.times do |i|
  file = URI.open('https://source.unsplash.com/featured/?sheep')
  user = users.sample
  sheep = Sheep.create!(
    nickname:Faker::Games::Zelda.character,
    square_meter_per_hour: rand(1..380),
    available:[true, false].sample,
    price_per_day:rand(1..130),
    user:  user,
    address: user.address,
    description: 'It is a very nice sheep'
  )
  sheep.photo.attach(io:file,filename: 'sheep.jpeg')

  puts "User: #{sheep.user.email}"

  puts "Nickname: #{sheep.nickname}"

  puts "Square Meter Per Hour: #{sheep.square_meter_per_hour}"

  puts "Available: #{sheep.available}"

  puts "Price per day: #{sheep.price_per_day}"

  puts "Owner's address: #{sheep.address}"

  puts "\n\n"
  sleep(1)
end

puts "Seed creation: done !"
