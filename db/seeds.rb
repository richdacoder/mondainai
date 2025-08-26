require "faker"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Message.destroy_all
User.destroy_all
Item.destroy_all
Request.destroy_all

puts "Creating users..."
users = []
 5.times do
  users << User.create!(
    email: Faker::Internet.unique.email,
    password: "password123",
    password_confirmation: "password123",
    name: Faker::App.name,
    phone_number: Faker::PhoneNumber.phone_number
  )
end

puts "Users created!"
