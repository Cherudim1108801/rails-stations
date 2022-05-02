Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/movies", to: "movies#list"

  namespace :admin do
    get "/movies", to: "movie#index"

    get "/movies/new", to: "movie#new"
    post "/movies", to: "movie#create"
  end

end
