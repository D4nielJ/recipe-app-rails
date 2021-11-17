class AddIngredientIndexToRecipeFoods < ActiveRecord::Migration[6.1]
  def change
    add_index :recipe_foods, %i[food_id recipe_id], unique: true
  end
end
