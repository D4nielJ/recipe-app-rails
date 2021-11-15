class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependant: :destroy
end
