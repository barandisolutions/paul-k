class Admin::ReservationsController < AdminController

  def index
    @reservations = Reservation.all
     respond_to do |format|
      format.html # index.html.erb
      format.csv do
        response.headers["Content-Type"]        = "text/csv; charset=UTF-8; header=present"
        response.headers["Content-Disposition"] = "attachment; filename=timeline-report.csv"
       end
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @event = Event.find(@reservation.event_id)
    respond_to do |format|
      format.html # index.html.erb
      format.csv { render :csv => @reservation}
    end
  end

end

