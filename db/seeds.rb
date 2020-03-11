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
  matti   = User.new(email: 'benolielmatti@hotmail.fr',password: 'password', first_name:"Matti",last_name:"Benoliel",bio:"Ma bio",phone_number:"0000000000")
  celia   = User.new(email: 'franceschi.ce@gmail.com',password: 'password', first_name:"Celia",last_name:"Franceschi",bio:"Ma bio",phone_number:"0000000000")
  david   = User.new(email: 'vanmakdavid.lwg@gmail.com',password: 'password', first_name:"David",last_name:"Vanmak",bio:"Ma bio", phone_number:"00000000000")
  patrick = User.new(email: 'perso@patrickblanc.net',password: 'password', first_name:"Patrick",last_name:"Blanc",bio:"Ma bio", phone_number:"0000000000")


  users = [matti, celia, david, patrick]


puts "Creating our seed..."

10.times do |i|
  file = URI.open('https://source.unsplash.com/featured/?sheep')
  sheep = Sheep.create(
    nickname:Faker::Games::Zelda.character,
    square_meter_per_hour: rand(1..380),
    available:[true, false].sample,
    price_per_day:rand(1..130),
    user:  users.sample
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
