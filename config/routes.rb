Rails.application.routes.draw do
  devise_for :users
  resources :expenses
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end
  
    unauthenticated do
      root "pages#index", as: :unauthenticated_root
    end
  end
end
