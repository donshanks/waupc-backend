class AlterRegistrationsAddValid < ActiveRecord::Migration
  def self.up
    
    execute "ALTER TABLE registrations ADD valid BOOLEAN AFTER reference"

    add_index 'registrations', 'valid'

  end

  def self.down
  end
end

