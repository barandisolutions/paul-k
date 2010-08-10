class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @reservation = Reservation.new
    @event = Event.find(@trip.event_id)
    session[:i_want] = @event.id
  end

  def reserve
    @reservation = Reservation.new(params[:'/trips/reserve'])
    @reservation.event_id = session[:i_want]
    if @reservation.save
      redirect_to @reservation
    else
      render 'show'
    end
  end
end

