Rails.application.routes.draw do
  get 'contact/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
  end

  match '/contacts', to: 'contacts#new', via: 'get'
  resources :contacts, only: [:new, :create]
end
