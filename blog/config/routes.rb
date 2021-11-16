Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/bienvenida", to: "home#index"

  root to: "home#index"

  get "articles/user/:user_id", to: "articles#from_author"
=begin
  resource :articles do
    get "user/:user_id", to: "articles#from_author", on: :collection #:members
  end
=end
  get "articles", to: "articles#index" #todos los articulos
  get "articles/new", to: "articles#new", as: :new_articles #controlador/accion # vista de formulario create
  get "articles/:id", to: "articles#show" #mostrar un artículo
  get "articles/:id/edit", to: "articles#edit" #editar un artículo
  patch "articles/:id", to: "articles#update", as: :article #actualizar un artículo
  delete "articles/:id", to: "articles#destroy" #eliminar un nuevo artículo
  post "articles", to: "articles#create" #crear un nuevo artículo

end
