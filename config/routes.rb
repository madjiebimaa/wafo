Rails.application.routes.draw do
  resources :users, param: :_username, except: [:create]
  # resources :merchants, only: [:create] do
  #   resources :items, only: %i[create update]
  # end

  post '/auth/register', to: 'authentication#register'
  post '/auth/login', to: 'authentication#login'

  get '/merchants', to: 'merchants#index'
  post '/merchants', to: 'merchants#create'
  get '/merchants/:merchant_id/items', to: 'merchants#show_items'
  post '/merchants/:merchant_id/items', to: 'merchants#create_item'
  patch '/merchants/:merchant_id/items/:item_id', to: 'merchants#update_item_stock'

  get '/*a', to: 'application#not_found'
end
