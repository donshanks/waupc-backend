class AddChurchesTable < ActiveRecord::Migration
  def self.up
  	create_table :churches do |table|
		table.string :status, :limit => 20, :null => false, :default => 'active'
		table.string :pastor
		table.string :church_name
		table.integer :section, :limit => 1, :null => false, :default => 0
		table.string :outreach_cities
		table.integer :dist_zip, :null => false, :default => 0
		table.decimal :lat, :precision => 10, :scale => 6
		table.decimal :lon, :precision => 10, :scale => 6
		table.string :physical_address
		table.string :physical_city
		table.string :physical_zip
		table.string :mailing_address
		table.string :mailing_city
		table.string :mailing_zip
		table.string :phone
		table.string :phone2
		table.string :fax
		table.string :email
		table.boolean :show_email, :null => false, :default => false
		table.string :web
		table.integer :owner
		table.string :languages
		table.timestamps
	end
  end

  def self.down
  end
end
