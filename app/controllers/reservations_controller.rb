class ReservationsController < ApplicationController

  def show
    @reservation = Reservation.find(params[:id])
    @event = Event.find(@reservation.event_id)
  end

  def reserve
    @reservation = Reservation.new(params[:reservation])
    if @reservation.save
      flash[:notice] = "Successfully created reservation."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def new
    @categories = Category.all
    session[:reservation_params] ||= {}
    @reservation = Reservation.new(session[:reservation_params])
    @reservation.current_step = session[:reservation_step]
    @event = session[:event] if @event.nil?
  end

  def create
    @categories = Category.all
    session[:reservation_params].deep_merge!(params[:reservation]) if params[:reservation] && session[:reservation_params]
    @reservation = Reservation.new(session[:reservation_params])
    if @reservation.event_id
      @event = Event.find(@reservation.event_id)
      session[:event] = @event
    else
      @event = session[:event]
    end
    @reservation.current_step = session[:reservation_step]
    if @reservation.valid?
      if params[:back_button]
        @reservation.previous_step
      elsif @reservation.last_step?
        @reservation.save if @reservation.all_valid?
      else
        @reservation.next_step
      end
      session[:reservation_step] = @reservation.current_step
    end
    if @reservation.new_record?
      render 'new'
    else
      session[:reservation_step] = session[:reservation_params] = nil
      flash[:notice] = "Successfully created reservation."
      redirect_to @reservation
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

  def dump_csv
    @reservations = Reservation.find(:all)
    @outfile = "members_" + Time.now.strftime("%m-%d-%Y") + ".csv"

    csv_data = FasterCSV.generate do |csv|
      csv << [
      "Date",
      "Address"
      ]
      @reservations.each do |reservation|
        csv << [
        reservation.date,
        "\n",
        reservation.address
        ]
      end
    end

  send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{@outfile}"
  end
end

