class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :food_id, uniqueness: { scope: :recipe_id, message: 'You have already added this ingreddient' }
end
