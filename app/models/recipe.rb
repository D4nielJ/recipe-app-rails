class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, :preparation_time, :cooking_time, :description, presence: true
  validates :preparation_time, :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def total_price
    total = 0
    recipe_foods.each do |ingredient| # N + 1 problem
      total += ingredient.quantity * ingredient.food.price
    end
    total
  end
end
