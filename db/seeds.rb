

require 'open-uri'
require 'json'

# seed the ingredients

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read

ingredients = JSON.parse(json)
ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end


#seed the cocktails

5.times do
  Cocktail.create(name: Faker::Kpop.girl_groups)
end

5.times do
  Cocktail.create(name: Faker::Kpop.boy_bands)
end

5.times do
  Cocktail.create(name: Faker::Kpop.solo)
end

