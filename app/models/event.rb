class Event < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :reservations

  comma do  # implicitly named :default
    title
    type_title
    note_title
    category_ids
    date_title
    time_title
    address_title
    city_title
    zipcode_title
    first_name_title
    last_name_title
    email_title
    phone_title
    price
    purchaseable
    created_at
    updated_at
  end
end

