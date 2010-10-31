ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.resources :comments
  map.resources :posts

  map.resources :comments, :member => {:destroy => :get}
  map.resources :users, :member => {:logout => :get, :search => :get}
  map.resources :posts, :member => {:grade => :get, :search => :get}

  map.root :controller => 'users', :action => 'signin', :id => 1
 
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end
