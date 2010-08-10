class Trip < ActiveRecord::Base
  has_many :reservations
  belongs_to :events
end

