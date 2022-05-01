Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/movies", to: "movies#list"

  namespace :admin do
    get "/movies", to: "movies#index"

    get "/movies/new", to: "movies#new"
    post "/movies", to: "movies#create"
  end

end
