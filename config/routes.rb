Rails.application.routes.draw do
  root 'application#index'

  resources :users do
    resources :foods
    resources :recipes
  end

  resources :recipe_foods # create -> redirect_to(user, recipe)

  get 'general_shopping_list', to: 'shopping#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
