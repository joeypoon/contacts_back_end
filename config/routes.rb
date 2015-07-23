Rails.application.routes.draw do

  get 'users/:lat/:lng/:id' => 'users#index', :constraints => { :lng => /.*/, :lat => /.*/ }
  get 'profile/:id' => 'users#edit'
  get 'inbound/:id' => 'users#inbound'
  get 'outbound/:id' => 'users#outbound'
  get 'contacts/:id' => 'users#contact_list'
  get 'contacts/profile/:id/:user_id' => 'users#show'
  post 'share/:id/:user_id' => 'users#share'
  post 'update' => 'users#update'
  post 'login' => 'users#login'
  post 'users' => 'users#create'
  delete 'inbound/:id/:user_id' => 'users#destroy_inbound'
  delete 'outbound/:id/:user_id' => 'users#destroy_outbound'
  delete 'contacts/:id/:user_id' => 'users#destroy_contact'

end
