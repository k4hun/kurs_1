class AccessController < ApplicationController

  layout 'admin'

  before_action :check_login, :except => [:login, :log, :logout]  

  def index
  end

  def login
  end

  def log

    if params[:user].present? && params[:password].present?
      admin_check = User.where(:user => params[:user]).first
      if admin_check
        admin_authorization = admin_check.authenticate(params[:password])
      end
    end

    if admin_authorization
      session[:user_id] = admin_authorization.id
      session[:user] = admin_authorization.user
      flash[:notice] = 'Logged in!'
      redirect_to(:action => 'index')
    else
      flash[:notice] = 'Wrong user name or password!'
      redirect_to(:action => 'login')
    end

  end

  def logout
    session[:user_id] = nil
    session[:user] = nil
    flash[:notice] = 'Logged out!'
    redirect_to(:action => 'login')
  end
end
