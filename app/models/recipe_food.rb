class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :food_id, uniqueness: { scope: :recipe_id, message: 'You have already added this ingreddient' }
  validates :quantity, numericality: { greater_than: 0, message: 'You need to add quantity greater than 0' }
end
