class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string  :key,      :limit => 50, :null => false
      t.string  :name,     :limit => 100, :null => false
      t.string  :tagline,  :limit => 100
      t.string  :dateline, :limit => 100
      t.text    :desc 
      t.timestamps
    end

    execute "ALTER TABLE events ENGINE=MyISAM"

    add_index :events, :key

  end

  def self.down
    drop_table :events
  end
end
