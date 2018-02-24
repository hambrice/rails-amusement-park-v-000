Rails.application.routes.draw do
get '/', to: "welcome#home", as: :root

get '/signin', to: "welcome#signin", as: :signin

post '/signin', to: "welcome#create"

post '/logout', to: "welcome#destroy", as: :logout

resources :users
resources :attractions
resources :rides, only: [:new, :create]

end
