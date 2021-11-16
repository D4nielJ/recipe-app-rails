class FoodsController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!

=======
>>>>>>> dev
  def index
    @user = current_user
    @foods = Food.where(user_id: @user.id)
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

  def destroy
    food = Food.find(params[:id])
    if food.destroy
      flash[:notice] = 'Ingredient removed'
      redirect_to foods_path
    else
      flash[:error] = food.errors.messages
      render :index
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measure_unit, :price)
  end
end
