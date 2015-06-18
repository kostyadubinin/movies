Rails.application.routes.draw do

  resources :movies, path: "/", only: %w(index) do
    get 'page/:page', action: :index, on: :collection
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  root 'movies#index'
end
