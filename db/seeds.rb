# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'

file_path = Rails.root.join("db/seeds/models.json")
models = JSON.parse(File.read(file_path))

by_brand = models.group_by { |m| m["brand_name"] }

by_brand.each do |brand_name, models|
  prices = models.map { |m| m["average_price"] }
  average_brand_price = prices.sum / prices.size unless prices.empty?

  brand = Brand.create!(
    name: brand_name,
    average_price: average_brand_price.to_i,
  )
  puts "Created brand: #{brand_name}"

  models.each do |model|
    brand.models.create!(
      name: model["name"],
      average_price: model["average_price"],
    )
  end
end
