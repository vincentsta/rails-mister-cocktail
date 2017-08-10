# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'pry-byebug'

def load_ingredients
  ingredient_url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

  response = open(ingredient_url).read
  ingredients = JSON.parse(response).first.last

  ingredients.each do |ing|
    i = Ingredient.new(name:ing["strIngredient1"])
    p i.save
    puts "created "+ing["strIngredient1"]
  end
  puts "ingredients finished"
end

def load_random_cocktail
  cocktail_url = "http://www.thecocktaildb.com/api/json/v1/1/random.php"

  response = open(cocktail_url).read
  cocktail = JSON.parse(response)
  binding.pry
  puts "finish"
end

load_random_cocktail
