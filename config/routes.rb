Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise/registrations',
    sessions: 'devise/sessions'
  }
  devise_scope :user do
    authenticated do
    root to: 'foods#index', as: 'user'
    end
    unauthenticated do
      root to: 'welcome#index', as: 'unauthenticated_root'
    end
    get 'users/sign_out', to: 'devise/sessions#destroy'
end
  resources :foods 
  resources :recipes do
    resources :ingredients
end
 
end
