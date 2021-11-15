class User < ApplicationRecord
  has_many :recipes, dependant: :destroy
  has_many :foods, dependant: :destroy
end
