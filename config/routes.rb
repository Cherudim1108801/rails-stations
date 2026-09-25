Rails.application.routes.draw do

  get "/movies", to: "movies#index"
  #get "/search", to: "movies#search"
  get "/movies/:id", to: "movies#show"
  get "/movies/:id/reservation", to: "movies#reservation", as: "movie_reservation"
  get "/seats", to: "seats#index"
  get "/movies/:movie_id/schedules/:schedule_id/reservation/:seat_id/new", to: "reservations#new", as: "new_reservation"
  post "/reservations", to: "reservations#create", as: "create_reservation"

  namespace :admin do
    resources :movies
    resources :schedules
    resources :seats
        get "/movies/:id", to: "movies#show"
        get "/schedules/:id", to: "schedules#show"
  end

  get '/sheets', to: "sheets#index"

end
