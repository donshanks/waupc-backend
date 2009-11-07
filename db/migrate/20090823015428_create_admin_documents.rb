class CreateAdminDocuments < ActiveRecord::Migration
  def self.up
    create_table :admin_documents do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_documents
  end
end
