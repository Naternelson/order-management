Rails.application.routes.draw do
  resources :orders do
    resources :products, only: [:new]
  end
  resources :products
  resources :product_materials, only: :destroy
end
