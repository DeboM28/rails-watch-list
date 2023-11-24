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
require 'open-uri'

Movie.destroy_all

puts 'start seeding'

url = 'http://tmdb.lewagon.com/movie/top_rated?'
movies_serialized = URI.open(url).read
results = JSON.parse(movies_serialized)

movies = results['results']

movies.first(5)
movies.each do |movie|
  Movie.create(title: movie['title'], overview: movie['overview'], rating: movie['vote_average'], poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}")
end

puts 'seeds done'

List.destroy_all

List.create(name:"Liste1")
List.create(name:"Liste2")
List.create(name:"Liste3")
List.create(name:"Liste4")
