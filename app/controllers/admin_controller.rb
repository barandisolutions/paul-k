class AdminController < ApplicationController

  before_filter :authenticate, :except => [:login]

  def index
  end

  def login
    if admin?
      redirect_to admin_path
    end

    if request.post?
      @username = params[:username]
      @password = params[:password]
      if @username == ADMIN_AUTHENTICATION_CONFIG[:username] &&
      @password == ADMIN_AUTHENTICATION_CONFIG[:password]
      session[:i_am_admin] = "yup"
        flash[:notice] = "Logged in successfully"
        redirect_to admin_path
      else
        flash.now[:error] = "Invalid username/password"
      end
    end
  end

  def logout
    session[:i_am_admin] = nil
    flash[:notice] = "You've logged out."
    redirect_to root_path
  end

  private

    def authenticate
      if session[:i_am_admin] != "yup"
        flash[:notice] = "Please login to proceed"
        redirect_to admin_login_path and return
      end
    end

end

