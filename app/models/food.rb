class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, :measure_unit, :price, presence: true
  validates :name, uniqueness: { scope: :user_id, message: 'You have already added this ingreddient' }
  validates :measure_unit,
            inclusion: { in: ['Teaspoon (tsp)', 'Cup (c)', 'Unit (u)', 'Milliliter (ml)', 'Litter (l)',
                              'Milligram (mg)', 'Kilogram (kg)'] }
  validates :price, numericality: :greater_than_or_equal_to

  def quantity_used
    RecipeFood.joins(:food).where(food_id: id).sum('quantity')
  end
end
