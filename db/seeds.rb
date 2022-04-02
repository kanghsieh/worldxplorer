# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Destroying all users and locations..."
UsersLocation.destroy_all
Location.destroy_all
User.destroy_all

puts "Creating users..."
user = User.create(
  first_name: "Kang",
  last_name: "Hsieh",
  email: "kang@hsieh.com",
  password: "123456"
)
user.photo.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'kang.png')),
  filename: 'kang.png',
  content_type: 'image/png'
)
user.save

puts "Creating locations..."
location = Location.create(
  address: "Montgolfier-Allee 17, 60486 Frankfurt am Main"
)

puts "Creating references..."
UsersLocation.create(
  user: user,
  location: location,
  visited: false,
  wished: true
)

puts "Seed finished."
