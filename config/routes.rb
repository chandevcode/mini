Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  #resources :menu_items
  get "home/index"
  resources :categories
  #resources :orders, only: [:show]


  post "carts/add/:id", to: "carts#add", as: "add_to_cart"
  post "/checkout", to: "orders#create", as: "checkout"
  delete "carts/remove/:id", to: "carts#remove", as: "remove_cart"

  root "home#index"

  namespace :admin do
    resources :menu_items
  end
end
