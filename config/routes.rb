Rails.application.routes.draw do
  root to: "link#index"

  get "/register", to: "user#new"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"

  resources :user, only: [:create]
  resources :link, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :link, only: [:update], :defaults => {:format => "json"}
    end
  end
end
