class BibleBooks < ActiveRecord::Base
  establish_connection "ctupc_#{RAILS_ENV}"
  set_table_name 'books'
end
