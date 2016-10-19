class SocialMedia
  attr_reader :title
  attr_reader :fa_i
  attr_reader :link

  def initialize(fa_i, link, title = "")
    @title = title
    @fa_i = fa_i
    @link = link
  end
end
