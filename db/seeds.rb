

require 'open-uri'
require 'json'

# seed the ingredients

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read

ingredients = JSON.parse(json)
ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end


