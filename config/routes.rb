Rails.application.routes.draw do
  resources :orders
  resources :workers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "orders#index"

end
