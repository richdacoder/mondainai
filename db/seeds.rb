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
Request.destroy_all
Item.destroy_all
User.destroy_all
# Request.destroy_all
# Message.destroy_all

# puts "Creating users..."
# users = []
#  5.times do
#   users << User.create!(
#     email: Faker::Internet.unique.email,
#     password: "password123",
#     password_confirmation: "password123",
#     name: Faker::App.name,
#     phone_number: Faker::PhoneNumber.phone_number
#   )
#  end



# items = []
# users.each do |user|
# 5.times do
#   items << Item.create!(
  #     name: Faker::ElectricalComponents.electromechanical,
  #     description: Faker::Quote.robin,
  #     photo: FakePicture::Company.logo,
  #     dimensions: "1m x 1m x 1m",
  #     weight: 1,
  #     user: user
  #   )
  #  end
  # end




  #  requests = []
  #  items.each do |item|
  #   Request.create!(
    #   item: item,
    #   user: item.user,
    #   status: rand(0..3)
    #   )
    #  end




puts "Creating Messages..."

alonzo = User.create!(
  email: 'alonzo@email.com',
  password: "123456",
  name: 'Alonzo',
  phone_number: Faker::PhoneNumber.phone_number
)

andrew = User.create!(
  email: 'andrew@email.com',
  password: "123456",
  name: 'Andrew',
  phone_number: Faker::PhoneNumber.phone_number
)

richard = User.create!(
  email: 'richard@email.com',
  password: "123456",
  name: 'Richard',
  phone_number: Faker::PhoneNumber.phone_number
)

yuichi = User.create!(
  email: 'yuichi@email.com',
  password: "123456",
  name: 'Yuichi',
  phone_number: Faker::PhoneNumber.phone_number
)

puts "Users created!"

puts "Creating items..."

item = Item.create!(
  name: 'Old Chair',
  description: Faker::Quote.robin,
  photo: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.antiquesatlas.com%2Fdealer-stock-images%2Flondonfine%2FAntique_Walnut_Spoon_Back_Armc_as272a2181z.jpg&f=1&nofb=1&ipt=78f9352eb7a945081d661c4ec69a9972ca7f6e9b1372dd3af6290f71067fa07b",
  dimensions: "1m x 1m x 1m",
  weight: 1,
  user: andrew
)

item = Item.create!(
  name: 'New Chair!',
  description: Faker::Quote.robin,
  photo: "https://curatedinterior.com/wp-content/uploads/2021/04/Eero-Aarnio-Ball-Chair-Iconic-Mid-Century-Modern-Chair-Designs.jpg",
  dimensions: "1m x 1m x 1m",
  weight: 1,
  user: andrew
)

item = Item.create!(
  name: 'Ramen!',
  description: Faker::Quote.robin,
  photo: "https://m.media-amazon.com/images/I/813yz-8zlFL.jpg",
  dimensions: "1m x 1m x 1m",
  weight: 1,
  user: andrew
)

puts "Items created!"

puts "Creating Requests..."
Request.create!(
  item: item,
  user: alonzo,
  status: 0
)

Request.create!(
  item: item,
  user: richard,
  status: 3
)

puts "Requests Created!"
