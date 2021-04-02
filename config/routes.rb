Rails.application.routes.draw do
  
  root "application#root"
  get '/login', to: 'session#new'
  post 'login', to: 'session#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  post '/logout', to: 'session#destroy'
  get '/auth/:provider/callback' => 'session#omniauth'
  namespace :organization, path: '/:org_slug' do 
    resources :orders
    # resources :orders do
    #   resources :products, only: [:new]
    # end
    # resources :products
    # resources :product_materials, only: :destroy
  end 
end
