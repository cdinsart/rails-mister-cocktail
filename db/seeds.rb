require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients["drinks"].each do |ingredient|
  Ingredient.create!(
    name: ingredient["strIngredient1"]
    )
end

Cocktail.destroy_all
cocktails = ["mojito", "mosco mule", "sex on the beach", "tequila", "pisco sour", "sangria", "virgin mojito"]
cocktails.each do |cocktail|
  Cocktail.create!(name: cocktail)
end

Dose.destroy_all
10.times { Dose.create!(description: Faker::Food.measurement, ingredient: Ingredient.find(Ingredient.ids.sample), cocktail: Cocktail.find(Cocktail.ids.sample)) }
