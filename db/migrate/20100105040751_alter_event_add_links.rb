class AlterEventAddLinks < ActiveRecord::Migration
  def self.up
    
    execute "ALTER TABLE events ADD map_link varchar(200) AFTER `desc`"
    execute "ALTER TABLE events ADD hotel_link varchar(200) AFTER `desc`"
    execute "ALTER TABLE events ADD poster_link varchar(200) AFTER `desc`"

  end

  def self.down
  end
end


