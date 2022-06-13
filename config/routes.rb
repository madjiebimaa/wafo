Rails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/register', to: 'authentication#register'
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
