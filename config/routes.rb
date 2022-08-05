Rails.application.routes.draw do

  get "/movies", to: "movies#list"
  get "/search", to: "movies#search"

  get "/movies/:id", to: "movies#show"

  namespace :admin do
    resources :movies
  end

  get '/sheets', to: "sheets#index"

end
