class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @reservation = Reservation.new
    @event = Event.find(@trip.event_id)
    session[:event_trips] = @event.id
  end

  def reserve
    @reservation = Reservation.new(params[:'/trips/reserve'])
    @reservation.event_id = session[:event_trips]
    if @reservation.save
      redirect_to @reservation
      session[:event_trips] = nil
    else
      render 'show'
    end
  end
end

