# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
# require 'pry-byebug'

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
  cocktail = JSON.parse(response).first.last.first
  return nil unless cocktail["strIngredient11"].nil? || cocktail["strIngredient11"].length == 0 # TODO: A checker bug
  return nil unless cocktail["strMeasure11"].nil? || cocktail["strMeasure11"].length == 0
  cocktail_to_load = {}
  cocktail.each do |key, value|
    cocktail_to_load[key] = value unless value.nil? || value.chomp.length ==0 || key == "dateModified"
  end
  cocktail_test = Cocktailloader.new(cocktail_to_load)
  cocktail_test.save
  puts "1 cocktail saved in loader"
  return cocktail_test.id
end

def load_cocktails(num = 10)
  (1..num).each do |c|
    loadid = load_random_cocktail
    save_cocktail_in_base(loadid) if loadid
    sleep(2)
  end
end

def save_cocktail_in_base(id)
  cloader = Cocktailloader.find(id)
  cocktail = Cocktail.create(name: cloader.strDrink)
  create_dose(cocktail, cloader.strIngredient1, cloader.strMeasure1)
  create_dose(cocktail, cloader.strIngredient2, cloader.strMeasure2)
  create_dose(cocktail, cloader.strIngredient3, cloader.strMeasure3)
  create_dose(cocktail, cloader.strIngredient4, cloader.strMeasure4)
  create_dose(cocktail, cloader.strIngredient5, cloader.strMeasure5)
  create_dose(cocktail, cloader.strIngredient6, cloader.strMeasure6)
  create_dose(cocktail, cloader.strIngredient7, cloader.strMeasure7)
  create_dose(cocktail, cloader.strIngredient8, cloader.strMeasure8)
  create_dose(cocktail, cloader.strIngredient9, cloader.strMeasure9)
  create_dose(cocktail, cloader.strIngredient10, cloader.strMeasure10)
  cloader.mrcock_id = Cocktail.last.id
  cloader.save
  puts "cocktail created in base"
end

def create_dose(cocktail, ing_st, desc_st)
  return if ing_st.nil? || ing_st.length == 0
  puts "dose created"
  ingredient = Ingredient.find_by(name: ing_st)
  dose = Dose.create(cocktail: cocktail, ingredient: ingredient, description: desc_st)
end

# def save_cocktails
#   Cocktailloader.all.each do |cloader|
#     save_cocktail_in_base(cloader.id)
#   end
#   puts "finish"
# end

# load_ingredients
# load_cocktails(25)

def upload_photo(cocktail_id)
  cocktailloader = Cocktailloader.find_by(mrcock_id: cocktail_id)
  cocktail = Cocktail.find(cocktail_id)
  img = cocktailloader.strDrinkThumb if cocktailloader
  cocktail.remote_photo_url = img if img
  puts "photo saved"
  cocktail.save
end

def upload_category(cocktail_id)
  cocktailloader = Cocktailloader.find_by(mrcock_id: cocktail_id)
  cocktail = Cocktail.find(cocktail_id)
  category = cocktailloader.strCategory if cocktailloader
  cocktail.category = category if category
  puts "category saved"
  cocktail.save
end

def votes(cocktail_id)
  cocktail = Cocktail.find(cocktail_id)
  cocktail.votes = rand(0..100)
  cocktail.save
  puts "votes saved"
end

def update
  cocktails = Cocktail.all
  cocktails.each do |cocktail|
    upload_photo(cocktail.id)
    upload_category(cocktail.id)
    votes(cocktail.id)
  end
end

load_cocktails(50)
update



