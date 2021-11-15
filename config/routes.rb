Rails.application.routes.draw do
  devise_for :users
  root 'public#index'

  resources :users
  resources :foods
  resources :recipes

  resources :recipe_foods # create -> redirect_to(user, recipe)

  get 'shopping', to: 'shopping#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
