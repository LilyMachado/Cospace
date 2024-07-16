# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
Workspace.destroy_all
coworking_spaces = [
  # {
  #   name: "The Cluster",
  #   description: "Stylish coworking space with stunning views and great amenities.",
  #   location: "31 Queen St, Melbourne VIC 3000",
  #   price: 50.0,
  #   available_from: "2024-07-01",
  #   available_to: "2024-12-31",
  #   amenities: "Wi-Fi, Coffee, Meeting Rooms",
  #   host: "Cluster Host",
  #   image_url: "https://images.unsplash.com/photo-1552820728-8b83e51d4b6b"
  # },
  # {
  #   name: "WeWork",
  #   description: "Global coworking giant with multiple locations in Melbourne.",
  #   location: "401 Collins St, Melbourne VIC 3000",
  #   price: 75.0,
  #   available_from: "2024-07-01",
  #   available_to: "2024-12-31",
  #   amenities: "Wi-Fi, Coffee, Meeting Rooms, Events",
  #   host: "WeWork Host",
  #   image_url: "https://images.unsplash.com/photo-1573497019414-307d3a22e9d4"
  # },
  # {
  #   name: "CreativeCubes.Co",
  #   description: "A vibrant coworking community with a focus on creativity.",
  #   location: "111 Cecil St, South Melbourne VIC 3205",
  #   price: 60.0,
  #   available_from: "2024-07-01",
  #   available_to: "2024-12-31",
  #   amenities: "Wi-Fi, Coffee, Meeting Rooms, Events, Workshops",
  #   host: "CreativeCubes Host",
  #   image_url: "https://images.unsplash.com/photo-1564869734861-1f0d4c5ffbb6"
  # },
  {
    name: "Inspire9",
    description: "A community-led coworking space fostering innovation and collaboration.",
    location: "41 Stewart St, Richmond VIC 3121",
    price: 55.0,
    available_from: "2024-07-01",
    available_to: "2024-12-31",
    amenities: "Wi-Fi, Coffee, Meeting Rooms, Events, Mentorship",
    host: "Inspire9 Host",
    image_url: "https://res.cloudinary.com/dwgushwh4/image/upload/v1720836522/creativecubes-office-10_txqzwm.jpg"
  },
  {
    name: "Hub Australia",
    description: "Premium coworking space with beautiful interiors and top-notch facilities.",
    location: "162 Collins St, Melbourne VIC 3000",
    price: 70.0,
    available_from: "2024-07-01",
    available_to: "2024-12-31",
    amenities: "Wi-Fi, Coffee, Meeting Rooms, Events, Wellness Programs",
    host: "Hub Australia Host",
    image_url: "https://res.cloudinary.com/dwgushwh4/image/upload/v1720836521/QV-Amphitheatre_ssiebm.jpg"
  },
  {
    name: "Spaces",
    description: "Creative working environments with a unique entrepreneurial spirit.",
    location: "530 Collins St, Melbourne VIC 3000",
    price: 65.0,
    available_from: "2024-07-01",
    available_to: "2024-12-31",
    amenities: "Wi-Fi, Coffee, Meeting Rooms, Events, Networking",
    host: "Spaces Host",
    image_url: "https://res.cloudinary.com/dwgushwh4/image/upload/v1720836521/224a4c5e-d5cd-11e9-b5b7-0a80a47aa582_0_t8odwl.jpg"
  },
  {
    name: "The Commons",
    description: "Beautifully designed coworking spaces to help you work better.",
    location: "20-40 Meagher St, Chippendale VIC 2008",
    price: 80.0,
    available_from: "2024-07-01",
    available_to: "2024-12-31",
    amenities: "Wi-Fi, Coffee, Meeting Rooms, Events, Wellness Programs",
    host: "The Commons Host",
    image_url: "https://res.cloudinary.com/dwgushwh4/image/upload/v1720836521/spaces-coworking-rialto-office-11_min9bl.jpg"
  },
  {
    name: "Gravity Coworking",
    description: "Luxury coworking space for entrepreneurs and established businesses.",
    location: "114 William St, Melbourne VIC 3000",
    price: 85.0,
    available_from: "2024-07-01",
    available_to: "2024-12-31",
    amenities: "Wi-Fi, Coffee, Meeting Rooms, Events, Networking",
    host: "Gravity Host",
    image_url: "https://res.cloudinary.com/dwgushwh4/image/upload/v1720836520/Web_72DPI-20180801_WeWork_152_Elizabeth_Street__7_eftg1p.jpg"
  },
  {
    name: "York Butter Factory",
    description: "Coworking space designed for digital media and technology startups.",
    location: "62-66 King St, Melbourne VIC 3000",
    price: 60.0,
    available_from: "2024-07-01",
    available_to: "2024-12-31",
    amenities: "Wi-Fi, Coffee, Meeting Rooms, Events, Mentorship",
    host: "York Butter Host",
    image_url: "https://res.cloudinary.com/dwgushwh4/image/upload/v1720836520/space-co-melbourne-coworking-mm-1_pvxsb6.jpg"
  },
  {
    name: "WOTSO WorkSpace",
    description: "Flexible coworking spaces for growing businesses.",
    location: "123 Queen St, Melbourne VIC 3000",
    price: 50.0,
    available_from: "2024-07-01",
    available_to: "2024-12-31",
    amenities: "Wi-Fi, Coffee, Meeting Rooms, Events, Networking",
    host: "WOTSO Host",
    image_url: "https://res.cloudinary.com/dwgushwh4/image/upload/v1720836519/the-cluster-melbourne-victoria-coworking-space-1024x682_lmo7zc.jpg"
  }
]

coworking_spaces.each do |space|
  i = 0
  puts i
  workspace = Workspace.create!(
    name: space[:name],
    description: space[:description],
    location: space[:location],
    price: space[:price],
    available_from: space[:available_from],
    available_to: space[:available_to],
    amenities: space[:amenities],
    host: space[:host]
  )

  file = URI.open(space[:image_url])
  workspace.photos.attach(io: file, filename: "#{space[:name].parameterize}.jpg")
  i += 1
end
