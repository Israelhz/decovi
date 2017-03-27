Rails.application.routes.draw do
  resources :direcciones_entregas
  resources :productos
  get 'pedidos/aprobar' => 'pedidos#aprobar'
  resources :pedidos
  root 'home#index'
  get 'home/about'
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'users/index'
  get "users/aprobar"
  get "users/empresa"
  get "workers/index"
  get "workers/new"
  post 'workers',  to: 'workers#add_user'
  get 'home/about'
  get 'home/productos'
  get 'home/servicios'
  get 'home/contacto'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
