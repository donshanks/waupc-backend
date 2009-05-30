class CreateMinisterRoles < ActiveRecord::Migration
  def self.up
    create_table :minister_roles do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :minister_roles
  end
end
