class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    user = current_user
    food = user.foods.new(food_params)

    if food.save
      flash[:notice] = 'Ingredient added it correctly'
      redirect_to foods_path
    else
      flash[:error] = food.errors.messages
      render :new
    end
  end

  def destroy; end

  private

  def food_params
    params.require(:food).permit(:name, :measure_unit, :price)
  end
end
