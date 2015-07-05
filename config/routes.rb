Rails.application.routes.draw do

  get 'users' => 'users#index'
  post 'login' => 'users#login'
  get 'users/:id' => 'users#show'
  post 'users' => 'users#create'

end
