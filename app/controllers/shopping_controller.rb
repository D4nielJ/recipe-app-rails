class ShoppingController < ApplicationController
  include ShoppingHelper
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
    @foods = Food.where(user_id: current_user.id)
    @total_price = total_price_all(@recipes)
  end
end
