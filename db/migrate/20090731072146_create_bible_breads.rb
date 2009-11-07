class CreateBibleBreads < ActiveRecord::Migration
  def self.up
    create_table :bible_breads do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :bible_breads
  end
end
