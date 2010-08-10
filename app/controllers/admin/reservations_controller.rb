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

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(params[:reservation])
      flash[:notice] = "Successfully updated reservation."
      redirect_to @reservation
    else
      render :action => 'edit'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "Successfully destroyed reservation."
    redirect_to reservations_url
  end

end

