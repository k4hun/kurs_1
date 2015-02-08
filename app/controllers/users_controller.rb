class UsersController < ApplicationController

  layout 'admin'
  before_action :check_login

  def index
    @users = User.sort
  end

  def new
    #@user = User.new    
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      flash[:notice] = "User created!"
      redirect_to('index')
    else
      render('new')
    end   
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to(:action => 'index', :id => current_user.id)
      flash[:notice] = "User updated!"
    else    
      render('edit')
    end
  end

  def destroy
    current_user.destroy
    redirect_to(:action => 'index')
    flash[:notice] = "User destroyed!"
  end

  def current_user
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :user, :email, :password, :password_confirmation)
  end

end
