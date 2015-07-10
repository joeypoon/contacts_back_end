Rails.application.routes.draw do

  get 'users/:id/:lat/:long' => 'users#index'
  get '/:id/profile' => 'users#show'
  get '/:id/inbound' => 'users#inbound'
  get '/:id/outbound' => 'users#outbound'
  post 'share/:id/:user_id' => 'users#share'
  post 'update' => 'users#update'
  post 'login' => 'users#login'
  post 'users' => 'users#create'

end
