class ReservationsController < ApplicationController

  def index
    redirect_to root_url
  end

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
        if @reservation.save
          ReservationMailer.deliver_reservation_email(@reservation)
        end
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
    @reservations = Reservation.all
    @outfile = "members_" + Time.now.strftime("%m-%d-%Y") + ".csv"

    csv_data = FasterCSV.generate do |csv|
      csv << [
        "Event",
        "Type",
        "Note",
        "Date",
        "Time",
        "Address",
        "City",
        "Zipcode",
        "First Name",
        "Last Name",
        "Email",
        "Phone",
        "Field1",
        "Fiedl2",
        "Field3",
        "Reservation type",
        "Reservation date",
        "Reservation time",
        "Reservation address",
        "Reservation city",
        "Reservation zipcde",
        "Reservation first name",
        "Reservation last name",
        "Reservation email",
        "Reservation phone",
        "Reservation field1",
        "Reservation field2",
        "Reservation field3",
        "Reservation note",
      ]
      @reservations.each do |reservation|
        event = Event.find(reservation.event_id)
        csv << [
        event.title,
        event.type_title,
        event.note_title,
        event.date_title,
        event.time_title,
        event.address_title,
        event.city_title,
        event.zipcode_title,
        event.first_name_title,
        event.last_name_title,
        event.email_title,
        event.phone_title,
        event.field1_title,
        event.field2_title,
        event.field3_title,
        reservation.type_of,
        reservation.date,
        reservation.time,
        reservation.address,
        reservation.city,
        reservation.zipcode,
        reserOvation.first_name,
        reservation.last_name,
        reservation.email,
        reservation.phone,
        reservation.field1,
        reservation.field2,
        reservation.field3,
        reservation.note,
        ]
      end
    end

  send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{@outfile}"
  end
end

