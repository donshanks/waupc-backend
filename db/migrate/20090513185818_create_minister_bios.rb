class CreateMinisterBios < ActiveRecord::Migration
  def self.up
    create_table :minister_bios do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :minister_bios
  end
end
