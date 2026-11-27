# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "json"

path = Rails.root.join("db/seeds/users.json")

if File.exist?(path)
  rows = JSON.parse(File.read(path))
  rows.each do |row|
    user = User.find_or_initialize_by(email: row['email'])
    user.password = row['password']
    user.password_confirmation = row['password_confirmation']
    user.admin = row['admin']
    user.save!
  end
end