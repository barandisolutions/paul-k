class CalendersController < ApplicationController
  def index
    @event = params[:event]
    @trips = Trip.find(:all,
            :conditions => { :event_id => @event})
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

  def show
    @calender = Calender.find(params[:id])
  end

  def new
    @calender = Calender.new
  end

  def create
    @calender = Calender.new(params[:calender])
    if @calender.save
      flash[:notice] = "Successfully created calender."
      redirect_to @calender
    else
      render :action => 'new'
    end
  end

  def edit
    @calender = Calender.find(params[:id])
  end

  def update
    @calender = Calender.find(params[:id])
    if @calender.update_attributes(params[:calender])
      flash[:notice] = "Successfully updated calender."
      redirect_to @calender
    else
      render :action => 'edit'
    end
  end

  def destroy
    @calender = Calender.find(params[:id])
    @calender.destroy
    flash[:notice] = "Successfully destroyed calender."
    redirect_to calenders_url
  end
end

