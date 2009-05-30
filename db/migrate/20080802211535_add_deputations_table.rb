class AddDeputationsTable < ActiveRecord::Migration
  def self.up
  	create_table :deputations do |table|
		table.integer :missionary_id, :null => false, :default => 0
		table.string :status, :limit => 20, :null => false, :default => 'active'
		table.date :date_start
		table.date :date_end
		table.string :method_of_travel, :limit => 128
		table.string :accomodations, :limit => 128
		table.integer :number_in_party, :limit => 5, :null => false, :default => 1
		table.timestamps
	end
  end

  def self.down
  end
end
