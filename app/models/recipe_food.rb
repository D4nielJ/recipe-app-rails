class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def ingredients_recipe(recipe, user)
    user_ingredients = []
    recipe_ingredients = []
    RecipeFood.where(recipe_id: recipe.id).each do |r|
      user_ingredients << r.food_id
    end
    Food.where(user_id: user.id).each do |f|
      recipe_ingredients << f unless user_ingredients.include? f.id
    end
    recipe_ingredients
  end
end
