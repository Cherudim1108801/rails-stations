Rails.application.routes.draw do

  get "/movies", to: "movies#index"
  #get "/search", to: "movies#search"
  get "/movies/:id", to: "movies#show"
  get "/seats", to: "seats#index"

  namespace :admin do
    resources :movies
    resources :schedules
    resources :seats
        get "/movies/:id", to: "movies#show"
        get "/schedules/:id", to: "schedules#show"
  end

  get '/sheets', to: "sheets#index"

end
