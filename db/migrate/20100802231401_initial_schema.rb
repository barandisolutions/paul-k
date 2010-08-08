class InitialSchema < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :password_hash
      t.string :password_salt
      t.timestamps
    end

    create_table :categories do |t|
      t.string :title
      t.string :url
      t.timestamps
    end

    create_table :events do |t|
      t.string :title
      t.boolean :title_show
      t.string :type_title
      t.boolean :type_title_show
      t.string :note_title, :default => 'Note: '
      t.boolean :note_title_show
      t.integer :category_ids
      t.boolean :category_ids_show
      t.string :date_title, :default => 'Date: '
      t.boolean :date_title_show
      t.string :time_title, :default => 'Time: '
      t.boolean :time_title_show
      t.string :address_title, :default => 'Address: '
      t.boolean :address_title_show
      t.string :city_title, :default => 'City: '
      t.boolean :city_title_show
      t.string :zipcode_title, :default => 'Zipcode: '
      t.boolean :zipcode_title_show
      t.string :first_name_title, :default => 'First Name: '
      t.boolean :first_name_title_show
      t.string :last_name_title, :default => 'Last Name: '
      t.boolean :last_name_title_show
      t.string :email_title, :default => 'Email: '
      t.boolean :email_title_show
      t.string :phone_title, :default => 'Phone: '
      t.boolean :phone_title_show
      t.integer :price
      t.boolean :purchaseable
      t.timestamps
    end

    create_table :categories_events, :id => false do |t|
      t.integer :event_id
      t.integer :category_id
    end

    create_table :reservations do |t|
      t.integer :category_id
      t.integer :event_id
      t.string :type_of
      t.date :date
      t.date :date_round
      t.time :time
      t.time :time_round
      t.string :address
      t.string :address_round
      t.string :city
      t.string :city_round
      t.string :zipcode
      t.string :zipcode_round
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone
      t.text :note
      t.timestamps
    end

    Category.create!(:title => "Category 1")
    Category.create!(:title => "Category 2")

    Event.create!(:title => 'Event 1',
                  :category_ids => '1')
    Event.create!(:title => 'Event 2',
                  :category_ids => '1')
    Event.create!(:title => 'Event 3',
                  :category_ids => '2')
    Event.create!(:title => 'Event 4',
                  :category_ids => '2')

    Reservation.create!(:event_id => '1')
    Reservation.create!(:event_id => '2')

  end

  def self.down
    drop_table :users
    drop_table :categories
    drop_table :events
    drop_table :categories_events
    drop_table :reservations
  end
end

