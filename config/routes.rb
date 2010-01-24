ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.root :controller => "users"
end
