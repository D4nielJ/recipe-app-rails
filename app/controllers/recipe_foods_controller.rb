class RecipeFoodsController < ApplicationController
  include RecipeFoodsHelper
  before_action :authenticate_user!

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = find_recipe_food_available(@recipe)
    @recipe_food = RecipeFood.new
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    recipe_food = RecipeFood.new(recipe_food_params)
    recipe_food.recipe_id = recipe.id

    if recipe_food.save
      flash[:notice] = 'Ingredient added to recipe'
    else
      flash[:error] = recipe_food.errors.messages
    end
    redirect_to recipe_path(id: recipe.id)
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def update
    recipe_food = RecipeFood.find(params[:id])
    recipe = Recipe.find(params[:recipe_id])
    if recipe_food.update(food_update_params)
      flash[:notice] = 'Food modified.'
      redirect_to recipe_path(id: recipe.id)
    else
      flash[:error] = recipe_food.errors.messages
      render :index
    end
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    recipe_food = RecipeFood.find(params[:id])
    if recipe_food.destroy
      flash[:notice] = 'Food removed from recipe'
      redirect_to recipe_path(id: recipe.id)
    else
      flash[:error] = recipe_food.errors.messages
      render :index
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end

  def food_update_params
    params.require(:recipe_food).permit(:quantity)
  end
end
