# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

puts "Creating locations..."
location = Location.create(
  latitude: 34.1245,
  longitude: 1.234
)

puts "Creating references..."
UsersLocation.create(
  user: user,
  location: location,
  visited: false,
  wished: true
)

puts "Seed finished."
