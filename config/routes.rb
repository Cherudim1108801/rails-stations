Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/movies", to: "movies#list"
  get "/search", to: "movies#search"

  namespace :admin do
    resources :movies
  end

end
