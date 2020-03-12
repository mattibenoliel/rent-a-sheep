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
  matti   = User.new(email: 'matti@matti.fr',password: 'password', first_name:"Matti",last_name:"Benoliel",bio:"Ma bio",phone_number:Faker::PhoneNumber.cell_phone,address: "167 rue paradis, 13006 Marseille")
  sleep(1)
  celia   = User.new(email: 'celia@celia.com',password: 'password', first_name:"Celia",last_name:"Franceschi",bio:"Ma bio",phone_number:Faker::PhoneNumber.cell_phone,address:"17 rue paradis, 13006 Marseille")
  sleep(1)
  david   = User.new(email: 'peuks@peuks.com',password: 'password', first_name:"David",last_name:"Vanmak",bio:"Ma bio", phone_number:Faker::PhoneNumber.cell_phone,address:"16 rue paradis, 13006 Marseille")
  sleep(1)
  patrick = User.new(email: 'patrick@patrick.net',password: 'password', first_name:"Patrick",last_name:"Blanc",bio:"Ma bio", phone_number:Faker::PhoneNumber.cell_phone,address:"178 rue paradis, 13006 Marseille")


  users = [matti, celia, david, patrick]


puts "Creating our seed..."

10.times do |i|
  file = URI.open('https://source.unsplash.com/featured/?sheep')
  sheep = Sheep.create(
    nickname:Faker::Games::Zelda.character,
    square_meter_per_hour: rand(1..380),
    available:[true, false].sample,
    price_per_day:rand(1..130),
    user:  users.sample,
    description: 'It is a very nice sheep'
  )
  sheep.photo.attach(io:file,filename: 'sheep.jpeg')

  puts "User: #{sheep.user.email}"

  puts "Nickname: #{sheep.nickname}"

  puts "Square Meter Per Hour: #{sheep.square_meter_per_hour}"

  puts "Available: #{sheep.available}"

  puts "Price per day: #{sheep.price_per_day}"

  puts "\n\n"
end

puts "Seed creation: done !"
