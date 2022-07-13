Rails.application.routes.draw do
  scope :auth do
    post :register, to: 'authentication#register'
    post :login, to: 'authentication#login'
  end

  resources :users, param: :username, only: %i[index show] do
    post :roles, param: :username, to: 'users#add_role'
  end

  resources :merchants, only: %i[index] do
    get :items, to: 'merchants#show_items'
    post :items, to: 'merchants#create_item'

    resources :items, only: :nothing do
      patch :stock, param: :item_id, to: 'merchants#update_item_stock'
    end
  end

  resources :items, only: %i[index] do
  end

  resources :admins, only: %i[index show] do
  end

  resources :customers, only: %i[index show] do
  end

  get '/*a', to: 'application#not_found'
end
