class AlterEventsAddLocation < ActiveRecord::Migration
  def self.up
    
    execute "ALTER TABLE events ADD location VARCHAR(100) AFTER name"

  end

  def self.down
  end
end
