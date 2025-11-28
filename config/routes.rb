Rails.application.routes.draw do
  resources :menu_items
  get "home/index"
  resources :categories


  post "carts/add/:id", to: "carts#add", as: "add_to_cart"

  delete "carts/remove/:id", to: "carts#remove", as: "remove_cart"
  root "home#index"

end
