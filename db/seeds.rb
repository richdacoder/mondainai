require "faker"
require "open-uri"

puts "Cleaning database..."
Messages.destroy_all
Request.destroy_all
Item.destroy_all
User.destroy_all

puts "Creating Users..."

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


item1 = Item.new(
  name: 'Old Chair',
  description: Faker::Quote.robin,
  dimensions: "1m x 1m x 1m",
  weight: 1,
  user: andrew
  )

  nice_chair = URI.parse("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.antiquesatlas.com%2Fdealer-stock-images%2Flondonfine%2FAntique_Walnut_Spoon_Back_Armc_as272a2181z.jpg&f=1&nofb=1&ipt=78f9352eb7a945081d661c4ec69a9972ca7f6e9b1372dd3af6290f71067fa07b").open
  item1.photo.attach(io: nice_chair, filename: "nice_chair.png", content_type: "image/png")
  item1.save

item2 = Item.new(
  name: 'New Chair!',
  description: Faker::Quote.robin,
  dimensions: "1m x 1m x 1m",
  weight: 1,
  user: andrew
)

future_chair = URI.parse("https://curatedinterior.com/wp-content/uploads/2021/04/Eero-Aarnio-Ball-Chair-Iconic-Mid-Century-Modern-Chair-Designs.jpg").open
  item2.photo.attach(io: future_chair, filename: "future_chair.png", content_type: "image/png")
  item2.save

item3 = Item.new(
  name: 'Ramen!',
  description: Faker::Quote.robin,
  dimensions: "1m x 1m x 1m",
  weight: 1,
  user: andrew
)

ramen = URI.parse("https://m.media-amazon.com/images/I/813yz-8zlFL.jpg").open
  item3.photo.attach(io: ramen, filename: "ramen.png", content_type: "image/png")
  item3.save

puts "Items created!"

puts "Creating Requests..."
Request.create!(
  item: item1,
  user: alonzo,
  status: 0
)

Request.create!(
  item: item2,
  user: richard,
  status: 3
)

puts "Requests Created!"
