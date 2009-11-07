ActionController::Routing::Routes.draw do |map|

  map.connect 'foreign_missions', 
              :controller => 'deputations', 
              :action     => 'foreign_missions'

  map.with_options :controller => 'reservations' do |m|
    m.show_reservations 'reservations', :action => 'index'
    m.show_deputation   'reservations/:dep_id', :action => 'show' 
    m.book_reservation  'reservations/book/:book_id', :action => 'book' 
    m.update_reservation 'reservation/update', :action => 'update'
  end
  
  map.connect 'bookings/notify/:id', 
              :path_prefix => '/admin', 
              :controller  => 'admin/bookings', 
              :action      => 'notify'

  map.with_options :path_prefix => '/admin' do |m|

    m.resources :documents,    
      :controller => 'admin/documents', 
      :collection => { :create => :post }

    m.resources :bookings,     :controller => 'admin/bookings'
    m.resources :churches,     :controller => 'admin/churches'
    m.resources :deputations,  :controller => 'admin/deputations'
    m.resources :ministers,    :controller => 'admin/ministers'
    m.resources :missionaries, :controller => 'admin/missionaries'
    m.resource  :users,        :controller => 'admin/users'
    
    m.auto_complete ':controller/:action', 
      :requirements => { :action => /auto_complete_for_\S+/ }
    
  end

  map.resources :deputations, :controller => 'deputations'
  map.resources :bookings,    :controller => 'bookings'
  map.resources :churches,    :controller => 'churches'
  
  map.connect 'bread', :controller => 'bread'
  map.connect '/ws/bread.php', :controller => 'bread'
  map.connect 'bread/:year/:month/:day', 
              :controller => 'bread', 
              :action     => 'lookup_by_date',
              :year       => /\d{4}/,
              :month      => /\d{1,2}/,
              :day        => /\d{1,2}/

  map.login   'login',
              :controller => 'admin/users',
              :action     => 'login'
  map.logout  'logout',
              :controller => 'admin/users',
              :action     => 'logout'
#  map.signup  'signup',
#              :controller => 'admin/users',
#              :action     => 'signup'
  map.forgot_password  'forgot_password',
              :controller => 'admin/users',
              :action     => 'forgot_password'

  # default route
  map.connect '', 
              :controller => 'admin/users', 
              :action => 'welcome', 
              :path_prefix => '/admin'

end
