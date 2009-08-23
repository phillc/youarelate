ActionController::Routing::Routes.draw do |map|
  map.resources :user_sessions

  map.resources :dashboard, :only => :show do |dashboard|
    dashboard.resources :stats, :only => :index
    dashboard.resources :people, :name_prefix => nil
  end

  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.root :controller => "welcome"

end
