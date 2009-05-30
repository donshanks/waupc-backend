class AddMissionariesTable < ActiveRecord::Migration
  def self.up
  	create_table :missionaris do |table|
		table.string :name, :limit => 128, :null => false
		table.string :labor, :limit => 128, :null => false
		table.string :phone, :limit => 64
		table.string :email
		table.string :poster
		table.string :website
		table.timestamps
	end
  end

  def self.down
  end
end
