# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"



5.times do
  User.create(
    first_name: Faker::Internet.username,
    last_name: Faker::BossaNova.artist,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    address: Faker::Address.street_address,
    phone_number: Faker::Barcode.ean
  )
end
# dogs = ["https://images.pexels.com/photos/406014/pexels-photo-406014.jpeg?auto=compress&cs=tinysrgb&w=1200",
#   "https://images.pexels.com/photos/39317/chihuahua-dog-puppy-cute-39317.jpeg?auto=compress&cs=tinysrgb&w=1200",
# "https://images.pexels.com/photos/850602/pexels-photo-850602.jpeg?auto=compress&cs=tinysrgb&w=1200",
# "https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg?auto=compress&cs=tinysrgb&w=1200",
# "https://images.pexels.com/photos/1805164/pexels-photo-1805164.jpeg?auto=compress&cs=tinysrgb&w=1200"]

5.times do
  pet_new = Pet.new(
    title: Faker::Creature::Dog.meme_phrase,
    name: Faker::Creature::Dog.name,
    age: [1..15].sample,
    species: Faker::Creature::Dog.breed,
    price: [10..25].sample,
    description: Faker::Creature::Dog.meme_phrase,
    user_id: [1..5].sample
  )
  file = URI.open("https://images.pexels.com/photos/406014/pexels-photo-406014.jpeg?auto=compress&cs=tinysrgb&w=1200")
  pet_new.photo.attach(io: file, filename: "#{pet_new.name}.png", content_type: "image/png")
  pet_new.save
end

puts "seed finished, users and pets created"
