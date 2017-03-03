Rails.application.routes.draw do
  resources :empleados
  devise_for :users
  root 'home#index'
  get 'home/about'
  get 'home/productos'
  get 'home/servicios'
  get 'home/contacto'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
