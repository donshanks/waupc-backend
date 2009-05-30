class CreateMinisters < ActiveRecord::Migration
  def self.up
    create_table :ministers do |t|
      t.string :bio_id
      t.string :status
      t.string :lastname
      t.string :firstname
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :address2_type
      t.string :address2
      t.string :city2
      t.string :state2
      t.string :zip2
      t.string :title
      t.string :phone_home
      t.string :phone_mobile
      t.string :phone_fax
      t.string :email
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :ministers
  end
end
