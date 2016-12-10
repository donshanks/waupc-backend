ActionController::Routing::Routes.draw do |map|

  map.foriegn_missions 'foreign_missions', :controller => 'reservations', :action => 'foreign_missions'

  map.with_options :controller => 'reservations' do |m|
    m.show_reservations  '/reservations',               :action => 'index'
    m.show_deputation    '/reservations/:dep_id',       :action => 'show' 
    m.book_reservation   '/reservations/book/:book_id', :action => 'book' 
    m.update_reservation '/reservation/update',         :action => 'update'
  end
  
  map.booking_notify 'bookings/notify/:id', 
                     :path_prefix => '/admin', 
                     :controller  => 'admin/bookings', 
                     :action      => 'notify'

  map.with_options :path_prefix => '/admin' do |m|
    m.resources :bookings,      :controller => 'admin/bookings'
    m.resources :churches,      :controller => 'admin/churches'
    m.resources :deputations,   :controller => 'admin/deputations'
    m.resources :events,        :controller => 'admin/events'
    m.resources :registrations, :controller => 'admin/registrations'
    m.resources :ministers,     :controller => 'admin/ministers'
    m.resources :missionaries,  :controller => 'admin/missionaries'
    m.resource  :users,         :controller => 'admin/users'
    m.auto_complete ':controller/:action', :requirements => { :action => /auto_complete_for_\S+/ }

    # default route
    map.connect '', :controller => 'admin/users', :action => 'welcome', :path_prefix => '/admin'
  end

  map.with_options :controller => 'registrations' do |m|
    m.registrations         '/registrations',                 :action => 'index'
    m.new_registration      '/registrations/new',             :action => "new"
    m.verify_registration   '/registrations/verify',          :action => "verify"
    m.ipn_registration      '/registrations/ipn',             :action => "ipn"
    m.complete_registration '/registrations/complete',        :action => "complete"
    m.cancel_registration   '/registrations/cancel/:invoice', :action => "cancel"
  end

  map.with_options :controller => 'events' do |m|
    m.stream_event   '/events/:key/stream.:format',   :action => 'stream'
    m.archive_event  '/events/:key/archives.:format', :action => 'archive'
    m.gallery_event  '/events/:key/gallery.:format',  :action => 'gallery'
    m.display_event  '/events/:key.:format',          :action => 'show'
    m.display_events '/events.:format',               :action => 'index'
  end

  map.resources :deputations,   :controller => 'deputations'
  map.resources :bookings,      :controller => 'bookings'
  map.resources :churches,  :only => [ :index ]
  map.resources :ministers, :only => [ :index ]

  map.connect   '/ws/bread.php', :controller => 'bread'
  map.connect   'bread', :controller => 'bread'
  map.connect   'bread/:year/:month/:day', 
                :controller => 'bread', 
                :action     => 'lookup_by_date',
                :year       => /\d{4}/,
                :month      => /\d{1,2}/,
                :day        => /\d{1,2}/

  map.login     'login',  :controller => 'admin/users', :action => 'login'
  map.logout    'logout', :controller => 'admin/users', :action => 'logout'

#  map.signup    'signup', :controller => 'admin/users', :action => 'signup'

  map.forgot_password  'forgot_password', :controller => 'admin/users', :action => 'forgot_password'

  # default route
  map.connect   '', :controller => 'admin/users', :action => 'welcome' 

end
