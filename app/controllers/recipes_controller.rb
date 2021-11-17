class RecipesController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index
    user = current_user
    @recipes = Recipe.where(user_id: user.id)
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @foods = RecipeFood.where(recipe_id: @recipe.id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    user = current_user
    recipe = user.recipes.new(recipe_params)

    if recipe.save
      flash[:notice] = 'Recipe created'
      redirect_to recipes_path
    else
      flash[:error] = recipe.errors.messages
      render :index
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      flash[:notice] = 'Recipe removed'
      redirect_to recipes_path
    else
      flash[:error] = recipe.errors.messages
      render :index
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
