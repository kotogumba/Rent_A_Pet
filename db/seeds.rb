# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

Pet.destroy_all
User.destroy_all

20.times do
  User.create(
    first_name: Faker::Internet.username,
    last_name: Faker::BossaNova.artist,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    address: Faker::Address.city,
    phone_number: Faker::Barcode.ean
  )
end

20.times do
  pet = Pet.new(
    title: Faker::Creature::Dog.meme_phrase,
    name: Faker::Creature::Dog.name,
    age: (1..15).to_a.sample,
    species: Faker::Creature::Dog.breed,
    price: (10..25).to_a.sample,
    description: Faker::Creature::Dog.meme_phrase,
  )
  pet.user = User.all.sample
  pet.latitude = Faker::Address.latitude
  pet.longitude = Faker::Address.longitude
  file = URI.open("https://loremflickr.com/320/240/dog")
  pet.photos.attach(io: file, filename: "#{pet.name}.jpeg", content_type: "image/jpeg")
  pet.save!
end

puts "seed finished, users and pets created"
