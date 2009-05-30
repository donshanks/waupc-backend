ActionController::Routing::Routes.draw do |map|


  map.connect '', :path_prefix => '/admin', :controller => 'admin/users', :action => 'welcome'
  map.connect 'bookings/notify/:id', :path_prefix => '/admin', :controller => 'admin/bookings', :action => 'notify'

  map.with_options :path_prefix => '/admin' do |m|

    m.resources :churches, :controller => 'admin/churches'
    m.resources :bookings, :controller => 'admin/bookings'
    m.resources :deputations, :controller => 'admin/deputations'
    m.resources :missionaries, :controller => 'admin/missionaries'
    m.resources :ministers, :controller => 'admin/ministers'
    m.resource  :users, :controller => 'admin/users'

    m.auto_complete ':controller/:action', :requirements => { :action => /auto_complete_for_\S+/ }
    
  end

  map.resources :deputations, :controller => 'deputations'

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end
