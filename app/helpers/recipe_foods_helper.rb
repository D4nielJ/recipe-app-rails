module RecipeFoodsHelper
  def find_recipe_food_available(recipe)
    used = recipe.food_used
    Food.where(user_id: current_user.id).reject { |food| used.include?(food.name) }
  end
end
