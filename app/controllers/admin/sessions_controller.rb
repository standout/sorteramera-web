class Admin::SessionsController < ApplicationController
  layout 'admin'

  def index
  end

  def new
  end

  def create
    current_user = User.find_by(email: params[:user]).try(:authenticate, params[:password])

    if current_user
      session[:user_id] = current_user.id
      redirect_to admin_dashboard_index_path
    else
      redirect_to :back, alert: 'Fel användarnamn eller lösenord, var vänlig försök igen!'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_admin_session_path
  end
end
