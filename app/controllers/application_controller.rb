class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :is_logged_in, :require_login
  before_action :social_medias

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_logged_in
    !current_user.nil?
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
