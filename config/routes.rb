Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/apod', to: "nasa_api#apod"
  
  # Defines the root path route ("/")
  # root "articles#index"
end
