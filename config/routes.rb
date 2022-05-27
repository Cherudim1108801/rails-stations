Rails.application.routes.draw do

  get "/movies", to: "movies#list"
  get "/search", to: "movies#search"

  namespace :admin do
    resources :movies
  end

  get '/sheets', to: "sheets#index"

end
