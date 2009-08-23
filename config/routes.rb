ActionController::Routing::Routes.draw do |map|
  map.resource :session

  map.resources :dashboard, :only => :show do |dashboard|
    dashboard.resources :stats, :only => :index
    dashboard.resources :people, :name_prefix => nil
  end

  map.login "login", :controller => "sessions", :action => "new"
  map.logout "logout", :controller => "sessions", :action => "destroy"

  map.root :controller => "welcome"
end
