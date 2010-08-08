class Admin::UsersController < AdminController

  def index
    @users = User.find(:all)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to admin_user_path(@user)
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "User Updated"
      redirect_to admin_user_path(@user)
    else
      flash[:error] = "Update error"
      render 'edit'
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User destroyed."
    redirect_to admin_users_path
  end
end

