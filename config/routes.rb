Rails.application.routes.draw do
  root to: "link#index"

  get "/register", to: "user#new"
  get "/login", to: "session#new"

  resources :user, only: [:create]
end
