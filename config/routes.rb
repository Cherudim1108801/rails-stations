Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/movies", to: "movies#list"

  get "/admin/movies", to: "admin/movie#index"

  get "/admin/movies/new", to: "admin/movie#new"
  post "/admin/movies", to: "admin/movie#create"

end
