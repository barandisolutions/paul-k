class Admin::TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(params[:trip])
    if @trip.save
      flash[:notice] = "Successfully created trip."
      redirect_to admin_trip_path(@trip)
    else
      render :action => 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(params[:trip])
      flash[:notice] = "Successfully updated trip."
      redirect_to admin_trip_path(@trip)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:notice] = "Successfully destroyed trip."
    redirect_to admin_trips_url
  end
end

