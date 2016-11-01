class Admin::SessionsController < ApplicationController
  layout 'admin'

  def index
  end

  def new
  end

  def create
    admin_token = APIInteraction.get_token(params[:email], params[:password])

    if admin_token
      session[:admin_token] = admin_token
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
