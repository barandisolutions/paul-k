class Admin::ReservationsController < AdminController

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
    @event = Event.find(@reservation.event_id)
  end

end

