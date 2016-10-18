class PagesController < ApplicationController
  before_action :social_medias
  
  def index
  end

  def api
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
