class ApplicationController < ActionController::Base
  API_PATH = "http://localhost:3000"

  protect_from_forgery with: :exception

  helper_method :is_logged_in, :require_login
  before_action :social_medias

  def is_logged_in
    session[:admin_token] ? true : false
  end

  def require_login
    if !is_logged_in
      redirect_to new_admin_session_path, alert: "Du är utloggad."
    end
  end

  private
    def social_medias
      @social_medias = [
        SocialMedia.new("fa fa-github fa-2", ""),
        SocialMedia.new("fa fa-instagram", ""),
        SocialMedia.new("fa fa-facebook", ""),
      ]
    end
end
