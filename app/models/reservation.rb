class Reservation < ActiveRecord::Base

  attr_writer :current_step

  TYPES = %w[to from round_trip_(To) round_trip_(From)]

  validates_presence_of :event_id, :if => lambda { |o| o.current_step == "first" }

  def steps
    %w[first second third]
  end

  def current_step
    @current_step || steps.first
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

  def round_trip?
    type_of == ('round_trip_(To)' || 'round_trip_(From)')
  end
end

