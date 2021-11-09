Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/bienvenida", to: "home#index"

  root to: "home#index"

  get "articles", to: "articles#index"
  get "articles/new", to: "articles#new" #controlador/accion
  get "articles/:id", to: "articles#show" 
  get "articles/:id/edit", to: "articles#edit"
  patch "articles/:id", to: "articles#update", as: :article
  delete "articles/:id", to: "articles#destroy"

  post "articles", to: "articles#create"
end
