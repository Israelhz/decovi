Rails.application.routes.draw do
  resources :contents
  resources :facturas
  resources :product_orders
  resources :razones_comerciales
  resources :razones_sociales
  resources :direcciones_facturas
  resources :direcciones_entregas
  resources :productos
  get 'pedidos/aprobar' => 'pedidos#aprobar'
  get 'pedidos/produccion' => 'pedidos#produccion'
  get 'pedidos/enviado' => 'pedidos#enviado'
  get 'pedidos/entregado' => 'pedidos#entregado'
  resources :pedidos
  get 'productos_especiales/aprobar' => 'productos_especiales#aprobar'
  resources :productos_especiales
  get 'productos_especiales/index'
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
  get 'home/reportes'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
