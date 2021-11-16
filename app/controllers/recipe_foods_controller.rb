class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    user = current_user
    @foods = Food.where(user_id: user.id)
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    recipe_food = RecipeFood.new(recipe_food_params)
    recipe_food.recipe_id = recipe.id

    if recipe_food.save
      flash[:notice] = 'Ingredient added to recipe'
      redirect_to recipes_path
    else
      flash[:error] = recipe_food.errors.messages
      render :new
    end
  end

  private
  
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
