class CreateStreams < ActiveRecord::Migration
  def self.up
    create_table :streams do |t|
      t.integer :event_id, :null => false
      t.string  :name,     :limit => 100, :null => false
      t.string  :src,      :limit => 100
      t.integer :width
      t.integer :height
      t.date    :date_of,  :null => false
      t.text    :note 
      t.timestamps
    end

    execute "ALTER TABLE streams ENGINE=MyISAM"

    add_index :streams, :event_id

    execute "CREATE FULLTEXT INDEX desc_ft_idx ON streams( note(500) )"
  end

  def self.down
    drop_table :streams
  end
end
