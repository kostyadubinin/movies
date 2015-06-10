Rails.application.routes.draw do
  # movies
  get ":order", to: "movies#index", order: /top_rated|upcoming|now_playing/, as: :ordered_movies
  resources :movies, path: "/", only: %w(index)

  # auth
  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  root 'movies#index'
end
