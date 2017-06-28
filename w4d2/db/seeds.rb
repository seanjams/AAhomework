# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.create([
  {birth_date: Date.new(1961,11,11), name: "Stephen Purry", color: "bluegold", sex: "M", description: "I'm a Warrior Cat!" },
  {birth_date: Date.new(1992,8,27), name: "Tiger Woods", color: "red", sex: "M", description: "GOAT" },
  {birth_date: Date.new(1461,7,31), name: "Serena KatWilliams", color: "black", sex: "F", description: "Serves Up!" },
  {birth_date: Date.new(1969,10,31), name: "Bryce Hairball", color: "fiftyshadesofgrey", sex: "F", description: "Sex Panther" }
  ])

CatRentalRequest.create([
  {cat_id: 1, start_date: Date.new(2000, 1, 2), end_date: Date.new(2000, 1, 9), status: 'PENDING'},
  {cat_id: 1, start_date: Date.new(2000, 1, 5), end_date: Date.new(2000, 1, 11), status: 'PENDING'},
  {cat_id: 1, start_date: Date.new(2000, 2, 1), end_date: Date.new(2000, 2, 13), status: 'PENDING'}
  ])
