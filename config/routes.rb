Rails.application.routes.draw do
  devise_for :users

  root 'users#index'
  resources :users
  resources :foods
  resources :recipes do
    resources :recipe_foods 
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
