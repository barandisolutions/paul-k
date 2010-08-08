class Event < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :reservations

  TYPES = %w[to from round_trip_(To) round_trip_(From)]

end

