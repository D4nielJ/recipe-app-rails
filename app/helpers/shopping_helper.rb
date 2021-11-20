module ShoppingHelper
  def total_price_all(recipes)
    total_price = 0
    recipes.each do |recipe|
      total_price += recipe.total_price
    end
    total_price
  end
end
