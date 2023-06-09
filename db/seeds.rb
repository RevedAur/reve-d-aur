# frozen_string_literal: true

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
    password: 'password',
    password_confirmation: 'password',
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    birth_date: FFaker::Time.date,
    phone_number: FFaker::PhoneNumberFR.mobile_phone_number
  )
end

Size.names.each_key { |size| Size.create!(name: size) }

Color.names.each_key { |color| Color.create!(name: color) }

ClothingModel.create!(name: 'clothing')
ClothingModel.create!(name: 'accessory')

10.times do |i|
  Category.create!(
    name: "categorie#{i}",
    clothing_model: ClothingModel.all.sample
  )
end

10.times do |_i|
  art = Article.create!(
    title: FFaker::Book.title,
    reference: FFaker::PhoneNumber.imei,
    description: FFaker::Book.description,
    price: rand(1..100),
    delivery_price: rand(1..100),
    status: Article.statuses.keys.sample,
    category: Category.all.sample,
    colors: Color.order("RANDOM()").limit(rand(Color.count)),
    sizes: Size.order("RANDOM()").limit(rand(Size.count))
  )
  art.image.attach(
    io:  File.open(File.join(Rails.root,'app/assets/images/logo.png')),
    filename: 'logo.png'
  )
end
