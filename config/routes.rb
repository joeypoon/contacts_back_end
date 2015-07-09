Rails.application.routes.draw do

  get 'users/:lat/:long' => 'users#index'
  # get 'users/:id' => 'users#show' do we even need this?
  post 'share/:my_id/:to_id' => 'users#share'
  post 'login' => 'users#login'
  post 'users' => 'users#create'

end
