Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :foods
  resources :recipes do
    resources :recipe_foods # create -> redirect_to(user, recipe)
  end

  get 'shopping', to: 'shopping#index'

  root 'public#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
