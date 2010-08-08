class UsersController < ApplicationController

  before_filter :login_required, :only => [:edit, :udpate]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "User Updated"
      redirect_to @user
    else
      flash[:error] = "Update error"
      render 'edit'
    end
  end
end

