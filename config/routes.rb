Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'things#index'
  resources :things do
    resources :comments, only: :create
    collection do
      get 'search'
      get 'things_search'
    end
  end
  resources :users
end
