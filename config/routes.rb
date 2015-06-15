Rails.application.routes.draw do

  # TODO: These get routes doesn't look very good. Do something.
  get ":order/page/:page", to: "movies#index", order: /top_rated|upcoming|now_playing/
  get ":order", to: "movies#index", order: /top_rated|upcoming|now_playing/, as: :ordered_movies

  resources :movies, path: "/", only: %w(index) do
    get 'page/:page', action: :index, on: :collection
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  root 'movies#index'
end
