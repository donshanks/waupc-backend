class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.string   :txn_id,   :limit => 17,  :default => nil
      t.string   :event,    :limit => 50,  :null => false
      t.string   :invoice,  :limit => 50,  :null => false
      t.string   :name,     :limit => 100, :null => false
      t.string   :address,  :limit => 200
      t.string   :city,     :limit => 100
      t.string   :state,    :limit => 2
      t.string   :postal,   :limit => 10
      t.string   :phone,    :limit => 30
      t.string   :email,    :limit => 200
      t.string   :church,   :limit => 100
      t.string   :pastor,   :limit => 200
      t.string   :method,   :limit => 25,  :null => false, :default => 'online'
      t.boolean  :paid,     :null => false, :default => false
      t.datetime :paid_date
      t.float    :paid_amt, :precision => 4, :scale => 2, :null => false, :default => 0
      t.float    :paid_fee, :precision => 4, :scale => 2, :null => false, :default => 0
      t.text     :reference
      t.boolean  :paid,     :null => false, :default => false
      t.timestamps
    end

    execute "ALTER TABLE registrations ENGINE=MyISAM"

    add_index :registrations, :event

  end

  def self.down
    drop_table :registrations
  end
end
