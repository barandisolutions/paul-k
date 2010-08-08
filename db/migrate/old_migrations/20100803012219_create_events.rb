class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.string :type_of
      t.text :note
      t.integer :category_ids
      t.date :date
      t.time :time
      t.string :address
      t.string :city
      t.integer :zipcode
      t.string :user_name
      t.string :email
      t.integer :phone
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

