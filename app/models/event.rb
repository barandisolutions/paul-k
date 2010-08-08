class Event < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :reservations

  TYPES = %w[one_way round_trip]

end

