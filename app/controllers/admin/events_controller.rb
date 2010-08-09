class Admin::EventsController < AdminController
  def index
    @events = Event.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.csv { render :csv => @events}
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to admin_event_path(@event)
    else
      render :action => 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    params[:event][:category_ids] ||= []
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to admin_event_path(@event)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to admin_events_url
  end

  def dump_csv
    @events = Event.find(:all)
    @outfile = "members_" + Time.now.strftime("%m-%d-%Y") + ".csv"

    csv_data = FasterCSV.generate do |csv|
      csv << [
      "Title",
      "Type Title",
      "Type Title Show",
      "Type Title",
      "Date Title Show",
      "Time Title",
      "Time Title Show"
      ]
      @events.each do |event|
        csv << [
        event.title,
        event.type_title,
        event.type_title_show,
        event.time_title,
        event.time_title_show,
        event.date_title,
        event.date_title_show
        ]
      end
    end

  send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{@outfile}"
  end
end

