class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.integer :category_id
      t.integer :event_id
      t.string :type_of
      t.date :date
      t.time :time
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :note
      t.timestamps
    end
  end
  
  def self.down
    drop_table :reservations
  end
end
