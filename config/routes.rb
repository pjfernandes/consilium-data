Rails.application.routes.draw do
  get 'contact/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available withinthis file, see https://guides.rubyonrails.org/routing.html

  resources :messages

  resources :posts do
    resources :comments
  end

  match '/contacts', to: 'contacts#new', via: 'get'
  resources :messages, only: [:new, :create, :index, :show]

end
