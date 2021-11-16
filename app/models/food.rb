class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, :measure_unit, :price, presence: true
  validates :name, uniqueness: { message: 'You have already added this ingreddient' }, on: :user
  validates :measure_unit,
            inclusion: { in: ['Teaspoon (tsp)', 'Cup (c)', 'Unit (u)', 'Milliliter (ml)', 'Litter (l)',
                              'Milligram (mg)', 'Kilogram (kg)'] }
  validates :price, numericality: :greater_than_or_equal_to
end
