class AlterEventsAddBrochureLink < ActiveRecord::Migration
  def self.up
    
    execute "ALTER TABLE events ADD brochure_link VARCHAR(200) AFTER map_link"

  end

  def self.down
  end
end

