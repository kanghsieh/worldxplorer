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

puts "Creating locations and references..."

addresses = [
  "Montgolfier-Allee 17, 60486 Frankfurt am Main",
  "Birkenweg 8, 53343 Wachtberg",
  "Clayallee 44, Berlin",
  "Rückertstrasse 1, Berlin",
  "Turmstrasse 16, Aachen",
  "Hermesweg 5, Hamburg"
]

addresses.each do |address|
  location = Location.create(
    address: address,
    status: ["visited", "wished"].sample
  )

  if location.status == "visited"
    UsersLocation.create(
      user: user,
      location: location,
      visited: true,
      wished: false
    )
  else
    UsersLocation.create(
      user: user,
      location: location,
      visited: false,
      wished: true
    )
  end
end

puts "Seed finished."
