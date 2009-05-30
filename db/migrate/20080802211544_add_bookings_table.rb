class AddBookingsTable < ActiveRecord::Migration
  def self.up
  	create_table :bookings do |table|
		table.integer :deputation_id, :null => false, :default => 0
		table.integer :church_id
		table.string :status, :limit => 20, :null => false, :default => 'open'
		table.date :date_of
		table.time :time_of
		table.string :meridian, :limit => 2, :null => false, :default => 'pm'
		table.timestamps
	end
  end

  def self.down
  end
end
