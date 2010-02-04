class AlterEventsAddRegExpires < ActiveRecord::Migration
  def self.up
    
    execute "ALTER TABLE events ADD reg_expires DATETIME AFTER dateline"

  end

  def self.down
  end
end
