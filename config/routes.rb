Rails.application.routes.draw do

  get 'users/:lat/:lng/:id' => 'users#index', :constraints => { :lng => /.*/, :lat => /.*/ }
  get '/:id/profile' => 'users#show'
  get '/:id/inbound' => 'users#inbound'
  get '/:id/outbound' => 'users#outbound'
  get '/:id/contacts' => 'users#contact_list'
  post 'share/:id/:user_id' => 'users#share'
  post 'update' => 'users#update'
  post 'login' => 'users#login'
  post 'users' => 'users#create'

end
