Rails.application.routes.draw do
  
  root to: "dashboard#index"
  get '/rails/info/routes', as: "routes"
  get '/login', to: 'session#new'
  post 'login', to: 'session#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  post '/logout', to: 'session#destroy'
  get '/auth/:provider/callback' => 'session#omniauth'

   
  resources :users, only: %i[create edit show update destroy] do 
    resources :organizations, only: [:new, :create]
  end

  namespace :organization, path: '/:org_slug' do 
    root to: "dashboard#index"
    post "/logout", to: "session#destroy"
    resources :dashboard, only: [:create, :destroy]
    resources :orders do
      resources :products, only: [:new, :index]
    end
    resources :products
    resources :product_materials, only: :destroy
  end 
end
