# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |i|
  User.create!(
    email: "user#{i}@yopmail.com",
    password: "password",
    password_confirmation: "password",
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    phone_number1: FFaker::PhoneNumber.phone_number
  )
end

Size.names.keys.each { |size| Size.create!(name: size) }

Color.names.keys.each { |color| Color.create!(name: color) }

10.times do |i|
  Category.create!(
    name: "categorie#{i}"
  )
  
end

10.times do |i|
  Article.create!(
    title: FFaker::Book.title,
    reference: FFaker::PhoneNumber.imei,
    description: FFaker::Book.description,
    price: rand(1..100),
    delivery_price: rand(1..100),
    status: Article.statuses.keys.sample
  )
end
