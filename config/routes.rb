Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/movies", to: "movies#index"

  get "/admin/movies", to: "admin/movies#adminindex"

  get "/admin/movies/new", to: "admin/movies#new"
  post "/admin/movies", to: "admin/movies#adminindex"
  
end
