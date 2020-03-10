# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
puts "Reset users and Sheep..."
  # Supprimer les users
  User.destroy_all
  # Supprimer les Sheeps
  Sheep.destroy_all
  # Créer les 3 utilisateurs Matti, Celia , David
  matti = User.new(email: 'benolielmatti@hotmail.fr',password: 'password')
  celia = User.new(email: 'franceschi.ce@gmail.com',password: 'password')
  david = User.new(email: 'vanmakdavid.lwg@gmail.com',password: 'password')

  users = [matti, celia, david]


puts "Creating our seed..."

10.times do |i|
  sheep = Sheep.create(
    nickname:Faker::Games::Zelda.character,
    square_meter_per_hour: rand(1..380),
    available:[true, false].sample,
    price_per_day:rand(1..130),
    user:  users.sample
  )
  puts "User: #{sheep.user}"

  puts "Nickname: #{sheep.nickname}"

  puts "Square Meter Per Hour: #{sheep.square_meter_per_hour}"

  puts "Available: #{sheep.available}"

  puts "Price per day: #{sheep.price_per_day}"

  puts "\n\n"
end

puts "Seed creation: done !"
