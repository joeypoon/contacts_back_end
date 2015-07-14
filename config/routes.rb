Rails.application.routes.draw do

  get 'users/:lat/:lng/:id' => 'users#index', :constraints => { :lng => /.*/, :lat => /.*/ }
  get 'profile/:id' => 'users#edit'
  get 'inbound/:id' => 'users#inbound'
  get 'outbound/:id' => 'users#outbound'
  get 'contacts/:id' => 'users#contact_list'
  post 'share/:id/:user_id' => 'users#share'
  post 'update' => 'users#update'
  post 'login' => 'users#login'
  post 'users' => 'users#create'

end
