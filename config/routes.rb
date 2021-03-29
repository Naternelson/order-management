Rails.application.routes.draw do
  resources :orders do
    resources :products, only: [:new]
  end
  resources :products
end
