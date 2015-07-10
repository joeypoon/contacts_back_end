
Rails.application.routes.draw do
  get 'users/:lat/:lng/:id' => 'users#index', :constraints => { :lng => /.*/, :lat => /.*/ }
  get '/:id/profile' => 'users#show'
  get '/:id/inbound' => 'users#inbound'
  get '/:id/outbound' => 'users#outbound'
  post 'share/:my_id/:user_id' => 'users#share'
  post 'login' => 'users#login'
  post 'users' => 'users#create'

end
