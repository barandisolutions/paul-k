class Admin::TripsController < ApplicationController
  def index
    @admin/trips = Admin::Trip.all
  end
  
  def show
    @admin/trip = Admin::Trip.find(params[:id])
  end
  
  def new
    @admin/trip = Admin::Trip.new
  end
  
  def create
    @admin/trip = Admin::Trip.new(params[:admin/trip])
    if @admin/trip.save
      flash[:notice] = "Successfully created admin/trip."
      redirect_to @admin/trip
    else
      render :action => 'new'
    end
  end
  
  def edit
    @admin/trip = Admin::Trip.find(params[:id])
  end
  
  def update
    @admin/trip = Admin::Trip.find(params[:id])
    if @admin/trip.update_attributes(params[:admin/trip])
      flash[:notice] = "Successfully updated admin/trip."
      redirect_to @admin/trip
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @admin/trip = Admin::Trip.find(params[:id])
    @admin/trip.destroy
    flash[:notice] = "Successfully destroyed admin/trip."
    redirect_to admin/trips_url
  end
end
