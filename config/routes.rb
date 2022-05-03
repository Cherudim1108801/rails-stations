Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/movies", to: "movies#list"

  get "/admin/movies", to: "admin/movies#index"

  get "/admin/movies/new", to: "admin/movies#new"
  post "/movies", to: "admin/movies#create"

  get "/admin/movies/:id", to: "admin/movies#edit"

end
